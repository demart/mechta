package kz.mechta.models;

import java.util.List;

public class ProductModel {

	private Long numberOnSite;
	
	private String name;
	
	private String imageUrl;
	
	private String  description;
	
	private Integer cost;
	
	private List<AvailabilityProductModel> productAvailability;
	
	public static ProductModel buildModel (Long numberOnSite, String name, String imageUrl, 
			String description, Integer cost, List<AvailabilityProductModel> productAvailability) {
		ProductModel model = new ProductModel();
		model.imageUrl = imageUrl;
		model.name = name;
		model.numberOnSite = numberOnSite;
		model.description = description;
		model.cost = cost;
		model.productAvailability = productAvailability;
		
		return model;
	}
}
