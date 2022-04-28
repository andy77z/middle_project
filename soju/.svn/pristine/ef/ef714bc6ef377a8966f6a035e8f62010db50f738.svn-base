package soju.chatting.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import soju.service.ChatServiceImpl;
import soju.service.IChatService;
import soju.vo.ChatVO;




@WebServlet("/InsertChat.do")
public class InsertChat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text html; charset=utf-8");
		
		ChatVO vo = new ChatVO();
		
		String art_name = request.getParameter("art_name");
		String mem_nick = request.getParameter("mem_nick");
		String cont = request.getParameter("chat_cont");
		String photo = request.getParameter("photo");
		
		vo.setArt_name(art_name);
		vo.setMem_nick(mem_nick);
		vo.setChat_cont(cont);
		vo.setPhoto(photo);
		
		
		IChatService service = ChatServiceImpl.getInstance();
		
		int res = service.insertChat(vo);
		request.setAttribute("res", res);
		
		request.getRequestDispatcher("json/chatting/result.jsp").forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
