package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import kz.mechta.models.CategoryModel;
import kz.mechta.models.CityModel;
import kz.mechta.models.OrderProductModel;
import kz.mechta.models.ProductModel;
import kz.mechta.models.ResponseWrapper;
import kz.mechta.models.StoreModel;
import kz.mechta.models.StoreWrapper;
import kz.mechta.persistence.category.Category;
import kz.mechta.persistence.city.City;
import kz.mechta.persistence.product.OrderProduct;
import kz.mechta.persistence.store.Store;
import kz.mechta.service.CategoryService;
import kz.mechta.service.CityService;
import kz.mechta.service.ParseService;
import play.mvc.Controller;

public class ParseController extends Controller {
	
	/**
	 * Парс категории 
	 * Сейчас парсить только один раз!!!
	 * Иначе будут сбои в работе. Старые записи не удаляются. 
	 * @throws IOException
	 */
	public static void parseCategories () throws IOException {
		CategoryService.updateParseCategories();
		System.out.println ("NEXT");
		ParseService.parseMainCategories();
		ResponseWrapper wrapper = new ResponseWrapper();
    	wrapper.success = true;
    	renderJSON(wrapper);
	}
    
	/**
	 * Парсим все товары на указанной странице каталога для указанного города
	 * @param numberOnSiteCategory
	 * @param cityId
	 * @param page
	 * @throws IOException
	 */
	public static void parseProducts(Long numberOnSiteCategory, Long cityId, Integer page, Long typeOrder, String filter, String costLeft, String costRight, Integer countOfFilters) throws IOException {
    	
		System.out.println("Filter: " + filter);
		StoreWrapper model = ParseService.parseProducts(numberOnSiteCategory, cityId, page, typeOrder, filter, costLeft, costRight, countOfFilters);
    	ResponseWrapper wrapper = new ResponseWrapper();
    	wrapper.data = model.getProducts().toArray();
    	wrapper.countOfPages = model.getCountOfPages();
    	wrapper.countOfProducts = model.getCountOdProductsOnPage();
    	wrapper.currentPage = model.getCurrentpage();
    	wrapper.filters = model.getFilters();
    	wrapper.success = true;
    	renderJSON(wrapper);
    }
	
	/**
	 * Получаем список городов
	 */
	public static void readCities () {
    	ResponseWrapper wrapper = new ResponseWrapper();
    	List<City> cities = CityService.getCities();
    	ArrayList<CityModel> models = CityService.getListCities (cities);
    	wrapper.data = models.toArray();
    	wrapper.count = CityService.getCountCities().intValue();
    	wrapper.success = true;
    	renderJSON(wrapper);
	}
	
	/**
	 * Получаем список категорий
	 * @param parentId
	 */
	public static void readCategories (Long parentId) {
    	ResponseWrapper wrapper = new ResponseWrapper();
    	List<Category> categories = CategoryService.getCategories(parentId);
    	//System.out.println (categories.size());
    	ArrayList<CategoryModel> models = CategoryService.getListCategories (categories);
    	wrapper.data = models.toArray();
    	wrapper.count = models.size();
    	wrapper.success = true;
    	renderJSON(wrapper);
	}
	
	/**
	 * Получение всей информации о товаре
	 * @param numberOnSiteCategory
	 * @param cityId
	 * @param numberOnSite
	 * @throws IOException
	 */
	public static void parseProduct (Long numberOnSiteCategory, Long cityId, Long numberOnSite) throws IOException {
		ResponseWrapper wrapper = new ResponseWrapper();
		ProductModel model = ParseService.parseProductInformation(numberOnSiteCategory, cityId, numberOnSite);
		wrapper.data = model;
		wrapper.success = true;
		renderJSON(wrapper);
	}
	
	/**
	 * получение всех сортировок
	 */
	public static void readOrders () {
    	ResponseWrapper wrapper = new ResponseWrapper();
    	List<OrderProduct> orders = CategoryService.getOrder();
    	//System.out.println (categories.size());
    	ArrayList<OrderProductModel> models = CategoryService.getListOrderProduct(orders);
    	wrapper.data = models.toArray();
    	wrapper.count = models.size();
    	wrapper.success = true;
    	renderJSON(wrapper);
	}
	
	/**
	 * список всех магазинов
	 */
	public static void readStores () {
		ResponseWrapper wrapper = new ResponseWrapper();
		List<City> stores = CityService.getCities();
		System.out.println (stores.size());
		ArrayList<CityModel> models = CityService.getListStores(stores);
		System.out.println (models.size());
    	wrapper.data = models.toArray();
    	wrapper.count = CityService.getAllCountCities().intValue();
    	wrapper.success = true;
    	renderJSON(wrapper);
	}
	
	/**
	 * поиск продукта
	 * @param text
	 * @param cityId
	 * @param page
	 * @throws IOException
	 */
	public static void searchProduct (String text, Long cityId, Integer page) throws IOException {
		ResponseWrapper wrapper = new ResponseWrapper();
		StoreWrapper model = ParseService.searchProduct(text, cityId, page);
		wrapper.success = true;
		wrapper.countOfPages = model.getCountOfPages();
		wrapper.countOfProducts = model.getCountOdProductsOnPage();
		wrapper.currentPage = model.getCurrentpage();
		if (model.getProducts() != null)
			wrapper.data = model.getProducts().toArray();
		renderJSON(wrapper);
		
	}
	
	/**
	 * парсинг новостей
	 * @param cityId
	 * @param page
	 * @throws IOException
	 */
	public static void parseNews (Long cityId, Integer page, Integer type) throws IOException {
		ResponseWrapper wrapper = new ResponseWrapper();
		StoreWrapper model = ParseService.searchNews(cityId, page, type);
		wrapper.success = true;
		wrapper.countOfPages = model.getCountOfPages();
		wrapper.countOfNews = model.getCountOdProductsOnPage();
		wrapper.currentPage = model.getCurrentpage();
		if (model.getNews() != null)
			wrapper.data = model.getNews().toArray();
		renderJSON(wrapper);
	}
	
}
