package kz.mechta.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import kz.mechta.models.AvailabilityProductModel;
import kz.mechta.models.CharacteristicsProductsModel;
import kz.mechta.models.ImageModel;
import kz.mechta.models.KeyValueCharacteristicsProductsModel;
import kz.mechta.models.ProductModel;
import kz.mechta.models.ResponseWrapper;
import kz.mechta.models.StoreModel;
import kz.mechta.models.StoreWrapper;
import kz.mechta.persistence.store.Store;
import kz.mechta.persistence.category.Category;
import kz.mechta.persistence.city.City;
import kz.mechta.persistence.product.OrderProduct;
import play.db.jpa.JPA;

public class ParseService {

	/**
	 * Собираем ВСЕ категории
	 * @throws IOException
	 */
		public static void parseMainCategories () throws IOException {
			Connection connection1 = Jsoup.connect("http://www.mechta.kz/");
			connection1.request().headers().put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36");
			Document doc = connection1.get();
			/*
			 * Берем все меню, которое находится в шапке сайта, а именно оно состоит
			 * из элементов div class = parent1.
			 */
			Elements elements = doc.select("div.parent1");


			for (Element element : elements) {
				Connection connection = Jsoup.connect("http://www.mechta.kz/catalog/" + Long.parseLong(element.select("a[href]").first().attr("abs:href").substring(29, element.select("a[href]").first().attr("abs:href").length()-1)) + "/");
				connection.request().headers().put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36");
				Document doc2 = connection.get();
				Elements imagesCategory = doc2.select("div.section_div");
				
				/*
				 * Записываем в базу данных главную категорию (которая находится в блоке 
				 * div class = parent1
				 */
				Category category = new Category ();
				category.setName(element.select("a[href]").first().text());
				category.setNumberOnSite(Long.parseLong(element.select("a[href]").first().attr("abs:href").substring(29, element.select("a[href]").first().attr("abs:href").length()-1)));
				category.setDeleted(false);
				category.setImage(imagesCategory.get(1).select("[src]").get(0).attr("abs:src"));
				category.save();
				
				/*
				 * Выделяем элементы div class = inparent2, которые являются второстепенными категориями
				 */
				Elements secondElements = element.select("div.inparent2");
				/*
				 * Тут выделяем все элементы div class = onetabmenu, которые являются категориями третьями уровнями.
				 * НО! На сайте mechta.kz есть одна хитрая фишка.
				 * Если второстепенная категория не содержит в себе категорий третьего уровня,
				 * то она находится в блоке div class = onetabmenu, хоть и является категорией второго уровня.
				 */
				Elements secondOneTabMenuElements = element.select("div.onetabmenu");

		//		System.out.println("http://www.mechta.kz/catalog/" + category.getNumberOnSite() + "/");
		//		System.out.println(imagesCategory.size());
				Integer ind = 0;
				
				for (Element secondElement : secondElements) {
					/*
					 * Заносим в базу данных категории второго уровня
					 */
					Category secondCategory = new Category ();
					secondCategory.setName(secondElement.select("a[href]").first().text());
					secondCategory.setNumberOnSite(Long.parseLong(secondElement.select("a[href]").first().attr("abs:href").substring(29, secondElement.select("a[href]").first().attr("abs:href").length()-1)));
					Category parentCategory = Category.findById(category.getId());
					//System.out.println (ind);
				//	System.out.println (imagesCategory.get(ind).select("[src]"));
					/*
					if (imagesCategory.get(ind).select("[src]").isEmpty())
						System.out.println (imagesCategory.get(ind).select("[src]"));
					else
						secondCategory.setImage(imagesCategory.get(ind).select("[src]").get(0).attr("abs:src"));
					*/
					secondCategory.setCategory(parentCategory);
					secondCategory.setDeleted(false);
					ind++;
					
					secondCategory.save();
					
					/*
					 * Берем все категории третьего уровня, которые лежат в данной категории
					 * второго уровня
					 */
					Elements thirdOneTabMenuElements = secondElement.select("div.onetabmenu");
					
					for (Element thirdElement : thirdOneTabMenuElements) {
						/*
						 * Из списка всех категорий, которые лежат в блоке div class = onetabmenu
						 * удаляем категории третьего уровня, которые лежат в данной категории второго
						 * уровня.
						 * Это сделано для того, что бы выделить оставшиеся категории, которые
						 * по факту являются категориями второго уровня (Данная проблема
						 * была описана выше)
						 */
						secondOneTabMenuElements.remove(thirdElement);
						Category thirdCategory = new Category ();
						thirdCategory.setName(thirdElement.select("a[href]").first().text());
						thirdCategory.setNumberOnSite(Long.parseLong(thirdElement.select("a[href]").first().attr("abs:href").substring(29, thirdElement.select("a[href]").first().attr("abs:href").length()-1)));
						Category parentCategory2 = Category.findById(secondCategory.getId());
						
						thirdCategory.setCategory(parentCategory2);
						thirdCategory.setDeleted(false);
						thirdCategory.save();
					}
					
				}
				
				for (Element secondOneTabMenuElement : secondOneTabMenuElements) {
					/*
					 * Оставшиеся категории, которые были выделены, как категории второго уровня,
					 * а не третьего, добавляем в базу данных.
					 */
					Category secondCategory1 = new Category ();
					secondCategory1.setName(secondOneTabMenuElement.select("a[href]").first().text());
					secondCategory1.setNumberOnSite(Long.parseLong(secondOneTabMenuElement.select("a[href]").first().attr("abs:href").substring(29, secondOneTabMenuElement.select("a[href]").first().attr("abs:href").length()-1)));
					Category parentCategory = Category.findById(category.getId());
					secondCategory1.setCategory(parentCategory);
					secondCategory1.setDeleted(false);
					
				
					secondCategory1.save();
				}
				//System.out.println("*************");				
				for (int i=0; i< imagesCategory.size(); i++) {
				//	System.out.println (Long.parseLong(imagesCategory.select("a[href]").get(i).attr("abs:href").substring(29, imagesCategory.select("a[href]").get(i).attr("abs:href").length()-1)));
					Long num = Long.parseLong(imagesCategory.select("a[href]").get(i).attr("abs:href").substring(29, imagesCategory.select("a[href]").get(i).attr("abs:href").length()-1));
					
					if (imagesCategory.get(i).select("[src]").isEmpty()) {}
						//System.out.println (imagesCategory.get(i).select("[src]"));
					else {
						String image = imagesCategory.get(i).select("[src]").get(0).attr("abs:src");
						JPA.em().createQuery("Update Category set imageUrl = :image where numberOnSite = :num").
						setParameter("image", image).setParameter("num", num).executeUpdate();
					}
				}
				
				
				//System.out.println("---------");					
			}

		}
		
		/**
		 * Парсинг продуктов с категорий 2+ уровня
		 * @param numberOnSiteCategory
		 * @param nameOnSiteCity
		 * @param codeCity
		 * @throws IOException
		 */
		public static StoreWrapper parseProducts (Long numberOnSiteCategory, Long cityId, Integer page, Long typeOrder) throws IOException {
			/*
			 * Просмотр каталога для Астаны идет по ссылке mechta.kz, для этого реализован цикл IF
			 * Для других городов mechta.kz/nameOnSiteCity/catalog/numberOnSiteCategory/?PAGEN_1=page
			 */
			Document doc = null;
			//System.out.println ("Answer: " + StringUtils.isNotEmpty(nameOnSiteCity));
			//System.out.println ("Answer: " + StringUtils.isEmpty(nameOnSiteCity));
			City city = City.findById(cityId);
			OrderProduct orderProduct = OrderProduct.findById(typeOrder);
			if (StringUtils.isEmpty(city.getNameOnSite())) {
				Connection connection = Jsoup.connect("http://www.mechta.kz/catalog/" + numberOnSiteCategory + "/?PAGEN_1=" + page + "&sort=" + orderProduct.getName() + "&adesc=" + orderProduct.getType());
				connection.request().headers().put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36");
				doc = connection.get();
			} else {
				Connection connection = Jsoup.connect("http://www.mechta.kz/" + city.getNameOnSite() + "/catalog/" + numberOnSiteCategory +  "/?PAGEN_1=" + page + "&sort=" + orderProduct.getName() + "&adesc=" + orderProduct.getType());
				connection.request().headers().put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36");
				doc = connection.get();
			}
			/*
			for (int j=0; j<10; j++)
				System.out.println ("");
				*/
			/*
			 * Количество страниц, на которыхх размещается товар категории второго уровню
			 */
			Document doc2 = null;
			if (StringUtils.isNotEmpty(city.getNameOnSite())) {
				Connection connection = Jsoup.connect("http://www.mechta.kz/" + city.getNameOnSite() + "/catalog/" + numberOnSiteCategory + "/"  + "?sort=" + orderProduct.getName() + "&adesc=" + orderProduct.getType());
				connection.request().headers().put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36");
				doc2 = connection.get();
			} else {
				Connection connection = Jsoup.connect("http://www.mechta.kz/catalog/" + numberOnSiteCategory + "/"  + "?sort=" + orderProduct.getName() + "&adesc=" + orderProduct.getType());
				connection.request().headers().put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36");
				doc2 = connection.get();
			}
			
			Elements pages = doc2.select("div.modern-page-navigation");
			
			
			/*
			 * Берем все товары с одной страницы, без картинки, так как картинка заключена
			 * в блок div class = "goodsimage"
			 */
			Elements allProducts = doc.select("div.goodsparam");
			//System.out.println ("Block with all products: " + allProducts.size() + " on page " + page);
			
			/*
			 * В данном массиве будем хранить картинки
			 */
			Elements allImagesOfProducts = doc.select("div.goodsimage");
			//System.out.println ("Block with images all products: " + allImagesOfProducts.size() + " on page " + page);
			
			/*
			 * Теперь заполняем модели товаров на данной странице 
			 */
			ArrayList<ProductModel> models = new ArrayList<ProductModel>();
			Integer index = 0;
			for (Element product : allProducts) {
				
				String url = null;
				if (StringUtils.isNotEmpty(city.getNameOnSite()))
					url = "http://www.mechta.kz/" + city.getNameOnSite() + "/catalog/" + numberOnSiteCategory  + "/";
				else
					url = "http://www.mechta.kz/catalog/" + numberOnSiteCategory  + "/";
				
				//System.out.println ("-----");
				//System.out.println ("Number product on page: " + (index + 1));
				//System.out.println("Number product: " + product.select("a[href]").first().attr("abs:href").substring(url.length(), product.select("a[href]").first().attr("abs:href").length() - 1));
				//System.out.println("Name product: " + product.select("a[href]").first().text());
				//System.out.println("Img: " + allImagesOfProducts.get(index).select("[src]").get(0).attr("abs:src"));
				//System.out.println("Cost: " + product.select("div.m4_fleft").first().text());
				//System.out.println("Description: " + product.select("div.m4_font110").first().text());
				
				/*
				 * Сбор информации о наличие. Вначале собираем места, а затем количество.
				 */
				Elements places = product.select("table.m4_tablenal");
				Elements counts = product.select("div.nal_m, div.nal_s, div.nal_b, div.nal_1");
				//System.out.println("Places: " + places.select("a[href]").size() + "  Counts: " + counts.size());
				
				ArrayList<AvailabilityProductModel> modelsAvailabilityProduct = new ArrayList<AvailabilityProductModel>();
				for (int i = 0; i < counts.size(); i++) {
					//System.out.println("Place: " + places.select("a[href]").get(i).text());
					List<Store> stores = ParseService.searchStore(places.select("a[href]").get(i).text());
					for (Store store : stores) {
						StoreModel modStore = StoreModel.buildModel(store.getId(), store.getName(), 
								store.getLatitude(), store.getLongitude(), store.getSchedule(), 
									store.getTelephones());
						AvailabilityProductModel model = AvailabilityProductModel.buildModelWithStore(modStore, counts.get(i).text());
						modelsAvailabilityProduct.add(model);
					}
					//AvailabilityProductModel model = AvailabilityProductModel.buildModel(places.select("a[href]").get(i).text(), 
						//	counts.get(i).text());

					//System.out.println (model);

				}
				
				/*
				 * Блок if отвечает за товары, которых нет в наличие. Соответветственно цена =0
				 * описание null, наличие null
				 * Else отвечает за то, если товар есть в наличие.
				 * В блоке else может получится такая ситуация, что будет две цены, а именно
				 * одна черного цвета (перечеркнута), а вторая красная (новая). И парсится эти две цены,
				 * поэтому там сплошные обрезания цен, что в итоге остается только красная
				 */
				
				/*
				 * Предыдущая цена
				 */
				Integer previousCost = null;
				if (product.select("span.m4_prs18").size() != 0)
					previousCost = Integer.parseInt(product.select("span.m4_prs18").text().replaceAll(" ", ""));
				
				
				if (StringUtils.isNotEmpty(product.ownText()) == true) {
					ProductModel productModel = ProductModel.buildModel(
							Long.parseLong(product.select("a[href]").first().attr("abs:href").substring(url.length(), product.select("a[href]").first().attr("abs:href").length() - 1)),
							product.select("a[href]").first().text(),
							allImagesOfProducts.get(index).select("[src]").get(0).attr("abs:src"),
							null, 0, null, null, numberOnSiteCategory, previousCost, null);
							models.add(productModel);
				}
				
				else {
						ProductModel productModel = ProductModel.buildModel(
						Long.parseLong(product.select("a[href]").first().attr("abs:href").substring(url.length(), product.select("a[href]").first().attr("abs:href").length() - 1)),
						product.select("a[href]").first().text(),
						allImagesOfProducts.get(index).select("[src]").get(0).attr("abs:src"),
						product.select("div.m4_font110").first().html(), 
						Integer.parseInt(product.select("div.m4_fleft").first().text().substring(0, product.select("div.m4_fleft").first().text().length() - 6).replaceAll(" ", "").substring(product.select("div.m4_fleft").first().text().substring(0, product.select("div.m4_fleft").first().text().length() - 6).replaceAll(" ", "").lastIndexOf(".") + 1)),
						modelsAvailabilityProduct, null, numberOnSiteCategory, previousCost, null);
						models.add(productModel);
				}
				index++;
				//ProductModel model = ProductModel.buildModel(product.select("a[href]").first().attr("abs:href").substring(url.length(), product.select("a[href]").first().attr("abs:href").length() - 1), name, imageUrl);
			}
			
			/*
			 * Два условия для того, что бывают случаи, когда всего одна страница. Если 
			 * в категории одна страница, то выполняется блок if
			 */
			Integer countOfPages = null;
			
			if (pages.select("a[href]").size() == 0)
				countOfPages = 1;
			else if (pages.select("a[href]").size() > 1)
				countOfPages = Integer.parseInt(pages.select("a[href]").get(pages.select("a[href]").size() - 2).text());
			/*
			else
				Integer.parseInt(pages.select("a[href]").get(pages.select("a[href]").size()).text());
			*/
			StoreWrapper store = StoreWrapper.buildModel(page,
					countOfPages,
					allProducts.size(), models);
			
			return store;
		}
		
		/**
		 * Парсинг определенного товара
		 * @param numberOnSiteCategory
		 * @param cityId
		 * @param numberOnSite
		 * @return
		 * @throws IOException
		 */
		public static ProductModel parseProductInformation (Long numberOnSiteCategory, Long cityId, Long numberOnSite) throws IOException {
			/*
			 * Аналогично как при парсинге всех товаров каталога
			 */
			Document doc = null;
			City city = City.findById(cityId);
			if (StringUtils.isEmpty(city.getNameOnSite())) {
				Connection connection = Jsoup.connect("http://www.mechta.kz/catalog/" + numberOnSiteCategory + "/" + numberOnSite + "/");
				connection.request().headers().put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36");
				doc = connection.get();
			} else {
				Connection connection = Jsoup.connect("http://www.mechta.kz/" + city.getNameOnSite() + "/catalog/" + numberOnSiteCategory +  "/" + numberOnSite + "/");
				connection.request().headers().put("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36");
				doc = connection.get();
			}

			/*
			 * название товара
			 */
			String nameOfProduct = doc.title().substring(0, doc.title().lastIndexOf("-"));
			
			/*
			 * Цена товара
			 */
			Integer cost = null;
			System.out.println(doc.getElementsByClass("span.m4_prs30").size());
			if (StringUtils.isNotEmpty(doc.select("span.m4_prs30").first().text()))
				cost = Integer.parseInt(doc.select("span.m4_prs30").first().text().substring(0, doc.select("span.m4_prs30").first().text().length()).replaceAll(" ", ""));
					/*
			 * Ссылка на картинку
			 */
			String url = null;
			if (cost != null)  {
				if (doc.select("div.gal_more_photo").size() == 0) {
					
				}
				else
				url = doc.select("div.gal_more_photo").first().select("[src]").get(0).attr("abs:src");
			}
			/*
			 * Предыдущая цена
			 */
			Integer previousCost = null;
			if (doc.select("span.m4_prs18").size() != 0 && cost != null)
				previousCost = Integer.parseInt(doc.select("span.m4_prs18").text().replaceAll(" ", ""));
			
			
			/*
			 *Наличий товара 
			 */
			
			Elements places = doc.select("table.m4_tablenal");
			Elements counts = doc.select("div.nal_m, div.nal_s, div.nal_b, div.nal_1");
			ArrayList<AvailabilityProductModel> modelsAvailabilityProduct = new ArrayList<AvailabilityProductModel>();
			if (cost != null) {
				for (int i = 0; i < counts.size(); i++) {
					List<Store> stores = ParseService.searchStore(places.select("a[href]").get(i).text());
					for (Store store : stores) {
						StoreModel modStore = StoreModel.buildModel(store.getId(), store.getName(), 
								store.getLatitude(), store.getLongitude(), store.getSchedule(), 
									store.getTelephones());
					//	System.out.println("Place: " + places.select("a[href]").get(i).text() + " count: " + counts.get(i).text());
					AvailabilityProductModel model = AvailabilityProductModel.buildModelWithStore(modStore, counts.get(i).text());
					modelsAvailabilityProduct.add(model);
					}
				}
			}
			
			/*
			 * Описание товара
			 */
			String description = null;
			if (cost != null) {
				if (doc.select("div.detailtext").size() != 0)
					description= doc.select("div.detailtext").first().html();
			}

			/*
			 * Блок отвечающий парсингу характеристик товара
			 */
			ArrayList<CharacteristicsProductsModel> characteristics = new ArrayList<CharacteristicsProductsModel> ();
			ArrayList<ImageModel> images = new ArrayList<ImageModel>();

			if (cost != null) {
				Elements resultLinks = doc.select("div.catalog-element > div.m4_pred > div");
				System.out.println("Size: " + resultLinks.size());
				
				String nameGroup = null;
				CharacteristicsProductsModel charact = new CharacteristicsProductsModel();
				ArrayList<KeyValueCharacteristicsProductsModel> array = new ArrayList<KeyValueCharacteristicsProductsModel>();
				array = null;

				Integer sizeOfBlock = resultLinks.size();
				Integer count = 0;
				for (Element el: resultLinks) {
					count++;
					//System.out.println(el.className());
					if (el.className().equals("m4_pgdiv1 m4_font110 aclear")) {
						KeyValueCharacteristicsProductsModel key = KeyValueCharacteristicsProductsModel.
								buildModel(el.select("div.m4_pgdiv").get(0).text(), el.select("div.m4_pgdiv").get(1).text());
						array.add(key);
						if (count == sizeOfBlock) {
							charact = CharacteristicsProductsModel.buildModel(nameGroup, 
									array);
							characteristics.add(charact);
						}
					}
					
					if (el.className().equals("m4_pgdiv0 m4_font110 aclear")) {
						KeyValueCharacteristicsProductsModel key = KeyValueCharacteristicsProductsModel.
								buildModel(el.select("div.m4_pgdiv").get(0).text(), el.select("div.m4_pgdiv").get(1).text());
						array.add(key);
						
						if (count == sizeOfBlock) {
							charact = CharacteristicsProductsModel.buildModel(nameGroup, 
									array);
							characteristics.add(charact);
						}
					}
					
					else if (el.className().equals("m4_pgtitle m4_font110")) {
						if (array != null) {
							charact = CharacteristicsProductsModel.buildModel(nameGroup, 
									array);
							characteristics.add(charact);
						}
						nameGroup = el.text();
						charact = new CharacteristicsProductsModel();
						array = new ArrayList<KeyValueCharacteristicsProductsModel>();
						
					}
					
					
				}
				

				for (int i=0; i<doc.select("div.more_photo").size(); i++) {
					ImageModel model = new ImageModel();
					model.setImage(doc.select("div.more_photo").get(i).select("[src]").get(0).attr("abs:src"));
					images.add(model);
				}
					
				
			}
			
			ProductModel model = ProductModel.buildModel(numberOnSite, nameOfProduct, url, description, cost, 
					modelsAvailabilityProduct, characteristics, numberOnSiteCategory, previousCost, images);
			return model;
		}
		
		public static List<Store> searchStore (String text) {
			return JPA.em().createQuery("from Store where lower(name) like lower(:text)").
					setParameter("text", "%" + text + "%").getResultList();
		}
		
		/*
		public static void testParse () throws IOException {
			Document doc = Jsoup.connect("http://www.mechta.kz/catalog/5100/").get();
			Elements allProducts = doc.select("div.goodsparam");
			for (Element prod: allProducts) {
				System.out.println ("Text: " + StringUtils.isNotEmpty(prod.ownText()));
			}
		}
		*/
}
