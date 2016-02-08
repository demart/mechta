package kz.mechta.models;

public class KeyValueCharacteristicsProductsModel {

	private String key;
	
	private String value;
	
	public static KeyValueCharacteristicsProductsModel buildModel(String key, String value) {
		KeyValueCharacteristicsProductsModel model = new KeyValueCharacteristicsProductsModel();
		
		model.key = key;
		model.value = value;
		
		return model;
	}
}
