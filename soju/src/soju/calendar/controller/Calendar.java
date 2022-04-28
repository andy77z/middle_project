package soju.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.mail.handlers.text_html;

import soju.service.CalendarServiceImpl;
import soju.service.ICalendarService;
import soju.vo.CalendarVO;

@WebServlet("/calendar.do")
public class Calendar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
   		response.setContentType("text/html; charset=utf-8");
   		
   		//0.
   		int artNum = Integer.parseInt(request.getParameter("artNum"));
   		//1.
   		ICalendarService service = CalendarServiceImpl.getInstance();
   		//2.
   		ArrayList<CalendarVO> calList = service.calenList(artNum);
   		//3.
   		request.setAttribute("res", calList);
   		//4.
   		request.getRequestDispatcher("json/calender/calendar.jsp").forward(request, response);
   		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

}
