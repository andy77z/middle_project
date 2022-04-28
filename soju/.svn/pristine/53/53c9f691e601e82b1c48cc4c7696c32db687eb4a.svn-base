package soju.main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.IQnaService;
import soju.service.QnaServiceImpl;


@WebServlet("/QnaDelete.do")
public class QnaDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		IQnaService service = QnaServiceImpl.getQnaService();
		
		int res = service.deleteQna(num);
		
		int totalCount = service.qnatotalCount();
		
		int count = service.qnatotalCount();
		
		int perList = 3;
		
		int perPage = 2;
		
		int totalPage = (int)Math.ceil((double)count/perList);
		
		request.setAttribute("res", res);
		request.setAttribute("tpage", totalPage);
		
		request.getRequestDispatcher("json/notice/delresult.jsp").forward(request, response);
		
				
	}

}
