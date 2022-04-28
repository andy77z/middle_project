package soju.calendar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.CalendarServiceImpl;
import soju.service.ICalendarService;
import soju.vo.CalendarVO;

@WebServlet("/insertSchedule.do")
public class InsertSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertSchedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
   		response.setContentType("text/html; charset=utf-8");
   		
   		CalendarVO vo = new CalendarVO();
   		String title = request.getParameter("title");
   		String content = request.getParameter("content");
   		String start = request.getParameter("start");
   		String end = request.getParameter("end");
   		int allday = Integer.parseInt(request.getParameter("allday"));
   		String type = request.getParameter("type");
   		int anum = Integer.parseInt(request.getParameter("artist"));
   		
   		vo.setCal_title(title);
   		vo.setCal_cont(content);
   		vo.setCal_start(start);
   		vo.setCal_end(end);
   		vo.setAllday(allday);
   		vo.setEvent_lgu(type);
   		vo.setArt_num(anum);
   		ICalendarService service = CalendarServiceImpl.getInstance();
   		int num = service.insertSchedule(vo);
   		System.out.println(num);
   		request.setAttribute("result", num);
   		request.getRequestDispatcher("json/member/result.jsp").forward(request, response);
   		
   		
	}

}
