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

@WebServlet("/MyQnaReplyList.do")
public class MyQnaReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bonum = Integer.parseInt(request.getParameter("bonum"));
		
		IDiQnaService service = DiQnaServiceImpl.getDiQnaService();
		
		List<Direct_QnaVO> list = service.myQnaReplyList(bonum);
		
		System.out.println(list);
		request.setAttribute("qnaReplylist", list);
		
		request.getRequestDispatcher("json/notice/qnaReply.jsp").forward(request, response);
		
	}

}
