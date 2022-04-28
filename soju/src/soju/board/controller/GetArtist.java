package soju.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.BoardServiceImpl;
import soju.service.IBoardService;
import soju.vo.ArtistVO;

@WebServlet("/getArtist.do")
public class GetArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int art_num = Integer.parseInt(request.getParameter("art_num"));
		
		ArtistVO vo = new ArtistVO();
		IBoardService service = BoardServiceImpl.getInstance();
		vo = service.getArtist(art_num);
		
		request.setAttribute("artist", vo);
		request.getRequestDispatcher("json/board/artist.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
