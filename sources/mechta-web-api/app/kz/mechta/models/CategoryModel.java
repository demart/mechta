package kz.mechta.models;

import kz.mechta.persistence.category.Category;

public class CategoryModel {

	private Long id;
	
	private Long numberOnSite;
	
	private String name;
	
	private boolean parent;
	
	private boolean children;
	
	public static CategoryModel buildModel (Category category, boolean children) {
		CategoryModel model = new CategoryModel();
		model.id = category.getId();
		model.name = category.getName();
		model.numberOnSite = category.getNumberOnSite();
		if (category.getCategory() == null)
			model.parent = true;
		else
			model.parent = false;
		
		model.children = children;
		return model;
	}
	
}
