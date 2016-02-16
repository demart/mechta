package kz.mechta.persistence.store;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import kz.mechta.persistence.PersistentObject;
import kz.mechta.persistence.city.City;

@Entity
@Table(name = "service_stores")
public class ServiceStore extends PersistentObject {
		

	@Column(name="name", length=255)
	private String name;

	@Column(name="description", length=255)
	private String description;
	
	@Column(name="street", length=255)
	private String street;

	@Column(name="work_hours", length=100)
	private String workHours;
	
	@Column(name="telephones", length=255)
	private String telephones;
	
	@Column(name="latitude", length=50)
	private Float latitude;
	
	@Column(name="longitude", length=50)
	private Float longitude;
	
	@ManyToOne
	private City city;
	
	public String getName () {
		return name;
	}
	
	public String getWorkHours () {
		return workHours;
	}
	
	public String getTelephones() {
		return telephones;
	}
	
	public String getStreet () {
		return street;
	}
	
	public String getDescription () {
		return description;
	}
	
	public City getCity () {
		return city;
	}
	
	public Float getLatitude () {
		return latitude;
	}
	
	public Float getLongitude() {
		return longitude;
	}
	
	
}
