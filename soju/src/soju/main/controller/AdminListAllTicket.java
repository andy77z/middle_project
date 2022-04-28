package soju.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.HomeServiceImpl;
import soju.service.IHomeService;
import soju.vo.ArtistVO;
import soju.vo.TicketListAllVO;
import soju.vo.TicketVO;


@WebServlet("/AdminListAllTicket.do")
public class AdminListAllTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminListAllTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IHomeService service = HomeServiceImpl.getHomeService();
		
		List<TicketListAllVO> list = service.listAllTicket();
		
		System.out.println(list.size());
		
		request.setAttribute("listAllTicket", list);
		
		request.getRequestDispatcher("json/main/adminListAllTicket.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
