package soju.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import soju.util.SqlMapClientFactory;
import soju.vo.QnaVO;

public class QnaDaoImpl implements IQnaDao {
	
	private SqlMapClient smc;
	private static IQnaDao dao;
	
	private QnaDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IQnaDao getQnaDao() {
		if(dao==null) dao = new QnaDaoImpl();
		
		return dao;
	}
	
	

	@Override
	public int QnatotalCount() throws SQLException {
		int count = 0;
		
		count = (int) smc.queryForObject("manager.qnatotalCount");
		return count;
	}

	@Override
	public int insertQna(QnaVO vo) throws SQLException {
		return (int)smc.insert("manager.insertQna", vo);
	}

	@Override
	public int updateQna(QnaVO vo) throws SQLException {
		return smc.update("manager.updateQna", vo);
	}

	@Override
	public int deleteQna(int num) throws SQLException {
		return smc.delete("manager.deleteQna", num);
	}

	@Override
	public List<QnaVO> QnaselectByPage(Map<String, Integer> map) throws SQLException {
		List<QnaVO> list = smc.queryForList("manager.qnaselectByPage", map);
		return list;
	}

	


	

}
