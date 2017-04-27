package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Product;

public class CartdelServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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

		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String cid1=request.getParameter("cartid");
		int cid=Integer.parseInt(cid1);
		@SuppressWarnings("unused")
		List<Product> plist=(List<Product>) session.getAttribute("plist");
		int index=0;
		
		for(int i=0;i<plist.size();i++){
			Product product =plist.get(i);
			int id=product.getProductid();
			if(id==cid){
				index=i;
				
				break;
			}
		}
		double sum=0;
		plist.remove(index);
		Product p=new Product();
		for(int i=0;i<plist.size();i++){
			p=plist.get(i);
			sum+=p.getNum2();
		}
		String su=String.valueOf(sum);
		session.setAttribute("sum",su);
		session.setAttribute("plist", plist);
		request.getRequestDispatcher("add.jsp").forward(request, response);
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
