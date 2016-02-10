package kz.mechta.persistence.store;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import kz.mechta.persistence.PersistentObject;
import kz.mechta.persistence.city.City;

@Entity
@Table(name = "stores")
public class Store extends PersistentObject {

	@Column(name="name", length=255)
	private String name;
	
	@Column(name="latitude", length=50)
	private Float latitude;
	
	@Column(name="longitude", length=50)
	private Float longitude;
	
	@Column(name="schedule", length=100)
	private String schedule;
	
	@Column(name="telephones", length=100)
	private String telephones;
	
	@ManyToOne
	private City city;
	
	public String getName () {
		return name;
	}
	
	public Float getLatitude () {
		return latitude;
	}
	
	public Float getLongitude() {
		return longitude;
	}
	
	public String getSchedule () {
		return schedule;
	}
	
	public String getTelephones() {
		return telephones;
	}
	
	public City getCity () {
		return city;
	}
	
	

}
