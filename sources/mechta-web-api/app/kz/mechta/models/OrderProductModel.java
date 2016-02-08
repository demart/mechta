package kz.mechta.models;

import kz.mechta.persistence.product.OrderProduct;

public class OrderProductModel {
	private Long id;
	
	private String name;
	
	private String type;
	
	private String title;
	
	public static OrderProductModel buildModel (OrderProduct orderProduct) {
		OrderProductModel model = new OrderProductModel();
		
		model.id = orderProduct.getId();
		model.name = orderProduct.getName();
		model.type = orderProduct.getType();
		model.title = orderProduct.getTitle();
		
		return model;
	}
}
