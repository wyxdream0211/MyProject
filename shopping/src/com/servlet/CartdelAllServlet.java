package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Product;

public class CartdelAllServlet extends HttpServlet {

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
		
		
		
		List<Product> plist=(List<Product>) session.getAttribute("plist");
		
		plist.clear();
		if(plist.size()==0){
			alert("购物车清除成功！");
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
		request.getRequestDispatcher("add.jsp").forward(request, response);
	}

	
	
	private void alert(String string) {
		// TODO Auto-generated method stub
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
