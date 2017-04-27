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

public class CartAddServlet extends HttpServlet {
	

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
		//request.setCharacterEncoding("GBK");
		//response.setCharacterEncoding("GBK");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		if(username == null){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			String id = request.getParameter("productid");
			if(id!=null){
			ProductService service = new ProductServiceImpl();
			Product product = service.queryByProductId(id);
			product.setNum("1");
			int ba=Integer.parseInt(product.getBaseprice());
			product.setNum2(ba);
			
			List<Product> plist=(List<Product>) session.getAttribute("plist");
			if(plist==null){
				
				plist=new ArrayList<Product>();
				plist.add(product);
				
			}else{
			
			plist.add(product);
			
			}
			double sum=0;
			
			Product p=new Product();
			for(int i=0;i<plist.size();i++){
				p=plist.get(i);
				sum+=p.getNum2();
			}
			String su=String.valueOf(sum);
			session.setAttribute("sum",su);
			session.setAttribute("plist", plist);
		}
			response.sendRedirect("add.jsp");
			//request.getRequestDispatcher("cart/add.jsp").forward(request, response);
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
