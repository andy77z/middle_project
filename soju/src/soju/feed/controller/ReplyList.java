package soju.feed.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.BoardServiceImpl;
import soju.service.FeedServiceImpl;
import soju.service.IBoardService;
import soju.service.IFeedService;
import soju.vo.ReplyVO;


@WebServlet("/ReplyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("bd_num"));
		String id = request.getParameter("user_id");
		
		IFeedService service1 = FeedServiceImpl.getService();
		List<ReplyVO> list = service1.selectReply(idx);
		
		IBoardService service2 = BoardServiceImpl.getInstance();
		List<Integer> rplike = service2.checkRpLike(id);
		
		request.setAttribute("list", list);
		request.setAttribute("rplike", rplike);
		request.getRequestDispatcher("json/feed/replyList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
