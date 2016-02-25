package kz.mechta.service;

import java.util.ArrayList;
import java.util.List;

import kz.mechta.models.CityModel;
import kz.mechta.models.ServiceStoreModel;
import kz.mechta.models.StoreModel;
import kz.mechta.persistence.city.City;
import kz.mechta.persistence.store.ServiceStore;
import kz.mechta.persistence.store.Store;
import play.db.jpa.JPA;

public class CityService {

	/**
	 * Получение городов, которые есть в выборе
	 * @return
	 */
	public static List<City> getCities() {
		return JPA.em().createQuery("from City where published = 'TRUE' order by id asc").getResultList();
	}
	
	/**
	 * Количеств городов
	 * @return
	 */
	public static Long getCountCities () {
		return (Long) JPA.em().createQuery("select count(*) from City where published = 'TRUE'").getSingleResult();
	}

	/**
	 * Получение всех городов
	 * @return
	 */
	public static Long getAllCountCities () {
		return (Long) JPA.em().createQuery("select count(*) from City where deleted = 'FALSE'").getSingleResult();
	}
	
	/**
	 * Список городов
	 * @param cities
	 * @return
	 */
	public static ArrayList<CityModel> getListCities(List<City> cities) {
		ArrayList<CityModel> models = new ArrayList<CityModel>();
		for (City city: cities) {
			CityModel model = CityModel.buildModel(city, null, null);
			models.add(model);
		}
		return models;
	}
	
	/**
	 * Магазины
	 * @param cityId
	 * @return
	 */
	public static List<Store> getStores(Long cityId) {
		return JPA.em().createQuery("from Store where deleted = 'FALSE' and  city.id = :cityId").setParameter("cityId", cityId).getResultList();
	}
	
	/**
	 * Сервисные центры
	 * @param cityId
	 * @return
	 */
	public static List<ServiceStore> getServiceStores (Long cityId) {
		return JPA.em().createQuery("from ServiceStore where deleted = 'FALSE' and  city.id = :cityId").setParameter("cityId", cityId).getResultList();

	}
	
/**
 * Содание моделей с магазинами
 * @param cities
 * @return
 */
	public static ArrayList<CityModel> getListStores(List<City> cities) {
		ArrayList<CityModel> models = new ArrayList<CityModel>();
		for (City city : cities) {
			List<Store> stores = CityService.getStores(city.getId());
			List<ServiceStore> services = CityService.getServiceStores(city.getId());
			ArrayList<StoreModel> storeModels = new ArrayList<StoreModel>();
			for (Store store: stores) {
			StoreModel model = StoreModel.buildModel(store.getId(), store.getName(), 
					store.getLatitude(), store.getLongitude(), store.getSchedule(), 
					store.getTelephones());
			storeModels.add(model);
			}
			ArrayList<ServiceStoreModel> servicesModels = new ArrayList<ServiceStoreModel>();
			for (ServiceStore service: services) {
				ServiceStoreModel model = ServiceStoreModel.buildModel(service);
				servicesModels.add(model);
			}
			
			CityModel mod = CityModel.buildModel(city, storeModels, servicesModels);
			models.add(mod);
		}
		return models;
	}

}
