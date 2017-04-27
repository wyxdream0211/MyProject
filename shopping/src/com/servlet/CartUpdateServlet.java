package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

public class CartUpdateServlet extends HttpServlet {
	 
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		
		ProductService service = new ProductServiceImpl();
		String id=request.getParameter("cartid");
		int id1=Integer.parseInt(id);
		Product product = service.queryByProductId(id);
		
		double sum=0;
		String num=request.getParameter("t1");
		int num2=Integer.parseInt(product.getBaseprice())*Integer.parseInt(num);
		List<Product> plist=(List<Product>) session.getAttribute("plist");
		Product p=new Product();
		for(int i=0;i<plist.size();i++){
			p=plist.get(i);
			if(p.getProductid()==id1){
				p.setNum(num);
				p.setNum2(num2);
			
			
			}
			sum+=p.getNum2();
		}
		String su=String.valueOf(sum);
		session.setAttribute("sum",su);
		session.setAttribute("qlist", p);
			response.sendRedirect("add.jsp");
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
