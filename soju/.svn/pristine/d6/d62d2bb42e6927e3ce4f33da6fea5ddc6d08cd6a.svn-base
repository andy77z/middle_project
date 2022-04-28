package soju.service;

import java.sql.SQLException;

import soju.dao.ILoginDao;
import soju.dao.LoginDaoImpl;
import soju.vo.AgencyVO;
import soju.vo.ArtistVO;
import soju.vo.Login_infoVO;
import soju.vo.ManagerVO;
import soju.vo.MemberVO;

public class LoginServiceImpl implements ILoginService{

	private ILoginDao dao;
	private static ILoginService service;
	
	private LoginServiceImpl() {
		dao = LoginDaoImpl.getLoginDao();
	}
	
	public static ILoginService getLoginService() {
		if(service==null) service = new LoginServiceImpl();
		return service;
	}

	@Override
	public MemberVO findMember(MemberVO vo) {
		MemberVO findVo=null;
		try {
			findVo = dao.findMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return findVo;
	}

	@Override
	public int ResetPass(MemberVO vo) {
		int cnt=0;
		try {
			cnt = dao.ResetPass(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int ResetPass2(MemberVO vo) {
		int cnt=0;
		try {
			cnt = dao.ResetPass2(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int checkMember(Login_infoVO vo) {
		int type = 0;
		
		try {
			type = dao.checkMember(vo);
		} catch (SQLException e) {
			type = 0;
			e.printStackTrace();
		}
		return type;
	}

	@Override
	public MemberVO getLoginInfo(MemberVO vo) {
		MemberVO mvo = null;
		
		try {
			mvo = dao.getLoginInfo(vo);
		} catch (SQLException e) {
			mvo = null;
			e.printStackTrace();
		}
		return mvo;
	}

	@Override
	public ArtistVO getLoginInfo(ArtistVO vo) {
		ArtistVO mvo = null;
		
		try {
			mvo = dao.getLoginInfo(vo);
		} catch (SQLException e) {
			mvo = null;
			e.printStackTrace();
		}
		return mvo;
	}

	@Override
	public AgencyVO getLoginInfo(AgencyVO vo) {
		AgencyVO mvo = null;
		
		try {
			mvo = dao.getLoginInfo(vo);
		} catch (SQLException e) {
			mvo = null;
			e.printStackTrace();
		}
		return mvo;
	}

	@Override
	public ManagerVO getLoginInfo(ManagerVO vo) {
		ManagerVO mvo = null;
		
		try {
			mvo = dao.getLoginInfo(vo);
		} catch (SQLException e) {
			mvo = null;
			e.printStackTrace();
		}
		return mvo;
	}

	

}
