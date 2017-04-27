package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import com.service.OrderService;
import com.service.UserService;
import com.service.impl.OrderLineServiceImpl;
import com.service.impl.OrderServiceImpl;
import com.service.impl.UserServiceImpl;

public class OrderServlet extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		if(username == null){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			UserService service = new UserServiceImpl();
			User user = service.queryByUserName(username);
			OrderService service1=new OrderServiceImpl();
			String sum=(String) session.getAttribute("sum");
			String paytype=(String) request.getParameter("fk");
			int userid=user.getUserid();
		if(paytype!=null){
			
			String status="“—Ã·Ωª";
			Orders order=new Orders();
			order.setCost(sum);
			order.setUserId(userid);
			order.setPayType(paytype);
			order.setStatus(status);
			
			
			service1.addOrder(order);
			List<Orders> orderlist=new ArrayList<Orders>();
			orderlist=service1.queryAll(userid);
			
			session.setAttribute("orders", orderlist);
			
			
			
			List plist= (List) session.getAttribute("plist");
			int id=service1.queryOrderid();
			List<OrderLine> olist=new ArrayList<OrderLine>();
			for(int i=0;i<plist.size();i++){
				OrderLine orderline=new OrderLine();
				Product product=(Product) plist.get(i);
				orderline.setOrderId(id);
				orderline.setProductId(product.getProductid());
				orderline.setBaseprice(product.getBaseprice());
				orderline.setNum(Integer.parseInt(product.getNum()));
				olist.add(orderline);
			}
			OrderLineService service2=new OrderLineServiceImpl();
			
			for(int i=0;i<olist.size();i++){
				 service2.addOrderLine(olist.get(i));
			}
			
			}else
			{
				List<Orders> orderlist=new ArrayList<Orders>();
				orderlist=service1.queryAll(userid);
				
				session.setAttribute("orders", orderlist);
			}
			response.sendRedirect("Order.jsp");
			
			
			
		}
		
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
