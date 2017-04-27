package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.beans.Orders;
import com.dao.OrderDao;
import com.dao.impl.OrderDaoImpl;
import com.service.OrderService;

public class OrderServiceImpl implements  OrderService{
	private OrderDao dao = new OrderDaoImpl();
	@Override
	public boolean addOrder(Orders order) {
		boolean flag = true;
		try {
			flag = dao.addOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteByOrderId(int id) {
		boolean flag = true;
		try {
			flag = dao.deleteByOrderId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Orders> queryAll(int userid)  {
		List<Orders> list = null;
		try {
			list = dao.queryAll(userid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Orders queryByOrderId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int queryOrderid() {
		int id=dao.queryOrderid();
		return id;
	}

}
