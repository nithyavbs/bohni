package com.productREST;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Product {

	private Integer id;
	private String name;
	private double price;
	private Integer quantity;
	private Integer categoryId;
	

	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(Integer id, String name, double price,Integer quantity,Integer categoryId) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity=quantity;
		this.categoryId=categoryId;
	}
// @Column(name = "categoryId", nullable = false)
//	 private Category category;
@Id 
@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
//
//	public Category getCategory() {
//        return category;
//    }
//
//    public void setCategory(Category category) {
//        this.category = category;
//    }
}
