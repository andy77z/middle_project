package soju.service;

import java.sql.SQLException;
import java.util.List;

import soju.dao.FanDaoImpl;
import soju.dao.IFanDao;
import soju.vo.PayVO;
import soju.vo.TicketListVO;
import soju.vo.TicketVO;


public class FanServiceImpl implements IFanService {
	private static IFanService service;
	private IFanDao dao;
	
	private FanServiceImpl() {
		dao = FanDaoImpl.getInstance();
	}
	
	public static IFanService getInstance() {
		if(service == null) service = new FanServiceImpl();
		
		return service;
	}
	
	//팬 내 이용권 목록
	@Override
	public List<TicketListVO> listTicket(int num) {
		List<TicketListVO> list = null;
		
		try {
			list = dao.listTicket(num);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<PayVO> listPayment(int num) {
		List<PayVO> list = null;
		
		   try {
			list = dao.listPayment(num);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public TicketVO checkTicket(TicketVO vo) {
		TicketVO check = null;
		
		try {
			check = dao.checkTicket(vo);
		} catch (SQLException e) {
			check = null;
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public int insertPay(TicketVO vo) {
		int payNum = 0;
		
		try {
			payNum = dao.insertPay(vo);
		} catch (SQLException e) {
			payNum = 0;
			e.printStackTrace();
		}
		
		return payNum;
	}

	@Override
	public int insertTicket(TicketVO vo) {
		int result = 0;
		
		   try {
			result = dao.insertTicket(vo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int updateTicket(int num) {
		int check = 0;
		
		 try {
			check = dao.updateTicket(num);
			if(check>0) {
				 dao.updatePay(num);
			}
		} catch (SQLException e) {
			check = 0;
			e.printStackTrace();
		}
		
		return check;
	}

 
}
