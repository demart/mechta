package kz.mechta.models;

import java.util.List;

public class ManyFiltersModel {
	
	private String name;
	
	private Integer index;
	
	private List<KeyValueFilterModel> keyValue;
	
	public static ManyFiltersModel buildModel (String name, Integer index, List<KeyValueFilterModel> keyValue) {
		ManyFiltersModel model = new ManyFiltersModel();
		model.name = name;
		model.index = index;
		model.keyValue = keyValue;
		
		return model;
	}

}
