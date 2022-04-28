package soju.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.BoardServiceImpl;
import soju.service.IBoardService;
import soju.vo.Rp_likeVO;

@WebServlet("/rp_likeD.do")
public class Rp_likeD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Rp_likeVO vo = new Rp_likeVO();
		int num = Integer.parseInt(request.getParameter("rp_num"));
		vo.setRp_num(Integer.parseInt(request.getParameter("rp_num")));
		vo.setRlike_id(request.getParameter("user_id"));
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rp_num1", num);
		map.put("rp_num2", num);
		
		IBoardService service = BoardServiceImpl.getInstance();
		int result = service.rp_likeD(vo,map);
		
		request.setAttribute("res", result);
		request.getRequestDispatcher("json/board/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
