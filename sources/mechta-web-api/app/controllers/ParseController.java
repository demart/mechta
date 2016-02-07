package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import kz.mechta.models.CategoryModel;
import kz.mechta.models.CityModel;
import kz.mechta.models.ProductModel;
import kz.mechta.models.ResponseWrapper;
import kz.mechta.models.StoreWrapper;
import kz.mechta.persistence.category.Category;
import kz.mechta.persistence.city.City;
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
	public static void parseProducts(Long numberOnSiteCategory, Long cityId, Integer page) throws IOException {
    	
		//System.out.println(numberOnSiteCategory + "  " + cityId + "  " + page);
		StoreWrapper model = ParseService.parseProducts(numberOnSiteCategory, cityId, page);
    	ResponseWrapper wrapper = new ResponseWrapper();
    	wrapper.data = model.getProducts().toArray();
    	wrapper.countOfPages = model.getCountOfPages();
    	wrapper.countOfProducts = model.getCountOdProductsOnPage();
    	wrapper.currentPage = model.getCurrentpage();
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
	
}
