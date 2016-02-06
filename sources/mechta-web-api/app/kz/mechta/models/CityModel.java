package kz.mechta.models;

import kz.mechta.persistence.city.City;

public class CityModel {

	private Long id;
	private String name;
	
	public static CityModel buildModel (City city) {
		CityModel model = new CityModel();
		model.id = city.getId();
		model.name = city.getName();
	
		return model;
	}
}
