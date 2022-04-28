package soju.main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import soju.service.IJoinService;
import soju.service.JoinServiceImpl;
import soju.vo.Login_infoVO;
import soju.vo.MemberVO;

@WebServlet("/updateMember.do")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//0. 클라이언트 요청 시 전송데이터를 받기
		//한꺼번에 가져와서 MemVO에 저장
		MemberVO vo = new MemberVO();
		String memId = request.getParameter("id");
		String nick = request.getParameter("nick");
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String photo = request.getParameter("photo");
		photo = "profile_defalut.png";
		
		vo.setMem_id(memId);
		vo.setMem_nick(nick);
		vo.setMem_mail(mail);
		vo.setMem_pass(pass);
		vo.setMem_photo(photo);
		
		Login_infoVO lvo = new Login_infoVO();
		lvo.setId(memId);
		lvo.setPassword(pass);
		lvo.setNick(nick);
		
		//1. service객체 얻기
		IJoinService service = JoinServiceImpl.getJoinService();
		//2. service메소드 호출하기 - 결과값 받기
		int id = service.UpdateMember(vo, lvo);
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		mvo.setMem_id(memId);
		mvo.setMem_nick(nick);
		mvo.setMem_mail(mail);
		mvo.setMem_pass(pass);
		mvo.setMem_photo(photo);
		request.setAttribute("loginUser", mvo);
		
		//3.request에 저장
		request.setAttribute("result", id);
		// 4. jsp로 forward
		request.getRequestDispatcher("json/member/result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
