package kz.mechta.models;

import java.util.ArrayList;

public class CharacteristicsProductsModel {

		private String name;

		ArrayList<KeyValueCharacteristicsProductsModel> keyValue;
		
		public static CharacteristicsProductsModel buildModel(String name, ArrayList<KeyValueCharacteristicsProductsModel> keyValue) {
			CharacteristicsProductsModel model = new CharacteristicsProductsModel();
			
			model.name = name;
			model.keyValue = keyValue;
			
			return model;
		}
}
