package com.service;

import java.util.List;

import com.beans.Orders;

public interface OrderService {
	//1������������ѯ
	public Orders queryByOrderId(int id) ;
	//2����ѯ�����û���Ϣ
	public List<Orders> queryAll(int userid) ;
	//3����������
	public boolean addOrder(Orders order);
	
	//5��ɾ������
	public boolean deleteByOrderId(int id);
	public int queryOrderid();

}
