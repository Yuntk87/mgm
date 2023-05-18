package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

@WebServlet("/ConfirmBoard")
public class ConfirmBoardController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		String mode = req.getParameter("mode");
		
		if(JSFunction.loginChk(req)) {
			if("confirm".equals(mode)) {
				req.setAttribute("mode", mode);
				req.getRequestDispatcher("/ConfirmBoard.jsp").forward(req, resp);
			}
				req.getRequestDispatcher("/ConfirmBoard.jsp").forward(req, resp);

		} else {
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
	}
	
}

