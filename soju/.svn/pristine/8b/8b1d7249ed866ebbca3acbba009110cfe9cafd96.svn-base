package soju.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.IJoinService;
import soju.service.JoinServiceImpl;

@WebServlet("/checkId.do")
public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckId() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 보낸 값 받기
		String userId = request.getParameter("id");
		
		//서비스객체 생성
		IJoinService service = JoinServiceImpl.getJoinService();
		//메서드 실행결과 담기
		String checkId = service.checkId(userId);
		
		request.setAttribute("result", checkId);
		
		request.getRequestDispatcher("json/member/checkId.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
