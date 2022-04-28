package soju.board.controller;

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

@WebServlet("/mediaList.do")
public class MediaList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("cate_num"));
		int num2 = Integer.parseInt(request.getParameter("cate_num2"));
		
		IBoardService service = BoardServiceImpl.getInstance();
		List<BoardVO> list = service.getBoardAll(num);
		List<BoardVO> list2 = service.getBoardAll(num2);
		List<FileVO> files = service.getFiles();
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("files", files);
		request.getRequestDispatcher("json/media/mediaList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
