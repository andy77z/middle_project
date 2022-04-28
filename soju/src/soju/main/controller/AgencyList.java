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
import soju.vo.AgencyVO;

@WebServlet("/AgencyList.do")
public class AgencyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IHomeService service = HomeServiceImpl.getHomeService();
		
		List<AgencyVO> list = service.listAgency();
		
		request.setAttribute("listagency", list);
		
		request.getRequestDispatcher("json/main/agencyList.jsp").forward(request, response);
		
		
	}

}
