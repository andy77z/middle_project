package soju.feed.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.FeedServiceImpl;
import soju.service.IFeedService;
import soju.vo.BoardVO;


@WebServlet("/Detailfeed.do")
public class Detailfeed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int idx = Integer.parseInt(request.getParameter("bd_num"));
		
		IFeedService service = FeedServiceImpl.getService();
		BoardVO list = service.detailFeed(idx);
		
		request.setAttribute("res", list);
		request.getRequestDispatcher("feed/list.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
