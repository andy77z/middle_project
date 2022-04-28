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

@WebServlet("/getCateNumMedia.do")
public class GetCateNumMedia extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CategoryVO vo = new CategoryVO();
		CategoryVO vo2 = new CategoryVO();
		
		vo.setCate_name(request.getParameter("cate_name"));
		vo2.setCate_name(request.getParameter("cate_name2"));
		vo.setArt_num(Integer.parseInt(request.getParameter("art_num")));
		vo2.setArt_num(Integer.parseInt(request.getParameter("art_num")));
		
		
		IBoardService service = BoardServiceImpl.getInstance();
		int cate_num = service.getCateNum(vo);
		int cate_num2 = service.getCateNum(vo2);
		
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("cate_num2", cate_num2);
		request.getRequestDispatcher("json/board/cate_numMedia.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
