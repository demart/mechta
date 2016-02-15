package kz.mechta.persistence.pages;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import kz.mechta.persistence.PersistentObject;

@Entity
@Table(name = "static_pages")
public class StaticPage extends PersistentObject {
	
	@Column(name="name", length=255)
	private String name;
	
	@Column(name="content", length=4000)
	private String content;
	
	@Column(name="imageUrl", length=255)
	private String imageUrl;
	
	@Column(name="title", length=255)
	private String title;
	
	public String getName () {
		return name;
	}
	
	public String getTitle () {
		return title;
	}
	
	public String getContent () {
		return content;
	}
	
	public String getImageUrl () {
		return imageUrl;
	}

}
