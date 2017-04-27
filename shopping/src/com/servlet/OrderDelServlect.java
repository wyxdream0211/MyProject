package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Orders;
import com.service.OrderService;
import com.service.impl.OrderServiceImpl;

public class OrderDelServlect extends HttpServlet {

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
		String id=request.getParameter("orderid");
		int orderid=Integer.parseInt(id);
		OrderService service=new OrderServiceImpl();
		service.deleteByOrderId(orderid);
		HttpSession session = request.getSession();
		List list=(List) session.getAttribute("orders");
		for(int i=0;i<list.size();i++){
			Orders order=(Orders) list.get(i);
			if(orderid==order.getOrderId()){
				list.remove(i);
				break;
			}
		}
		session.setAttribute("orders", list);
		request.getRequestDispatcher("Order.jsp").forward(request, response);
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
