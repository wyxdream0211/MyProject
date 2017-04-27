package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Product;
import com.service.ProductService;
import com.service.impl.ProductServiceImpl;

public class PageServlet extends HttpServlet {

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
		HttpSession session=request.getSession();
		
		String pagei=request.getParameter("pageindex")==null?"1":request.getParameter("pageindex");
		int pageindex=Integer.parseInt(pagei);
		if(pageindex<0){
			pageindex=1;
		}
		ProductService service =new ProductServiceImpl();
		List list=service.page(pageindex);
		if(list == null){
			list = new ArrayList<Product>();
		}
		session.setAttribute("pageindex", pageindex);
		request.setAttribute("productList", list);
		request.getRequestDispatcher("products.jsp").forward(request, response);
		//response.sendRedirect("products.jsp");
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
