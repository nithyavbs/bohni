package com.productREST;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	private Integer id;
	private String name;

	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
@Id 
@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
//	@Column(nullable = false, name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}



}
