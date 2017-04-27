package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.beans.OrderLine;

import com.dao.OrderLineDao;
import com.util.JdbcUtil;

public class OrderLineDaoImpl implements OrderLineDao{

	@Override
	public boolean addOrderLine(OrderLine orderl) {
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("insert into OrderLine(lineid,orderid,productid,baseprice,num) ");
		buffer.append(" values(orderlineid.nextval,?,?,?,?)");
		List<Object> params = new ArrayList<Object>();
		params.add(orderl.getOrderId());
		params.add(orderl.getProductId());
		params.add(orderl.getBaseprice());
		params.add(orderl.getNum());
		
		boolean flag = util.updateByPrearedStatement(buffer.toString(), params);
		util.close();
		return flag;
	}

	@Override
	public boolean deleteByOrderId(int id) {
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		String sql = "delete orderline where orderid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		boolean flag = util.updateByPrearedStatement(sql, params);
		util.close();
		return flag;
	}

	@Override
	public List<OrderLine> queryAll()  {
		List<OrderLine> list = new ArrayList<OrderLine>();
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		String sql = "select * from OrderLine";
		
		ResultSet rs = util.queryByPreparedStatement(sql, null);
		try {
			while(rs.next()){
				OrderLine orderl=new OrderLine();
				orderl.setLineId(rs.getInt(0));
				orderl.setOrderId(rs.getInt(1));
				orderl.setProductId(rs.getInt(2));
				orderl.setBaseprice(rs.getString(3));
				orderl.setNum(rs.getInt(4));
				
				
				
				list.add(orderl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		util.close();
		return list;
	}

	@Override
	public  List<OrderLine> queryByOrderId(int id) {
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		
		String sql = "select * from OrderLine where orderid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		ResultSet rs = util.queryByPreparedStatement(sql, params);
		List list=new ArrayList();
		try {
			while(rs.next()){
				OrderLine orderl=new OrderLine();
				orderl.setLineId(rs.getInt(1));
				orderl.setOrderId(rs.getInt(2));
				orderl.setProductId(rs.getInt(3));
				orderl.setBaseprice(rs.getString(4));
				orderl.setNum(rs.getInt(5));
				list.add(orderl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		util.close();
		return list;
	}

}
