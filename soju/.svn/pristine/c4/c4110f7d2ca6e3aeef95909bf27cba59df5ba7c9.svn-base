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
import soju.vo.AgencyVO;
import soju.vo.ArtistVO;
import soju.vo.Login_infoVO;
import soju.vo.ManagerVO;
import soju.vo.MemberVO;

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
   		response.setCharacterEncoding("utf-8");
   		response.setContentType("text/html; charset=utf-8");
   		
   		//사용자가 입력한 id와 패스워드를 파라미터로 받는다.
   		String userid = request.getParameter("id");
   		String pass = request.getParameter("pass");
		//System.out.println(userid);
   		ILoginService service = LoginServiceImpl.getLoginService();
		
   		Login_infoVO vo = new Login_infoVO();
   		vo.setId(userid);
   		vo.setPassword(pass);
   		
   		int type = service.checkMember(vo);
   		
   		HttpSession session = request.getSession();
   		
   		switch(type) {
   		case 1:
   			MemberVO memVO = new MemberVO();
   			memVO.setMem_id(userid);
   			memVO.setMem_pass(pass);
   			MemberVO loginUser = service.getLoginInfo(memVO);
   			if(loginUser!=null) request.setAttribute("res", "성공");
   			else request.setAttribute("res", "실패");
   			session.setAttribute("type", 1);
   			session.setAttribute("loginUser", loginUser);
   			break;
   		case 2:
   			ArtistVO artVO = new ArtistVO();
   			artVO.setArt_id(userid);
   			artVO.setArt_pass(pass);
   			ArtistVO loginUser2 = service.getLoginInfo(artVO);
   			if(loginUser2!=null) request.setAttribute("res", "성공");
   			else request.setAttribute("res", "실패");
   			session.setAttribute("type", 2);
   			session.setAttribute("loginUser", loginUser2);
   			break;
   		case 3:
   			AgencyVO agcVO = new AgencyVO();
   			agcVO.setAgc_id(userid);
   			agcVO.setAgc_pass(pass);
   			AgencyVO loginUser3 = service.getLoginInfo(agcVO);
   			if(loginUser3!=null) request.setAttribute("res", "성공");
   			else request.setAttribute("res", "실패");
   			session.setAttribute("type", 3);
   			session.setAttribute("loginUser", loginUser3);
   			break;
   		case 4:
   			ManagerVO mngVO = new ManagerVO();
   			mngVO.setMng_id(userid);
   			mngVO.setMng_pass(pass);
   			ManagerVO loginUser4 = service.getLoginInfo(mngVO);
   			if(loginUser4!=null) request.setAttribute("res", "성공");
   			else request.setAttribute("res", "실패");
   			session.setAttribute("type", 4);
   			session.setAttribute("loginUser", loginUser4);
   			break;
   		case 0: break;
   		}
   		
		// 4. jsp로 forward
		request.getRequestDispatcher("json/member/checkMember.jsp").forward(request, response);
		
		
		//System.out.println(loginPhoto);
		
		
		
		//setAttribute()메서드를 이용하여 Session값을 저장한다.
		
		
		
	}

}
