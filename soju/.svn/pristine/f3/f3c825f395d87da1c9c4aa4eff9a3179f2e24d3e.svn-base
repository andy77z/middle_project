package soju.main.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.IQnaService;
import soju.service.QnaServiceImpl;
import soju.vo.QnaVO;


@WebServlet("/QnaList.do")
public class QnaList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		int spage = Integer.parseInt(page);
		
		IQnaService service = QnaServiceImpl.getQnaService();
		
		Map<String, Integer> map = service.qnapageInfo(spage);
		
		java.util.List<QnaVO> list = service.qnaselectByPage(map);
		
		
		request.setAttribute("qnalistt", list);
		request.setAttribute("tpage", map.get("tpage"));
		request.setAttribute("spage", map.get("spage"));
		request.setAttribute("epage", map.get("epage"));
		
		
		request.getRequestDispatcher("json/notice/qnaList.jsp").forward(request, response);
	}
	
}
