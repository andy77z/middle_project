package soju.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import soju.util.SqlMapClientFactory;
import soju.vo.BoardVO;
import soju.vo.ReplyVO;

public class FeedDaoImpl implements IFeedDao{
	private SqlMapClient smc;
	private static IFeedDao dao;
	
	private FeedDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFeedDao getDao() {
		if(dao == null) dao = new FeedDaoImpl();
		return dao;
	}

	@Override
	public int contentUpload(BoardVO vo) throws SQLException {
		int res = 0;
		 Object obj = smc.insert("feed.contentUpload", vo);
		 if(obj ==null) {
			 res=1;
		 }
		return res;
	}

	@Override
	public List<BoardVO> printContent(int num) throws SQLException {
		List<BoardVO> list = null;
		list = smc.queryForList("feed.printContent",num);
		return list;
	}

	@Override
	public int deleteContent(int num) throws SQLException {
		int res = 0;
		res = smc.delete("feed.deleteContent", num);
		return res;
	}

	@Override
	public int modifyContent(BoardVO vo) throws SQLException {
		int res = smc.update("feed.modifyContent", vo);
		return res;
	}

	@Override
	public int insertReply(ReplyVO vo) throws SQLException {
		int res = (int) smc.insert("freply.insertReply", vo);
		return res;
	}

	@Override
	public List<ReplyVO> selectReply(int idx) throws SQLException {
		List<ReplyVO> list = null;
		list = smc.queryForList("freply.selectReply", idx);
		return list;
	}

	@Override
	public int deleteReply(int idx) throws SQLException {
		int res = 0;
		res = smc.delete("freply.deleteReply", idx);
		return res;
	}

	@Override
	public int modifyReply(ReplyVO vo) throws SQLException {
		int res = 0;
		res = smc.update("freply.modifyReply", vo);
		return res;
	}

	@Override
	public BoardVO detailFeed(int idx) throws SQLException {
		BoardVO res = null;
		res = (BoardVO) smc.queryForObject("feed.detailFeed", idx);
		return res;
	}
}
