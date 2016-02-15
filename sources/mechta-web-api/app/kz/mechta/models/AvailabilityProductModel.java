package kz.mechta.models;

import java.util.List;

public class AvailabilityProductModel {
	
	private String name;
	
	private String count;
	
	private StoreModel store;
	
	public static AvailabilityProductModel buildModel (String name, String count) {
		AvailabilityProductModel model = new AvailabilityProductModel();
		model.count = count;
		model.name = name;
		return model;
	}
	
	public static AvailabilityProductModel buildModelWithStore (StoreModel store, String count, String name) {
		AvailabilityProductModel model = new AvailabilityProductModel();
		model.count = count;
		model.name = name;
		model.store = store;
		return model;
	}

}
