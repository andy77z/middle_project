package soju.artist.controller;

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



/**
 * Servlet implementation class ArtistList
 */
@WebServlet("/ArtBoardList.do")
public class ArtBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ArtBoardList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0
		request.setCharacterEncoding("utf-8");
		
		int artNum = Integer.parseInt(request.getParameter("artNum"));
		String id = request.getParameter("id");
		 
		//1. 
		IBoardService service = BoardServiceImpl.getInstance();
		
		//2.
		List<BoardVO> list = service.getBoardAll(artNum);
//		List<LikeVO> like = service.checkBoardLike(id);
	   
		//3.
		request.setAttribute("artBoardList", list);
//		request.setAttribute("like", like);

		//4.
		request.getRequestDispatcher("json/artist/artBoardList.jsp").forward(request, response);
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
