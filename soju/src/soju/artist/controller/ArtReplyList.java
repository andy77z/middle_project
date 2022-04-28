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
import soju.vo.ReplyVO;


@WebServlet("/ArtReplyList.do")
public class ArtReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ArtReplyList() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0
				request.setCharacterEncoding("utf-8");
				
				int bdNum = Integer.parseInt(request.getParameter("bdNum"));
				
			     
				//1. 
				IBoardService service = BoardServiceImpl.getInstance();
				
				//2.
				List<ReplyVO> replList = service.getReply(bdNum);
			     
				//3.
				request.setAttribute("artReplList", replList);
				//4.
				request.getRequestDispatcher("boardframe/artReplyList.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
