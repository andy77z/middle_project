package soju.main.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import soju.service.DiQnaServiceImpl;
import soju.service.IDiQnaService;
import soju.vo.Direct_QnaVO;

@WebServlet("/MyQnaReplyInsert.do")
public class MyQnaReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		Direct_QnaVO vo = new Direct_QnaVO();

		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
			
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	
		IDiQnaService service = DiQnaServiceImpl.getDiQnaService();

		int num = service.myQnainsertReply(vo);

		request.setAttribute("res", num);

		request.getRequestDispatcher("json/notice/result.jsp").forward(request, response);

	}

}
