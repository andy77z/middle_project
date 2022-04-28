package soju.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import soju.util.SqlMapClientFactory;
import soju.vo.NoticeVO;

public class NoticeDaoImpl implements INoticeDao {
	
	private SqlMapClient smc;
	private static INoticeDao dao;
	
	private NoticeDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static INoticeDao getNoticeDao() {
		if(dao==null) dao = new NoticeDaoImpl();
		
		return dao;
	}

	@Override
	public int totalCount() throws SQLException {
		int count = 0;
		
		count = (int) smc.queryForObject("manager.totalCount");
		return count;
	}

	@Override
	public int insertNotice(NoticeVO vo) throws SQLException {
		return (int)smc.insert("manager.insertNotice", vo);
	}

	@Override
	public int updateNotice(NoticeVO vo) throws SQLException {
		return smc.update("manager.updateNotice", vo);
	}

	@Override
	public int deleteNotice(int num) throws SQLException {
		return smc.delete("manager.deleteNotice", num);
	}

	@Override
	public List<NoticeVO> selectByPage(Map<String, Integer> map) throws SQLException {
		List<NoticeVO> list = smc.queryForList("manager.selectByPage", map);
		return list;
	}

	


	

}
