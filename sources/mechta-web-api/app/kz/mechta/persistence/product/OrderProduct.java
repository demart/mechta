package kz.mechta.persistence.product;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import kz.mechta.persistence.PersistentObject;

@Entity
@Table(name = "order_product")
public class OrderProduct extends PersistentObject {
	/**
	 * Название  сортировки: created_date, name, catalog_PRICE_2
	 */
		@Column(name="name", length=50)
		private String name;
		
		/**
		 * Тип сортировки: asc, desc
		 */
		@Column(name="type", length=50)
		private String type;
		
		/**
		 * Название сортировки на русском: Название, цена, новизна
		 */
		@Column(name="title", length=50)
		private String title;
		
		public  String getName () {
			return name;
		}
		
		public String getType () {
			return type;
		}
		
		public String getTitle() {
			return title;
		}
		
		
}
