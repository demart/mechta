package kz.mechta.models;

import kz.mechta.persistence.category.Category;

public class CategoryModel {

	private Long id;
	
	private Long numberOnSite;
	
	private String name;
	
	private boolean noParent;
	
	private boolean children;
	
	public static CategoryModel buildModel (Category category, boolean children) {
		CategoryModel model = new CategoryModel();
		model.id = category.getId();
		model.name = category.getName();
		model.numberOnSite = category.getNumberOnSite();
		if (category.getCategory() == null)
			model.noParent = true;
		else
			model.noParent = false;
		
		model.children = children;
		return model;
	}
	
}
