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


@WebServlet("/MyQnaList.do")
public class MyQnaList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String dqID = request.getParameter("userId");
		
		IDiQnaService service = DiQnaServiceImpl.getDiQnaService();
		
		List<Direct_QnaVO> list = service.myQnaList(dqID);
		
		
		request.setAttribute("myQnaList", list);
		
		request.getRequestDispatcher("json/notice/myQnaList.jsp").forward(request, response);
	}
	
}
