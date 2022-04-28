package soju.service;

import java.util.List;

import soju.vo.BoardVO;
import soju.vo.ReplyVO;

public interface IFeedService {
	
	//피드 insert
	public int contentUpload (BoardVO vo);
	
	//피드를 화면에 출력(select)
	public List<BoardVO> printContent(int num);
	
	//피드 삭제
	public int deleteContent(int num);
	
	//피드 수정
	public int modifyContent(BoardVO vo);
	
	//댓글 insert
	public int insertReply(ReplyVO vo);
	
	//댓글 리스트 출력
	public List<ReplyVO> selectReply(int idx);
	
	//댓글 삭제
	public int deleteReply(int idx);
	
	//댓글 수정
	public int modifyReply(ReplyVO vo);
	
	//상세보기(글)
	public BoardVO detailFeed(int idx);
}
