package soju.fan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import soju.service.FanServiceImpl;
import soju.service.IFanService;
import soju.vo.TicketListVO;
import soju.vo.TicketVO;


@WebServlet("/listTicket.do")
public class listTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public listTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int memNum = Integer.parseInt(request.getParameter("memNum"));
		
		IFanService service = FanServiceImpl.getInstance();
		
		List<TicketListVO> list = service.listTicket(memNum);
	    
		request.setAttribute("ticketList", list);
		
		request.getRequestDispatcher("js/myTicket/myTicketList.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
