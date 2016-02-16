package kz.mechta.models;

import kz.mechta.persistence.store.ServiceStore;

public class ServiceStoreModel{

	private Long id;
	
	private String name;
	
	private String description;
	
	private String street;
	
	private String workHours;
	
	private Float longitude;
	
	private Float latitude;
	
	private String telephones;
	
	public static ServiceStoreModel buildModel (ServiceStore service) {
		ServiceStoreModel model = new ServiceStoreModel();
		model.id = service.getId();
		model.name = service.getName();
		model.description = service.getDescription();
		model.street = service.getStreet();
		model.workHours = service.getWorkHours();
		model.telephones = service.getTelephones();
		model.latitude = service.getLatitude();
		model.longitude = service.getLongitude();
		
		return model;
	}
}
