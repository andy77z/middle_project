package soju.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import soju.vo.ArtistVO;
import soju.vo.Bd_likeVO;
import soju.vo.BoardVO;
import soju.vo.CategoryVO;
import soju.vo.FileVO;
import soju.vo.ReplyVO;
import soju.vo.ReportVO;
import soju.vo.Rp_likeVO;
import soju.vo.SubscribeVO;

public interface IBoardService {
	
	public int getCateNum(CategoryVO vo);
	
	public ArtistVO getArtist(int num);
	
	// 사진 전체보기 리스트 - 제목,날짜
	public List<BoardVO> getBoardAll(int num);
	
	// 사진 상세보기에 필요한 정보
	public List<BoardVO> getDetail(int num);
	
	// 사진 전체보기 리스트 - 썸네일
	public List<FileVO> getFiles();
	
	// 게시글 하나에 달린 파일들 가져오기
	public List<FileVO> getDetailFiles(int num);
	
	// 게시글 추가
	public int insertBoard(BoardVO vo);
	
	// 파일 추가
	public int addFiles(FileVO vo);
	
	// 게시글 삭제
	public int deleteBoard(int num);
	
	// 파일 삭제
	public int deleteFiles(int num);
	
	// 게시글 수정
	public int updateBoard(BoardVO vo);
	
	// 댓글 등록
	public int insertReply(ReplyVO vo, Map<String, Integer> map);
	
	// 댓글 가져오기
	public List<ReplyVO> getReply(int num);
	
	// 댓글 삭제
	public int deleteReply(int num, Map<String, Integer> map);
	
	// 댓글 수정
	public int updateReply(ReplyVO vo);
	
	// 신고하기
	public int report(ReportVO vo);
	
	// 게시글 신고여부
	public int checkBoardReport(ReportVO vo);
	
	// 댓글 신고여부
	public int checkReplyReport(ReportVO vo);
		
	public int checkSub(SubscribeVO vo);
	
	public void insertSub(SubscribeVO vo);
	
	public int bd_like(Bd_likeVO vo, Map<String, Integer> map);
	
	public int rp_like(Rp_likeVO vo, Map<String, Integer> map);
	
	public int bd_likeD(Bd_likeVO vo, Map<String, Integer> map);
	
	public int rp_likeD(Rp_likeVO vo, Map<String, Integer> map);
	
	public List<Integer> checkBdLike(String id);
	
	public List<Integer> checkRpLike(String id);
	
	public int cntUpSub(int num);
}
