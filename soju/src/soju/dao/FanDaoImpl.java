package soju.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import soju.util.SqlMapClientFactory;
import soju.vo.PayVO;
import soju.vo.TicketListVO;
import soju.vo.TicketVO;

public class FanDaoImpl implements IFanDao {
	private static IFanDao dao;
	private SqlMapClient smc;
	
	private FanDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFanDao getInstance() {
		if(dao == null) dao = new FanDaoImpl();
		
		return dao;
	}
	
	//팬 내 이용권 목록
	@Override
	public List<TicketListVO> listTicket(int num) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("fan.myTicket", num);
	}

	@Override
	public List<PayVO> listPayment(int num) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("fan.myPayList", num);
	}

	@Override
	public TicketVO checkTicket(TicketVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (TicketVO) smc.queryForObject("fan.checkTicket", vo);
	}

	@Override
	public int insertPay(TicketVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int) smc.insert("fan.insertPay", vo);
	}

	@Override
	public int insertTicket(TicketVO vo) throws SQLException {
		int result = 0;
		if(smc.insert("fan.insertTicket", vo)==null) result = 1;
		return result; 
	}

	@Override
	public int updateTicket(int num) throws SQLException {
		// TODO Auto-generated method stub
		return  (int) smc.update("fan.updateTicket", num);
	}

	@Override
	public int updatePay(int num) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("fan.updatePay", num);
	}

}
