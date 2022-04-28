package soju.service;

import java.util.List;

import soju.vo.PayVO;
import soju.vo.TicketListVO;
import soju.vo.TicketVO;


public interface IFanService {

	//팬 내 이용권 목록
	public List<TicketListVO> listTicket(int num);
	
	//팬 내 결제내역 목록
	public List<PayVO> listPayment(int num);
	
	//팬 이용권 유무 체크(없으면 결제창으로 가기 위해)
	public TicketVO checkTicket(TicketVO vo);
	
	//이용권 결제(pay테이블에 insert)
	public int insertPay(TicketVO vo);
	
	//insertPay 후 insertTicket
	public int insertTicket(TicketVO vo);
	
	//환불 시 이용권 상태 변경
	public int updateTicket(int num);
}
