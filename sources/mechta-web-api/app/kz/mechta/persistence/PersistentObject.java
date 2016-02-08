package kz.mechta.persistence;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.PreUpdate;

import play.db.jpa.Model;

/**
 * Базовый класс для сущностей
 *
 */
@MappedSuperclass
public class PersistentObject extends Model {

	public PersistentObject() {
		this.createdDate = Calendar.getInstance();
		this.modifiedDate = Calendar.getInstance();
	}
	
	@Column(name="deleted", nullable=false, columnDefinition = "boolean default false")
	private Boolean deleted;

	
	/**
	 * Дата создания записи
	 */
	@Column(name="created_date")
	private Calendar createdDate;
	
	/**
	 * Дата изменения записи
	 */
	@Column(name="modified_date")
	private Calendar modifiedDate;
	
	
	/**
	 * Вызывается перед изменением записи
	 */
	@PreUpdate 
	private void onPreUpdate() {
		this.modifiedDate = Calendar.getInstance();
	}
	
	
	public Calendar getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Calendar createdDate) {
		this.createdDate = createdDate;
	}

	public Calendar getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Calendar modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
}

