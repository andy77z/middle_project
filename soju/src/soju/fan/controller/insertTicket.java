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


@WebServlet("/insertTicket.do")
public class insertTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public insertTicket() {
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
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int memNum = Integer.parseInt(request.getParameter("memNum"));
		int artNum = Integer.parseInt(request.getParameter("artNum"));
		int payNum = Integer.parseInt(request.getParameter("payNum"));
		
		TicketVO vo = new TicketVO();
		
		 vo.setMem_num(memNum);
		 vo.setArt_num(artNum);
		 vo.setPay_num(payNum);
		 
		 IFanService service = FanServiceImpl.getInstance();
		         
		 int check = service.insertTicket(vo);
		 
//		 Gson gs = new Gson();
//		 
//		 String json = gs.toJson(check);
		 
		 out.write("{\"result\":\""+check+"\"}");
		 response.flushBuffer();
	}

}
