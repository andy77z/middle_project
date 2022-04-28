package soju.fan.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import soju.service.FanServiceImpl;
import soju.service.IFanService;
import soju.vo.TicketVO;


@WebServlet("/updateTicket.do")
public class updateTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public updateTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int ticNum = Integer.parseInt(request.getParameter("ticNum"));
		
		
		 IFanService service = FanServiceImpl.getInstance();
		         
		 int check = service.updateTicket(ticNum);
		 
		 Gson gs = new Gson();
		 
		 String json = gs.toJson(check);
		 
		 out.write(json);
		 response.flushBuffer();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
