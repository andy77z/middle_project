package soju.main.controller;



import java.io.IOException;
import java.security.SecureRandom;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soju.service.ILoginService;
import soju.service.LoginServiceImpl;
import soju.vo.MemberVO;

/**
 * Servlet implementation class MailSnd
 */
@WebServlet("/MailSnd.do")
public class MailSnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				//1.발신자의 메일 계정과 비밀번호를 설정
				final String user = "sunsinlee1545@gmail.com"; //발신자의 이메일 아이디를 입력 
				final String password = "123!@#qw"; //발신자 이메일의 패스워드를 입력
				//2.수신자 메일주소 받기
				String receiver = request.getParameter("mail");
				String memId = request.getParameter("memId");
				System.out.println(memId);	  
				//3.Property에 SMTP 서버 정보를 설정
				Properties prop = new Properties(); 
				//mail.stmp.host : 이메일 발송을 처리해 줄 STMP서버를 나타냄(naver면 smtp.naver.com , 아래는 구글의 경우)
				prop.put("mail.smtp.host", "smtp.gmail.com"); 
				//mail.stmp.port : STMP서버와 통신하는 포트 (google : 587 / naver : 465)	
				prop.put("mail.smtp.port", 465); prop.put("mail.smtp.auth", "true"); 
				prop.put("mail.smtp.ssl.enable", "true"); 
				prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
				
				//4.SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성한다.
				Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator(){
					protected PasswordAuthentication getPasswordAuthentication(){
						return new PasswordAuthentication(user, password);
					}
				});
				
		//임시 비밀번호 생성
			String temppass = getRamdomPassword(8);
		//임시 비밀번호로 사용자의 정보를 변경한다.
			ILoginService service = LoginServiceImpl.getLoginService();
				  	
			MemberVO memVO = new MemberVO();
			memVO.setMem_pass(temppass);
			memVO.setMem_id(memId);
			memVO.setMem_mail(receiver);
			
		
			int cnt = service.ResetPass(memVO);
			cnt = service.ResetPass2(memVO);
			if(cnt>0) {
					System.out.println("mailsnd에서 resetpass성공");
			
		//메시지를 작성 및 발송한다.
				//5.Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
				try {
		            MimeMessage message = new MimeMessage(session);
		            message.setFrom(new InternetAddress(user));

		            //수신자메일주소
		            message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); 
		            // Subject
		            message.setSubject("임시 비밀번호안내"); //메일 제목을 입력
		            // Text
		            message.setText("임시 비밀번호는"+temppass+"입니다.");    //메일 내용을 입력
		            
		            //Transport 클래스를 사용하여 작성한 메세지를 전달한다.
		            Transport.send(message); ////전송
		            System.out.println("메시지가 성공적으로 전송되었습니다.");
				} catch (AddressException e) {
		            e.printStackTrace();
		        } catch (MessagingException e) {
		            e.printStackTrace();
		        }
					
		//임시비밀번호와 발송성공여부를 반환한다.
		        request.setAttribute("res", temppass);
		    	request.getRequestDispatcher("json/member/sendpass.jsp").forward(request, response);
			}else {
				System.out.println("mailsnd에서 resetpass실패");
			}
		
	}
	//임시 비밀번호 생성 메서드
	public String getRamdomPassword(int size){ 
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 
				'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 
				'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', 
				 '^', '&' }; 
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0; 
		int len = charSet.length; 
		for (int i=0; i<size; i++) { 
			idx = (int) (len * Math.random()); 
			idx = sr.nextInt(len); 
			sb.append(charSet[idx]); 
			}
		return sb.toString(); 
		}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

}

	
