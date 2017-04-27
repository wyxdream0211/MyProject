package com.dao;

import java.util.List;

import com.beans.Orders;
import com.beans.User;

@SuppressWarnings("unused")
public interface OrderDao {
	//1������������ѯ
	public Orders queryByOrderId(int id) ;
	//2����ѯ�����û���Ϣ
	public List<Orders> queryAll(int userid) ;
	//3����������
	public boolean addOrder(Orders order);
	
	//5��ɾ������
	public boolean deleteByOrderId(int id);
	//��ѯ������
	public int queryOrderid();
	
	
}
