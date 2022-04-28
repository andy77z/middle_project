package soju.chatting.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.ChatServiceImpl;
import soju.service.IChatService;




@WebServlet("/DeleteChat.do")
public class DeleteChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
			
		IChatService service = ChatServiceImpl.getInstance();
		
		int res = service.deleteChat();
		
		request.setAttribute("res", res);
		request.getRequestDispatcher("json/chatting/result.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
