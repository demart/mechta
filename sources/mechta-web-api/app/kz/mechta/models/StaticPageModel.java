package kz.mechta.models;

import kz.mechta.persistence.pages.StaticPage;

public class StaticPageModel {
	private Long id;
	
	private String title;
	
	private String content;
	
	private String imageUrl;
	
	public static StaticPageModel buildModel (StaticPage page) {
		StaticPageModel model = new StaticPageModel();
		model.id = page.getId();
		model.content = page.getContent();
		model.imageUrl = page.getImageUrl();
		model.title = page.getTitle();
		
		return model;
	}
}
