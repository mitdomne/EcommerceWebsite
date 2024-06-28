package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.KhachHang;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

import database.KhachHangDAO;

/**
 * Servlet implementation class register
 */
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("Username");
		String pass=request.getParameter("Password");
		String confirmPass=request.getParameter("confirmPassword");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String birth=request.getParameter("birthDate");
		String address=request.getParameter("address");
		String deliveryAddress=request.getParameter("deliveryAddress");
		String buyerAddress=request.getParameter("buyerAddress");
		String subscribe=request.getParameter("subscibeEmail");
		
		//hold on
		request.setAttribute("username", username);
		request.setAttribute("name", name);
		request.setAttribute("gender", gender);
		request.setAttribute("phone", phone);
		request.setAttribute("email", email);
		request.setAttribute("birthDate",birth);
		request.setAttribute("address", address);
		request.setAttribute("deliverAddress", deliveryAddress);
		request.setAttribute("buyerAddress", buyerAddress);
		request.setAttribute("subcribeEmail", subscribe);
		
	
		String url="";
		String error="";
		
		KhachHangDAO khDAO=new KhachHangDAO();
		if(khDAO.checkUsername(username)) {
			error+="Username is available! </br>";
		}
		if(!pass.equals(confirmPass)) {
			error+="Confirm password do not match! </br>";
		}
		
		if(error.length()>0) {
			url="/register.jsp";
			
		}else {
			Random rd=new Random();
			String mkh=System.currentTimeMillis()+rd.nextInt(1000)+"";
			KhachHang kh=new KhachHang(mkh, username, pass, name, gender, address, deliveryAddress, buyerAddress, java.sql.Date.valueOf(birth), phone, email, subscribe!=null);
			khDAO.insert(kh);
			url="/success.jsp";
		}
		request.setAttribute("error", error);
		
		
		RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
