package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

public class UserLoginServlet extends HttpServlet {

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
		
		String username = request.getParameter("username")==null?"":request.getParameter("username").trim();
		String password = request.getParameter("password")==null?"":request.getParameter("password").trim();
		UserService service = new UserServiceImpl();
		User user = service.queryByUserName(username);
		if(user!=null && password.equals(user.getPassword())){
			System.out.println("登录成功");
			HttpSession session = request.getSession();
			session.setAttribute("username", user.getUsername());
			//从cookies中取出上次登录时间
			String value = "";
			Cookie[] cookies = request.getCookies();
			for(int i=0;i<cookies.length;i++){
				 if(cookies[i].getName().equals(user.getUsername())){
				   	value = "，您上次登录时间是"+cookies[i].getValue();
				   	break;
				 }
			}
			request.setAttribute("loginTime", value);
			   
			//本次登录时间
			long timeL = System.currentTimeMillis();
			Date loginDate = new Date(timeL);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String loginStr = sdf.format(loginDate);
			System.out.println(loginStr);
			//生成一个Cookie对象
			Cookie cookie = new Cookie(user.getUsername(),loginStr);
			//设置cookie的最大存活时间
			cookie.setMaxAge(300);
			//把这个Cookie对象加到响应中
			response.addCookie(cookie);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			System.out.println("登录失败");
			request.setAttribute("name", username);
			request.setAttribute("fail", "用户名或密码错误，请重新登录！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
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
