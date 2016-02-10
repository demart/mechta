package kz.mechta.models;

public class StoreModel {

		private Long id;
		
		private String name;
		
		private Float latitude;
		
		private Float longitude;
		
		private String schedule;
		
		private String telephones;
		
		public static StoreModel buildModel (Long id, String name, Float latitude, Float longitude, 
				String schedule, String telephones) {
			StoreModel model = new StoreModel();
			model.id = id;
			model.name = name;
			model.latitude = latitude;
			model.longitude = longitude;
			model.schedule = schedule;
			model.telephones = telephones;
			return model;
		}
}
