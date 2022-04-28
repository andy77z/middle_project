package soju.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import soju.util.SqlMapClientFactory;
import soju.vo.AgencyVO;
import soju.vo.ArtistVO;
import soju.vo.MemberVO;
import soju.vo.PayVO;
import soju.vo.TicketListAllVO;
import soju.vo.TicketVO;

public class HomeDaoImpl implements IHomeDao {

	private SqlMapClient smc;
	private static IHomeDao dao;
	
	private  HomeDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IHomeDao getHomeDao() {
		if (dao == null) dao = new HomeDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<ArtistVO> listArtist() throws SQLException {
		return smc.queryForList("home.selectHomeArtist");
	}

	@Override
	public List<MemberVO> listMember() throws SQLException {
		
		return smc.queryForList("home.selectMember");
	}

	@Override
	public List<AgencyVO> listAgency() throws SQLException {
		return smc.queryForList("home.selectAgency");
	}

	@Override
	public List<ArtistVO> listArtistAdmin() throws SQLException {
		return smc.queryForList("home.selectAdminArtist");
	}

	@Override
	public List<TicketListAllVO> listAllTicket() throws SQLException {
		return smc.queryForList("home.listAllTicket");
	}

	@Override
	public List<PayVO> listAllPay() throws SQLException {
		return smc.queryForList("home.listAllPay");
	}
}