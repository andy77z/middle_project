package soju.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import soju.service.BoardServiceImpl;
import soju.service.IBoardService;
import soju.vo.ReplyVO;


@WebServlet("/ReplyInsert.do")
public class ReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyVO vo = new ReplyVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bd_num1", vo.getBd_num());
		map.put("bd_num2", vo.getBd_num());
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		int result = service.insertReply(vo, map);
		
		request.setAttribute("res", result);
		
		request.getRequestDispatcher("json/board/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
