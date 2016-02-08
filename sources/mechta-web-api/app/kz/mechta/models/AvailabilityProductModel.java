package kz.mechta.models;

public class AvailabilityProductModel {
	
	private String name;
	
	private String count;
	
	public static AvailabilityProductModel buildModel (String name, String count) {
		AvailabilityProductModel model = new AvailabilityProductModel();
		model.count = count;
		model.name = name;
		return model;
	}

}
