package kz.mechta.service;

import java.util.ArrayList;
import java.util.List;

import kz.mechta.models.CategoryModel;
import kz.mechta.models.OrderProductModel;
import kz.mechta.persistence.category.Category;
import kz.mechta.persistence.product.OrderProduct;
import play.db.jpa.JPA;

public class CategoryService {

	/**
	 * Получаем список категорий
	 * @param parentId
	 * @return
	 */
	public static List<Category> getCategories(Long parentId) {
		if (parentId == null)
			return JPA.em().createQuery("from Category where category.id is null and deleted = 'FALSE' order by id asc").getResultList();
		else
			return JPA.em().createQuery("from Category where category.id = :parentId  and deleted = 'FALSE' order by id asc").setParameter("parentId", parentId).getResultList();

	}
	
	/**
	 * Проверяем есть ли дети у категории
	 * @param parentId
	 * @return
	 */
	public static Long checkChildrenCategories (Long parentId) {
		return (Long) JPA.em().createQuery("select count(*) from Category where category.id = :parentId and deleted = 'FALSE'").setParameter("parentId", parentId).getSingleResult();
	}

	/**
	 * Готов массив моделей по категориям
	 * @param categories
	 * @return
	 */
	public static ArrayList<CategoryModel> getListCategories(List<Category> categories) {
		ArrayList<CategoryModel> models = new ArrayList<CategoryModel>();
		
		for (Category category: categories) {
			boolean children = true;
			
			if (CategoryService.checkChildrenCategories(category.getId()) == 0l)
				children = false;
			
			CategoryModel model = CategoryModel.buildModel(category, children);
			models.add(model);
		}
		return models;
	}

	public static void updateParseCategories() {
		JPA.em().createQuery("Update Category set deleted = 'TRUE' where deleted = 'FALSE'").executeUpdate();
		
	}
	
	public static ArrayList<OrderProductModel> getListOrderProduct (List<OrderProduct> orderProduct) {
		ArrayList<OrderProductModel> models = new ArrayList<OrderProductModel>();
		
		for (OrderProduct order: orderProduct) {
		
			OrderProductModel model = OrderProductModel.buildModel(order);
			models.add(model);
		}
		return models;
	}
	
	public static List<OrderProduct> getOrder (){
		return JPA.em().createQuery("from OrderProduct order by id asc").getResultList();
	}

	
		
}
