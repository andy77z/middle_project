package soju.calendar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.CalendarServiceImpl;
import soju.service.ICalendarService;


@WebServlet("/deleteSchedule.do")
public class deleteSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public deleteSchedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
		 
		 int calNum = Integer.parseInt(request.getParameter("calNum"));
		 
		 ICalendarService service = CalendarServiceImpl.getInstance();
		 
		 int result = service.deleteSchedule(calNum); 
		 
		 request.setAttribute("result", result);
		
		 request.getRequestDispatcher("json/member/result.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
