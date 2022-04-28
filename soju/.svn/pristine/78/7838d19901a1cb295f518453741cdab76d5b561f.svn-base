package soju.main.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import soju.service.IJoinService;
import soju.service.JoinServiceImpl;
import soju.vo.Login_infoVO;
import soju.vo.MemberVO;

@WebServlet("/insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//0. 클라이언트 요청 시 전송데이터를 받기
		//한꺼번에 가져와서 MemVO에 저장
		MemberVO vo = new MemberVO();
		String memId = request.getParameter("id");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		
		vo.setMem_id(memId);
		vo.setMem_name(name);
		vo.setMem_nick(nick);
		vo.setMem_mail(mail);
		vo.setMem_pass(pass);
		
		Login_infoVO lvo = new Login_infoVO();
		lvo.setId(memId);
		lvo.setPassword(pass);
		lvo.setNick(nick);
		
		//1. service객체 얻기
		IJoinService service = JoinServiceImpl.getJoinService();
		//2. service메소드 호출하기 - 결과값 받기
		String id = service.insertMember(vo, lvo);
		
		//3.request에 저장
		request.setAttribute("result", id);
		// 4. jsp로 forward
		request.getRequestDispatcher("json/member/insert.jsp").forward(request, response);
	}

}
