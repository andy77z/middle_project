package soju.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.CalendarServiceImpl;
import soju.service.ICalendarService;
import soju.vo.CalendarVO;

@WebServlet("/scheduleSelect.do")
public class ScheduleSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
   		response.setContentType("text/html; charset=utf-8");
		
   		//0.
		String sstart = request.getParameter("sstart");
		String send = request.getParameter("send");
		String agcId = request.getParameter("agcId");
		//System.out.println(sstart);
		//System.out.println(send);
		//System.out.println(agcId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("agcId", agcId);
		map.put("sstart", sstart);
		map.put("send", send);
		
		//1.
		ICalendarService service = CalendarServiceImpl.getInstance();
		//2.
		ArrayList<HashMap<String,Object>> selList = service.selectSchedule(map);
		System.out.println(selList);
		//3.
		request.setAttribute("res", selList);
		//4.
		request.getRequestDispatcher("json/calender/selectSchedule.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
