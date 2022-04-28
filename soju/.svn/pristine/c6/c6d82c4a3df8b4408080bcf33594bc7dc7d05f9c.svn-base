package soju.main.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import soju.service.DiQnaServiceImpl;
import soju.service.IDiQnaService;
import soju.vo.Direct_QnaVO;



@WebServlet("/DiQnaInsert.do")
public class DiQnaInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Direct_QnaVO vo = new Direct_QnaVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
			
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
//		System.out.println(vo.getDq_title());
//		System.out.println(vo.getDq_id());
//		System.out.println(vo.getDq_cont());
		
		IDiQnaService service = DiQnaServiceImpl.getDiQnaService();
		
		int num = service.insertDiQna(vo);
		
		request.setAttribute("res", num);
		
		request.getRequestDispatcher("json/notice/result.jsp").forward(request, response);
		
		
		
		
	}

}
