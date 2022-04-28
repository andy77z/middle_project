package soju.feed.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.FeedServiceImpl;
import soju.service.IFeedService;


@WebServlet("/FeedDelete.do")
public class FeedDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int bdnum = Integer.parseInt(request.getParameter("num"));
		
		IFeedService service = FeedServiceImpl.getService();
		
		File file = new File("D:/A_TeachingMaterial/4.MiddleProject/workspace/soju/WebContent/photo/" + bdnum);
		
		if( file.exists() ){ //파일존재여부확인 
			if(file.isDirectory()){ //파일이 디렉토리인지 확인 
				File[] files = file.listFiles(); 
				for( int i=0; i<files.length; i++){ 
					files[i].delete();
				}
			}
		}
		file.delete();
		
		int dres = service.deleteContent(bdnum);
		
		request.setAttribute("res", dres);
		request.getRequestDispatcher("json/feed/result.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
