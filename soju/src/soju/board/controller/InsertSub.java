package soju.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import soju.service.BoardServiceImpl;
import soju.service.IBoardService;
import soju.vo.SubscribeVO;

@WebServlet("/insertSub.do")
public class InsertSub extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		SubscribeVO vo = (SubscribeVO)session.getAttribute("svo");
		int art_num = vo.getArt_num();
		IBoardService service = BoardServiceImpl.getInstance();
		service.insertSub(vo);
		int result = service.cntUpSub(art_num);
		
		session.removeAttribute("svo");
		
		response.setCharacterEncoding("utf-8");
		response.sendRedirect("/soju/jsp/feed/feed0.jsp");
//		request.getRequestDispatcher("jsp/feed/feed0.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
