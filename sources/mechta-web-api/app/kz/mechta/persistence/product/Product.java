package kz.mechta.persistence.product;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import kz.mechta.persistence.PersistentObject;
import kz.mechta.persistence.category.Category;

@Entity
@Table(name = "products")
public class Product extends PersistentObject  {
	
	/**
	 * Наименование товара
	 */
	@Column(name="name", length=255)
	private String name;
	
	/**
	 * Категория
	 */
	@ManyToOne
	private Category category;
	
	/**
	 * Наименование товара
	 */
	@Column(name="cost", length=255)
	private Integer cost;
	
	/**
	 * Номер на сайте
	 */
	@Column(name="number_on_site")
	private Long numberOnSite;
	
	
	/**
	 * Наименование товара
	 */
	@Column(name="image_url", length=255)
	private String imageUrl;
	
	/**
	 * Наименование товара
	 */
	@Column(name="availability_in_shop", length=255)
	private String availabilityInShop;
	
	public void setName (String name) {
		this.name = name;
	}
	
	public void setCategory (Category category) {
		this.category = category;
	}
	
	public void setCost (Integer cost) {
		this.cost = cost;
	}
	
	public void setImageUrl (String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	public void setNumberOnSite (Long numberOnSite) {
		this.numberOnSite = numberOnSite;
	}
	
	public void setAvailabilityInShop (String availabilityInShop) {
		this.availabilityInShop = availabilityInShop;
	}
	
	

}
