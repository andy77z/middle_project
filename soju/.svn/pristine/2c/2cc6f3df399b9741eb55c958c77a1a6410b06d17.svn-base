package soju.artist.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import soju.service.ArtistServiceImpl;
import soju.service.FanServiceImpl;
import soju.service.IArtistService;
import soju.service.IFanService;
import soju.vo.ArtistVO;
import soju.vo.TicketVO;

/**
 * Servlet implementation class ArtInfo
 */
@WebServlet("/ArtInfo.do")
public class ArtInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int artNum = Integer.parseInt(request.getParameter("artNum"));
		
		 IArtistService service = ArtistServiceImpl.getInstance();
		         
		 ArtistVO vo = service.getArtistInfo(artNum);
		 
		 Gson gs = new Gson();
		 
		 String json = gs.toJson(vo);
		 
		 out.write(json);
		 response.flushBuffer();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
