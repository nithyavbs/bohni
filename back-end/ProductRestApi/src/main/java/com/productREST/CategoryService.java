package com.productREST;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CategoryService {
	@Autowired
	 private CategoryRepository categoryRepository;

//	
//	 public CategoryService(CategoryRepository categoryRepository) {
//        this.categoryRepository = categoryRepository;
//    }
//	 public List<Category> getAllCategory() {
//	        return categoryRepository.findAll();
//	    }

public List<Category> listAll(){
		return categoryRepository.findAll();
}
public void save(Category category) {
		categoryRepository.save(category);
		}
	public Category get(Integer id) {
		return categoryRepository.findById(id).get();
	}

	 public void delete(Integer id) {
	        categoryRepository.deleteById(id);
    }
}
