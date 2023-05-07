package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;

import common.JSFunction;
import common.PageHandler;
import common.SearchCondition;
import dao.ConfirmDao;
import dao.FreeBoardDao;
import dao.MateBoardDao;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;


@WebServlet("/ConfirmBoardList")
public class ConfirmBoardListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		
		if(JSFunction.loginChk(req)) {
				req.getRequestDispatcher("/ConfirmBoard.jsp").forward(req, resp);

		} else {
			req.getRequestDispatcher("./LoginForm.jsp").forward(req, resp);
		}
	}
	
}
