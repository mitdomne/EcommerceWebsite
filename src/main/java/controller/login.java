package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.KhachHang;

import java.io.IOException;

import database.KhachHangDAO;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String pass=request.getParameter("pass");
		
		KhachHang kh=new KhachHang();
		kh.setTenDangNhap(username);
		kh.setMatKhau(pass);
		
		KhachHangDAO khDAO=new KhachHangDAO();
		KhachHang khach=khDAO.selectByUsernameAndPassword(kh);
		String url="";
		if(khach!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("khachHang", khach);
			url="/index.jsp";
		}else {
			request.setAttribute("error", "Username or password is incorrect!");
			url="/login.jsp";
		}
		RequestDispatcher rd=getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
