package kz.mechta.models;

import java.util.List;

public class StoreWrapper {

	private Integer countOfPages;
	
	private Integer countOdProductsOnPage;
		
	private List<ProductModel> products;
	
	private Integer currentPage;
	
	private FilterModel filters;
	
	private List<NewsModel> news;

	
	public static StoreWrapper buildModel (Integer currentPage, Integer countOfPages, Integer countOdProductsOnPage, List<ProductModel> products, FilterModel filters) {
		StoreWrapper model = new StoreWrapper();
		model.countOdProductsOnPage = countOdProductsOnPage;
		model.countOfPages = countOfPages;
		model.products = products;
		model.currentPage = currentPage;
		model.filters = filters;
		return model;
	}
	
	public static StoreWrapper buildNewsModel (Integer currentPage, Integer countOfPages, Integer countOdProductsOnPage, List<NewsModel> news) {
		StoreWrapper model = new StoreWrapper();
		model.countOdProductsOnPage = countOdProductsOnPage;
		model.countOfPages = countOfPages;
		model.news = news;
		model.currentPage = currentPage;

		return model;
	}
	
	public Integer getCountOfPages () {
		return countOfPages;
	}
	
	public FilterModel getFilters () {
		return filters;
	}
	
	public Integer getCountOdProductsOnPage () {
		return countOdProductsOnPage;
	}
	
	public List<ProductModel> getProducts () {
		return products;
	}
	
	public List<NewsModel> getNews () {
		return news;
	}
	
	public Integer getCurrentpage () {
		return currentPage;
	}
	
}
