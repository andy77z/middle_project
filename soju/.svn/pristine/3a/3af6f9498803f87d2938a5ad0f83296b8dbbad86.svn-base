package soju.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import soju.service.BoardServiceImpl;
import soju.service.IBoardService;
import soju.vo.CategoryVO;

@WebServlet("/getCateNum.do")
public class GetCateNum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CategoryVO vo = new CategoryVO();
		
		vo.setCate_name(request.getParameter("cate_name"));
		vo.setArt_num(Integer.parseInt(request.getParameter("art_num")));
		
		
		IBoardService service = BoardServiceImpl.getInstance();
		int cate_num = service.getCateNum(vo);
		
		request.setAttribute("cate_num", cate_num);
		request.getRequestDispatcher("json/board/cate_num.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
