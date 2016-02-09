package kz.mechta.persistence.city;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import kz.mechta.persistence.PersistentObject;

@Entity
@Table(name = "cities")
public class City extends PersistentObject {

	
	@Column(name="name", length=100)
	private String name;
	
	@Column(name="code", length=100)
	private String code;
	
	@Column(name="name_on_site", length=100)
	private String nameOnSite;
	
	@Column(name="published", nullable=false, columnDefinition = "boolean default true")
	private boolean published;
	
	public String getNameOnSite () {
		return nameOnSite;
	}
	
	public String getName () {
		return name;
	}
}
