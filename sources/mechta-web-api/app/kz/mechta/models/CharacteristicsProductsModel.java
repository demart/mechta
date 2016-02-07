package kz.mechta.models;

public class CharacteristicsProductsModel {

		private String key;
		
		private String value;
		
		public static CharacteristicsProductsModel buildModel(String key, String value) {
			CharacteristicsProductsModel model = new CharacteristicsProductsModel();
			
			model.key = key;
			model.value = value;
			
			return model;
		}
}
