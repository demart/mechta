package kz.mechta.models;

import java.util.List;

public class StoreWrapper {

	private Integer countOfPages;
	
	private Integer countOdProductsOnPage;
	
	private List<ProductModel> products;
	
	private Integer currentPage;
	
	public static StoreWrapper buildModel (Integer currentPage, Integer countOfPages, Integer countOdProductsOnPage, List<ProductModel> products) {
		StoreWrapper model = new StoreWrapper();
		model.countOdProductsOnPage = countOdProductsOnPage;
		model.countOfPages = countOfPages;
		model.products = products;
		model.currentPage = currentPage;
		return model;
	}
	
	public Integer getCountOfPages () {
		return countOfPages;
	}
	
	public Integer getCountOdProductsOnPage () {
		return countOdProductsOnPage;
	}
	
	public List<ProductModel> getProducts () {
		return products;
	}
	
	public Integer getCurrentpage () {
		return currentPage;
	}
	
}
