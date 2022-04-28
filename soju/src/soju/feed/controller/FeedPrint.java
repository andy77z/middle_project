package soju.feed.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.BoardServiceImpl;
import soju.service.IBoardService;
import soju.vo.BoardVO;
import soju.vo.FileVO;


@WebServlet("/FeedPrint.do")
public class FeedPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("cate_num"));
		String id = request.getParameter("user_id");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		List<BoardVO> list = service.getBoardAll(num);
		List<FileVO> files = service.getFiles();
		List<Integer> like = service.checkBdLike(id);
		
		request.setAttribute("board", list);
		request.setAttribute("files", files);
		request.setAttribute("like", like);
		
		request.getRequestDispatcher("json/feed/List2.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
