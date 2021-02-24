package com.productREST;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
@CrossOrigin(origins="http://localhost:3000")
@RestController
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

	@GetMapping("/products")
	public List<Product> list() {
		return productService.listAll();
	}
//	@GetMapping("/products/{id}")
//		public Category get(@PathVariable Integer id) {
//			return service.get(id);
//		}
	@GetMapping("/products/{id}")
	public ResponseEntity<Product> get(@PathVariable Integer id) {
	    try {
	        Product product = productService.get(id);
	        return new ResponseEntity<Product >(product, HttpStatus.OK);
	    } catch (NoSuchElementException e) {
	        return new ResponseEntity<Product >(HttpStatus.NOT_FOUND);
	    }      
	}
	@PostMapping("/products")
	public void add(@RequestBody Product product) {
	    productService.save(product);
	}
	@PutMapping("/products/{id}")
	public ResponseEntity<?> update(@RequestBody Product product, @PathVariable Integer id) {
	    try {
	        Product existProduct = productService.get(id);
	        productService.save(product);
	        return new ResponseEntity<>(HttpStatus.OK);
	    } catch (NoSuchElementException e) {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }      
	}
	@DeleteMapping("/products/{id}")
	public void delete(@PathVariable Integer id) {
	    productService.delete(id);
	}


	
}
