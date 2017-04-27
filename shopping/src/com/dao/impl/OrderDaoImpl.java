package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.beans.Orders;
import com.beans.Product;
import com.dao.OrderDao;
import com.util.JdbcUtil;

public class OrderDaoImpl  implements OrderDao{

	@Override
	public boolean addOrder(Orders order) {
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("insert into Orders(orderid,cost,paytype,userid,status,time) ");
		buffer.append(" values(orderid.nextval,?,?,?,'“—Ã·Ωª',sysdate)");
		List<Object> params = new ArrayList<Object>();
		params.add(order.getCost());
		params.add(order.getPayType());
		params.add(order.getUserId());
	
		
		boolean flag = util.updateByPrearedStatement(buffer.toString(), params);
		util.close();
		return flag;
	}

	@Override
	public boolean deleteByOrderId(int id) {
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		String sql = "delete orders where orderid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		boolean flag = util.updateByPrearedStatement(sql, params);
		util.close();
		return flag;
	}

	@Override
	public List<Orders> queryAll(int userid)  {
		List<Orders> list = new ArrayList<Orders>();
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		String sql = "select * from Orders where userid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(userid);
		ResultSet rs = util.queryByPreparedStatement(sql, params );
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			while(rs.next()){
				Orders order=new Orders();
				order.setOrderId(rs.getInt(1));
				order.setCost(rs.getString(2));
				order.setPayType(rs.getString(3));
				order.setUserId(rs.getInt(4));
				order.setStatus(rs.getString(5));
				
				
				
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		util.close();
		return list;
	}

	@Override
	public Orders queryByOrderId(int id)  {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int queryOrderid() {
		int id=0;
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		String sql = "select max(orderid) from Orders ";
		
		ResultSet rs = util.queryByPreparedStatement(sql, null );
		try {
			while(rs.next()){
			id=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

}
