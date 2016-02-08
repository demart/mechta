package kz.mechta.service;

import java.util.ArrayList;
import java.util.List;

import kz.mechta.models.CityModel;
import kz.mechta.persistence.city.City;
import play.db.jpa.JPA;

public class CityService {

	public static List<City> getCities() {
		return JPA.em().createQuery("from City order by id asc").getResultList();
	}
	
	public static Long getCountCities () {
		return (Long) JPA.em().createQuery("select count(*) from City").getSingleResult();
	}

	public static ArrayList<CityModel> getListCities(List<City> cities) {
		ArrayList<CityModel> models = new ArrayList<CityModel>();
		for (City city: cities) {
			CityModel model = CityModel.buildModel(city);
			models.add(model);
		}
		return models;
	}

}
