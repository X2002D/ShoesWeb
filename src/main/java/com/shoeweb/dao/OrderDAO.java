package com.shoeweb.dao;

import java.util.List;

import com.shoeweb.entity.Order;
import com.shoeweb.entity.OrderDetail;
import com.shoeweb.entity.Product;
import com.shoeweb.entity.User;

public interface OrderDAO {
	Order findById(Integer id);

	List<Order> findAll();

	Order create(Order entity);

	void update(Order entity);

	Order delete(Integer id);

	void create(Order order, List<OrderDetail> details);

	List<Order> findByUser(User user);

	List<Product> findItemsByUser(User user);
}
