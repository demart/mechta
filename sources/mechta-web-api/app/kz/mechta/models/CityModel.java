package kz.mechta.models;

import java.util.List;

import kz.mechta.persistence.city.City;

public class CityModel {

	private Long id;
	private String name;
	private Float latitude;
	private Float longitude;
	private List<StoreModel> stores;
	
	public static CityModel buildModel (City city, List<StoreModel> stores) {
		CityModel model = new CityModel();
		model.id = city.getId();
		model.name = city.getName();
		model.latitude = city.getLatitude();
		model.longitude = city.getLongitude();
		model.stores = stores;
	
		return model;
	}
}
