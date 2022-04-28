package soju.feed.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;

import soju.service.BoardServiceImpl;
import soju.service.IBoardService;
import soju.vo.BoardVO;
import soju.vo.FileVO;


@WebServlet("/FileUpload.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10,
		maxFileSize = 1024 * 1024 * 100, 
		maxRequestSize = 1024 * 1024 * 100
)
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BoardVO bvo = new BoardVO();
		bvo.setBd_title(request.getParameter("bd_title"));
		bvo.setBd_profile(request.getParameter("bd_profile"));
		bvo.setBd_cont(request.getParameter("bd_cont"));
		bvo.setBd_id(request.getParameter("bd_id"));
		bvo.setBd_nick(request.getParameter("bd_nick"));
		bvo.setCate_num(Integer.parseInt(request.getParameter("cate_num")));
		
		
		IBoardService service = BoardServiceImpl.getInstance();
		int bd_num = service.insertBoard(bvo);
		
		
		
		String fileName = "";
		
		
		for(Part part : request.getParts()) {
			fileName = extractFileName(part);
			if(!"".equals(fileName)) {
				String uploadPath = "D:/A_TeachingMaterial/4.MiddleProject/workspace/soju/WebContent/photo/" + bd_num;
				
				File fileUploadDir = new File(uploadPath);
				if(!fileUploadDir.exists()) {
					fileUploadDir.mkdirs();
				}
				
				FileVO fvo = new FileVO();
				
				fvo.setFiles_type("photo");
				fvo.setFiles_path("/" + bd_num + "/" + fileName);
				fvo.setBd_num(bd_num);
				
				bd_num = service.addFiles(fvo);
				try {
					part.write(uploadPath + File.separator + fileName);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		
//		request.getRequestDispatcher("jsp/feed/feed0.jsp").forward(request, response);
		response.setCharacterEncoding("utf-8");
		response.sendRedirect("/soju/jsp/feed/feed0.jsp");
	}
	
	private String extractFileName(Part part) {
		String fileName = "";
		String contentDisposition = part.getHeader("content-disposition");
		String[] items = contentDisposition.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				fileName = 
					item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		
		return fileName;
	}

}
