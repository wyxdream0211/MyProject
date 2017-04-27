package com.service;

import java.util.List;

import com.beans.OrderLine;
import com.dao.OrderLineDao;

public interface OrderLineService {
	//1������������ѯ
	public List<OrderLine> queryByOrderId(int id) ;
	//2����ѯ�����û���Ϣ
	public List<OrderLine> queryAll() ;
	//3����������
	public boolean addOrderLine(OrderLine orderl);
	
	//5��ɾ������
	public boolean deleteByOrderId(int id);

}
