package kz.mechta.models;

import java.util.List;

public class FilterModel {
	
	private String costLeft;
	
	private String costRight;
	
	private List<ManyFiltersModel> filters;
	
	public static FilterModel buildModel (String costLeft, String costRight, List<ManyFiltersModel> filters) {
		FilterModel model = new FilterModel();
		model.costLeft = costLeft;
		model.costRight = costRight;
		model.filters = filters;
		
		return model;
	}

}
