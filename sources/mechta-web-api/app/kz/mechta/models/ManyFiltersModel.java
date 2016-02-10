package kz.mechta.models;

import java.util.List;

public class ManyFiltersModel {
	
	private String name;
	
	private List<KeyValueFilterModel> keyValue;
	
	public static ManyFiltersModel buildModel (String name, List<KeyValueFilterModel> keyValue) {
		ManyFiltersModel model = new ManyFiltersModel();
		model.name = name;
		model.keyValue = keyValue;
		
		return model;
	}

}
