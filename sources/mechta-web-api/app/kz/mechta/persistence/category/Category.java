package kz.mechta.persistence.category;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import kz.mechta.persistence.PersistentObject;
import kz.mechta.persistence.category.Category;

@Entity
@Table(name = "categories")
public class Category extends PersistentObject {
	
	/**
	 * Наименование категории
	 */
	@Column(name="name", length=100)
	private String name;
	
	/**
	 * картинка
	 */
	@Column(name="imageUrl", length=150)
	private String imageUrl;
	
	/**
	 * Сссылка на родительскую категорию
	 */
	@ManyToOne
	private Category category;
	
	/**
	 * Номер категории на сайте
	 */
	@Column(name="number_on_site")
	private Long numberOnSite;
	
	/**
	 * Номер категории на сайте
	 */
	@Column(name="count_products")
	private Integer countProducts;
	
	public void setCountProducts (Integer countProducts) {
		this.countProducts = countProducts;
	}
	
	public Integer getCountProducts () {
		return countProducts;
	}
	
	public void setNumberOnSite (Long numberOnSite) {
		this.numberOnSite = numberOnSite;
	}
	
	public Long getNumberOnSite () {
		return numberOnSite;
	}
	
	public void setName (String name) {
		this.name = name;
	}
	
	public void setImage (String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	public String getImage () {
		return imageUrl;
	}
	
	public String getName () {
		return name;
	}
	
	public Category getCategory () {
		return category;
	}
	
	public void setCategory (Category category) {
		this.category = category;
	}
	
}
