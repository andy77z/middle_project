package soju.main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import soju.service.ILoginService;
import soju.service.LoginServiceImpl;
import soju.vo.MemberVO;

@WebServlet("/findId.do")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
   		response.setCharacterEncoding("utf-8");
   		response.setContentType("text/html; charset=utf-8");
   		
   		//사용자가 입력한 이름과 메일주소를 파라미터로 받는다.
   		String username = request.getParameter("name");
   		String mail = request.getParameter("mail");
		//System.out.println(username);
		MemberVO memVO = new MemberVO();
		memVO.setMem_name(username);
		memVO.setMem_mail(mail);
		
		//1. service객체 얻기
		ILoginService service = LoginServiceImpl.getLoginService();
		//2. service메소드 호출하기 - 결과값 받기
		MemberVO findUser = service.findMember(memVO);
		//3.request에 저장
		request.setAttribute("res", findUser);
		// 4. jsp로 forward
		request.getRequestDispatcher("json/member/findId.jsp").forward(request, response);
		
		
		
		
	}

}
