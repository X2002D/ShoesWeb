package com.shoeweb.dao;

import java.util.List;

import com.shoeweb.entity.Order;
import com.shoeweb.entity.OrderDetail;

public interface OrderDetailDAO {
	OrderDetail findById(Integer id);

	List<OrderDetail> findAll();

	OrderDetail create(OrderDetail entity);

	void update(OrderDetail entity);

	OrderDetail delete(Integer id);

	List<OrderDetail> findByOrder(Order order);
	
	List<OrderDetail> findByOrderId(Integer id);
	
	List<OrderDetail> findByProductId(int id);
}
