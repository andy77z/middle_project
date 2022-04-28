package soju.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.DiQnaServiceImpl;
import soju.service.IDiQnaService;
import soju.vo.Direct_QnaVO;


@WebServlet("/AdminQnaList.do")
public class AdminQnaList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IDiQnaService service = DiQnaServiceImpl.getDiQnaService();
		
		List<Direct_QnaVO> list = service.adminQnaList();
		System.out.println(list);
		request.setAttribute("adminQnaList", list);
		
		request.getRequestDispatcher("json/notice/adminQnaList.jsp").forward(request, response);
	}
	
}
