package soju.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import soju.dao.IBoardDao;
import soju.dao.BoardDaoImpl;
import soju.vo.ArtistVO;
import soju.vo.Bd_likeVO;
import soju.vo.BoardVO;
import soju.vo.CategoryVO;
import soju.vo.FileVO;
import soju.vo.ReplyVO;
import soju.vo.ReportVO;
import soju.vo.Rp_likeVO;
import soju.vo.SubscribeVO;

public class BoardServiceImpl implements IBoardService{
	private static IBoardService service;
	private IBoardDao dao;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	
	public static IBoardService getInstance() {
		if(service == null) service = new BoardServiceImpl();
		
		return service;
	}
	
	@Override
	public List<BoardVO> getBoardAll(int num) {
		List<BoardVO> list = null;
		
		try {
			list = dao.getBoardAll(num);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FileVO> getFiles() {
		List<FileVO> list = null;
		
		try {
			list = dao.getFiles();
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BoardVO> getDetail(int num) {
		List<BoardVO> list = null;
		
		try {
			list = dao.getDetail(num);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FileVO> getDetailFiles(int num) {
		List<FileVO> list = null;
		
		try {
			list = dao.getDetailFiles(num);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();		
		}
		return list;
	}

	@Override
	public int insertBoard(BoardVO bvo) {
		int result = 0;
		
		try {
			result = dao.insertBoard(bvo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int addFiles(FileVO fvo) {
		int result = 0;
		
		try {
			result = dao.addFiles(fvo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteBoard(int num) {
		int result = 0;
		
		try {
			result = dao.deleteBoard(num);
			if(result > 0) {
				result = dao.deleteFiles(num);
				if(result == 0) result = 1;
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		int result = 0;
		
		try {
			result = dao.updateBoard(vo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertReply(ReplyVO vo, Map<String, Integer> map) {
		int result = 0;
		
		try {
			result = dao.insertReply(vo);
			if(result > 0) {
				dao.updateReplyCount(map);
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<ReplyVO> getReply(int num) {
		List<ReplyVO> list = null;
		
		try {
			list = dao.getReply(num);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteFiles(int num) {
		int result = 0;
		
		try {
			result = dao.deleteFiles(num);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteReply(int num, Map<String, Integer> map) {
		int result = 0;
		
		try {
			result = dao.deleteReply(num);
			if(result > 0) {
				dao.updateReplyCount(map);
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateReply(ReplyVO vo) {
		int result = 0;
		
		try {
			result = dao.updateReply(vo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int report(ReportVO vo) {
		int result = 0;
		
		try {
			result = dao.report(vo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int checkBoardReport(ReportVO vo) {
		int result = 0;
		
		try {
			result = dao.checkBoardReport(vo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int checkReplyReport(ReportVO vo) {
		int result = 0;
		
		try {
			result = dao.checkReplyReport(vo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int getCateNum(CategoryVO vo) {
		int cate_num = 0;
		
		try {
			cate_num = dao.getCateNum(vo);
		} catch (SQLException e) {
			cate_num = 0;
			e.printStackTrace();
		}
		return cate_num;
	}

	@Override
	public ArtistVO getArtist(int num) {
		ArtistVO vo = null;
		
		try {
			vo = dao.getArtist(num);
		} catch (SQLException e) {
			vo = null;
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int checkSub(SubscribeVO vo) {
		int result = 0;
		
		try {
			result = dao.checkSub(vo);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertSub(SubscribeVO vo) {
		try {
			dao.insertSub(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int bd_like(Bd_likeVO vo, Map<String, Integer> map) {
		int result = 0;
		
		try {
			result = dao.bd_like(vo);
			if(result > 0) {
				dao.updateBdLikeCnt(map);
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int rp_like(Rp_likeVO vo, Map<String, Integer> map) {
		int result = 0;
		
		try {
			result = dao.rp_like(vo);
			if(result > 0) {
				dao.updateRpLikeCnt(map);
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Integer> checkBdLike(String id) {
		List<Integer> list = null;
		
		try {
			list = dao.checkBdLike(id);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Integer> checkRpLike(String id) {
		List<Integer> list = null;
		
		try {
			list = dao.checkRpLike(id);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int bd_likeD(Bd_likeVO vo, Map<String, Integer> map) {
		int result = 0;
		
		try {
			result = dao.bd_likeD(vo);
			if(result > 0) {
				dao.updateBdLikeCnt(map);
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int rp_likeD(Rp_likeVO vo, Map<String, Integer> map) {
		int result = 0;
		
		try {
			result = dao.rp_likeD(vo);
			if(result > 0) {
				dao.updateRpLikeCnt(map);
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int cntUpSub(int num) {
		int result = 0;
		
		try {
			result = dao.cntUpSub(num);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	

}
