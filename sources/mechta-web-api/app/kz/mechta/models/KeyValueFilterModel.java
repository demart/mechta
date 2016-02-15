package kz.mechta.models;

public class KeyValueFilterModel {
	
	private String key;
	
	private String value;
	
	public static KeyValueFilterModel buildModel(String key, String value) {
		KeyValueFilterModel model = new KeyValueFilterModel();
		model.key = key;
		model.value = value;
		return model;
	}
} 
