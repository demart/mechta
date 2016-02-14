package kz.mechta.models;

public class NewsModel {
	
	private Long numberOnsite;
	
	private String name;
	
	private String imageUrl;
	
	private String date;
	
	private String description;
	
	private String type;
	
	public static NewsModel buildModel (Long numberOnsite, String name, String imageUrl, String date, String description, String type) {
		NewsModel model = new NewsModel();
		model.name = name;
		model.numberOnsite = numberOnsite;
		model.imageUrl = imageUrl;
		model.description = description;
		model.date = date;
		model.type = type;
		
		return model;
	}
}
