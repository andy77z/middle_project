package soju.chatting.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.ChatServiceImpl;
import soju.service.IChatService;
import soju.vo.ChatVO;



@WebServlet("/ChatList.do")
public class ChatList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String artname = request.getParameter("art_name");

		IChatService service = ChatServiceImpl.getInstance();
		
		List<ChatVO> list = service.chatList(artname);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("json/chatting/chatlist.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
