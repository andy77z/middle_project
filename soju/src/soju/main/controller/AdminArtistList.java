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

@WebServlet("/AdminArtistList.do")
public class AdminArtistList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IHomeService service = HomeServiceImpl.getHomeService();
		
		List<ArtistVO> list = service.listArtistAdmin();
		
		request.setAttribute("listartistadmin", list);
		
		request.getRequestDispatcher("json/main/adminArtistList.jsp").forward(request, response);
		
	}

}
