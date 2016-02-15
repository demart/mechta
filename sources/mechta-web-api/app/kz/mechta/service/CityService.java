package kz.mechta.service;

import java.util.ArrayList;
import java.util.List;

import kz.mechta.models.CityModel;
import kz.mechta.models.StoreModel;
import kz.mechta.persistence.city.City;
import kz.mechta.persistence.store.Store;
import play.db.jpa.JPA;

public class CityService {

	public static List<City> getCities() {
		return JPA.em().createQuery("from City where published = 'TRUE' order by id asc").getResultList();
	}
	
	public static Long getCountCities () {
		return (Long) JPA.em().createQuery("select count(*) from City where published = 'TRUE'").getSingleResult();
	}

	public static Long getAllCountCities () {
		return (Long) JPA.em().createQuery("select count(*) from City where deleted = 'FALSE'").getSingleResult();
	}
	
	public static ArrayList<CityModel> getListCities(List<City> cities) {
		ArrayList<CityModel> models = new ArrayList<CityModel>();
		for (City city: cities) {
			CityModel model = CityModel.buildModel(city, null);
			models.add(model);
		}
		return models;
	}
	
	public static List<Store> getStores(Long cityId) {
		return JPA.em().createQuery("from Store where deleted = 'FALSE' and  city.id = :cityId").setParameter("cityId", cityId).getResultList();
	}
	

	public static ArrayList<CityModel> getListStores(List<City> cities) {
		ArrayList<CityModel> models = new ArrayList<CityModel>();
		for (City city : cities) {
			List<Store> stores = CityService.getStores(city.getId());
			ArrayList<StoreModel> storeModels = new ArrayList<StoreModel>();
			for (Store store: stores) {
			StoreModel model = StoreModel.buildModel(store.getId(), store.getName(), 
					store.getLatitude(), store.getLongitude(), store.getSchedule(), 
					store.getTelephones());
			storeModels.add(model);
			}
			CityModel mod = CityModel.buildModel(city, storeModels);
			models.add(mod);
		}
		return models;
	}

}
