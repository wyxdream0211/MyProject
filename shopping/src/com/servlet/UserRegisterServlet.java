package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

public class UserRegisterServlet extends HttpServlet {

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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//request.setCharacterEncoding("GBK");
		//response.setCharacterEncoding("GBK");
		response.setContentType("text/html");
		
		String password = request.getParameter("password")==null?"":request.getParameter("password").trim();
		String city = request.getParameter("city")==null?"":request.getParameter("city").trim();
		String street1 = request.getParameter("street1")==null?"":request.getParameter("street1").trim();
		String street2 = request.getParameter("street2")==null?"":request.getParameter("street2").trim();
		String zip = request.getParameter("zip")==null?"":request.getParameter("zip").trim();
		String homephone = request.getParameter("homephone")==null?"":request.getParameter("homephone").trim();
		String cellphone = request.getParameter("cellphone")==null?"":request.getParameter("cellphone").trim();
		String officephone = request.getParameter("officephone")==null?"":request.getParameter("officephone").trim();
		String email = request.getParameter("email")==null?"":request.getParameter("email").trim();
		User user = new User();
		
		user.setPassword(password);
		user.setCity(city);
		user.setStreet1(street1);
		user.setStreet2(street2);
		user.setZip(zip);
		user.setHomephone(homephone);
		user.setCellphone(cellphone);
		user.setOfficephone(officephone);
		user.setEmail(email);
		UserService service = new UserServiceImpl();
		
		String userid = request.getParameter("userid");
		if(userid==null){
			//注册用户信息
			String username = request.getParameter("username")==null?"":request.getParameter("username").trim();
			user.setUsername(username);
			boolean boo = service.addUser(user);
			if(boo){
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		}else{
			//修改用户信息
			String username = (String)request.getSession().getAttribute("username");
			user.setUsername(username);
			user.setUserid(Integer.parseInt(userid));
			boolean boo = service.updateUser(user);
			request.setAttribute("user", user);
			if(boo){
				request.getRequestDispatcher("updateSuccess.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("user/update.jsp").forward(request, response);
			}
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
