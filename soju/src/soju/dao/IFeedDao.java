package soju.dao;

import java.sql.SQLException;
import java.util.List;

import soju.vo.BoardVO;
import soju.vo.ReplyVO;

public interface IFeedDao {
	
	//피드 insert
	public int contentUpload (BoardVO vo) throws SQLException;
	
	//피드를 화면에 출력(select)
	public List<BoardVO> printContent(int num) throws SQLException;
		
	//피드 삭제
	public int deleteContent(int num) throws SQLException;	
	
	//피드 수정
	public int modifyContent(BoardVO vo) throws SQLException;
	
	//댓글 insert
	public int insertReply(ReplyVO vo) throws SQLException;
	
	//댓글 리스트 출력
	public List<ReplyVO> selectReply(int idx) throws SQLException;
	
	//댓글 삭제
	public int deleteReply(int idx) throws SQLException;
	
	//댓글 수정
	public int modifyReply(ReplyVO vo) throws SQLException;
	
	//상세보기(글)
	public BoardVO detailFeed(int idx) throws SQLException;
}
