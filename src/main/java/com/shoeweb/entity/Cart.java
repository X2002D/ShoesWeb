package com.shoeweb.entity;

import java.util.List;

public class Cart {
	List<Product> product;
	int total;
	
	
	public List<Product> getProduct() {
		return product;
	}
	public void setProduct(List<Product> product) {
		this.product = product;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
}
