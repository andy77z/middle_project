package soju.service;

import java.sql.SQLException;
import java.util.List;

import soju.dao.FeedDaoImpl;
import soju.dao.IFeedDao;
import soju.vo.BoardVO;
import soju.vo.ReplyVO;

public class FeedServiceImpl implements IFeedService {
	private IFeedDao dao;
	private static FeedServiceImpl service;
	
	private FeedServiceImpl() {
		dao=FeedDaoImpl.getDao();
	}
	
	public static FeedServiceImpl getService() {
		if(service==null) service = new FeedServiceImpl();
		return service;
	}

	@Override
	public int contentUpload(BoardVO vo) {
		int res = 0;
		try {
			res = dao.contentUpload(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<BoardVO> printContent(int num) {
		List<BoardVO> list = null;
		try {
			list = dao.printContent(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteContent(int num) {
		int res = 0;
		try {
			res = dao.deleteContent(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int modifyContent(BoardVO vo) {
		int res = 0;
		try {
			res = dao.modifyContent(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertReply(ReplyVO vo) {
		int res = 0;
		try {
			res = dao.insertReply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ReplyVO> selectReply(int idx) {
		List<ReplyVO> list = null;
		try {
			list = dao.selectReply(idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteReply(int idx) {
		int res = 0;
		try {
			res = dao.deleteReply(idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int modifyReply(ReplyVO vo) {
		int res = 0;
		try {
			res = dao.modifyReply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public BoardVO detailFeed(int idx) {
		BoardVO res = null;
		try {
			res = dao.detailFeed(idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}


}
