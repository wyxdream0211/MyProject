package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.OrderLine;
import com.beans.Orders;
import com.beans.Product;
import com.beans.User;
import com.service.OrderLineService;
import com.service.ProductService;
import com.service.UserService;
import com.service.impl.OrderLineServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.impl.UserServiceImpl;

public class OrderLineServlet extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		HttpSession session = request.getSession();
		
		String username = (String)session.getAttribute("username");
		
			UserService service = new UserServiceImpl();
			User user = service.queryByUserName(username);
			if(user!=null){
				request.setAttribute("user", user);
			}else{
				request.setAttribute("user", new User());
			}
		
		OrderLineService orderl=new OrderLineServiceImpl();
		String orderid=request.getParameter("orderid");
		int id=Integer.parseInt(orderid);
		List list=orderl.queryByOrderId(id);
		
		
		ProductService pservice = new ProductServiceImpl();
		
		
		
	
		
		List orderline=new ArrayList();
		for(int i=0;i<list.size();i++){
			Map map=new TreeMap();
			OrderLine ol=(OrderLine) list.get(i);
			map.put("baseprice", ol.getBaseprice());
			map.put("num", ol.getNum());
			map.put("num2", Double.parseDouble(ol.getBaseprice())*ol.getNum());
			map.put("productid", ol.getProductId());
			Product product= pservice.queryByProductId(String.valueOf(ol.getProductId()));
			map.put("name", product.getName());

			orderline.add(map);
		}
		double sum=0;
		for(int i=0;i<orderline.size();i++){
			Map map=(Map) orderline.get(i);
			sum+=(Double)map.get("num2");
		}
		
		String su=String.valueOf(sum);
		session.setAttribute("sum", su);
		session.setAttribute("orderline", orderline);
		
		//¸¶¿î·½Ê½
		String fk="";
		List list1=(List) session.getAttribute("orders");
		for(int i=0;i<list1.size();i++){
			Orders order=(Orders) list1.get(i);
			if(order.getOrderId()==id){
				fk=order.getPayType();
			}
		}
		session.setAttribute("fk", fk);
		request.getRequestDispatcher("Order/OrderLine.jsp").forward(request, response);
		
	}

	
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
