package soju.service;

import java.sql.SQLException;
import java.util.List;

import soju.dao.HomeDaoImpl;
import soju.dao.IHomeDao;
import soju.vo.AgencyVO;
import soju.vo.ArtistVO;
import soju.vo.MemberVO;
import soju.vo.PayVO;
import soju.vo.TicketListAllVO;
import soju.vo.TicketVO;

public class HomeServiceImpl implements IHomeService {

	private IHomeDao dao;
	private static IHomeService service;
	
	private HomeServiceImpl() {
		dao = HomeDaoImpl.getHomeDao();
	}
	
	public static IHomeService getHomeService() {
		if(service == null) service = new HomeServiceImpl();
		return service;
	}
	
	@Override //메인 홈에서 아티스트 리스트 
	public List<ArtistVO> listArtist() {
		List<ArtistVO> list = null;
		
		try {
			list = dao.listArtist();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MemberVO> listMember() {
		List<MemberVO> list = null;
		
		try {
			list=dao.listMember();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List<AgencyVO> listAgency(){
		List<AgencyVO> list = null;
		
		try {
			list=dao.listAgency();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ArtistVO> listArtistAdmin() {
		List<ArtistVO> list = null;
		
		try {
			list = dao.listArtistAdmin();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<TicketListAllVO> listAllTicket() {
		List<TicketListAllVO> list = null;
		
		 try {
			list = dao.listAllTicket();
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<PayVO> listAllPay() {
		List<PayVO> list = null;
		
		  try {
			list = dao.listAllPay();
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return list;
	}
	

}
