package soju.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import soju.service.BoardServiceImpl;
import soju.service.IBoardService;
import soju.vo.BoardVO;
import soju.vo.FileVO;
import soju.vo.ReplyVO;

@WebServlet("/photoContent.do")
public class PhotoContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("user_id");
		
		IBoardService service = BoardServiceImpl.getInstance();
		List<BoardVO> board = service.getDetail(num);
		List<FileVO> files = service.getDetailFiles(num);
		List<ReplyVO> reply = service.getReply(num);
		List<Integer> bdlike = service.checkBdLike(id);
		if(bdlike.isEmpty()) {
			request.setAttribute("bdlike", "off");
		}else {
			boolean flag = false;
			for(int i = 0; i < bdlike.size(); i++) {
				if(board.get(0).getBd_num() == bdlike.get(i)) {
					flag = true;
				}
			}
			if(flag) {
				request.setAttribute("bdlike", "on");
			}else {
				request.setAttribute("bdlike", "off");
			}
		}
		
		List<Integer> rplike = service.checkRpLike(id);
		
		request.setAttribute("board", board);
		request.setAttribute("files", files);
		request.setAttribute("reply", reply);
		request.setAttribute("rplike", rplike);
		
		request.getRequestDispatcher("json/media/photoContent.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
