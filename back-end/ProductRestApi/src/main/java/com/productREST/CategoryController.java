package com.productREST;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@CrossOrigin(origins="http://localhost:3000")
@RestController
//@RequestMapping("/categories")
public class CategoryController {
	@Autowired
	 private CategoryService categoryService;
	 @Autowired
	    public CategoryController(CategoryService categoryService) {
	        this.categoryService = categoryService;
	    }
	 @GetMapping("/categories")
		public List<Category> list() {
			return categoryService.listAll();
		}
	 @GetMapping("/categories/{id}")
		public ResponseEntity<Category> get(@PathVariable Integer id) {
		    try {
		        Category category = categoryService.get(id);
		        return new ResponseEntity<Category >(category, HttpStatus.OK);
		    } catch (NoSuchElementException e) {
		        return new ResponseEntity<Category >(HttpStatus.NOT_FOUND);
		    }      
		}
	 @PostMapping("/categories")
		public void add(@RequestBody Category category) {
		    categoryService.save(category);
		}
	 @PutMapping("/categories/{id}")
		public ResponseEntity<?> update(@RequestBody Category category, @PathVariable Integer id) {
		    try {
		        Category existCategory = categoryService.get(id);
		        categoryService.save(category);
		        return new ResponseEntity<>(HttpStatus.OK);
		    } catch (NoSuchElementException e) {
		        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		    }      
		}
	 @DeleteMapping("/categories/{id}")
		public void delete(@PathVariable Integer id) {
		    categoryService.delete(id);
		}
}
