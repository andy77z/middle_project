package soju.service;

import java.util.List;

import soju.vo.Direct_QnaVO;

public interface IDiQnaService {

	
	//나의 문의 목록 보기
	public List<Direct_QnaVO> myQnaList(String dqID);
	
	//1:1 등록
	public int insertDiQna(Direct_QnaVO vo);
	
	//1:1문의에 댓글 등록 하기 (관리자만)
	public int myQnainsertReply(Direct_QnaVO vo);
		
	//1:1문의 댓글 목록
	public List<Direct_QnaVO> myQnaReplyList(int bonum);
	
	//(관리자) 1:1문의 답변 대기 
	public List<Direct_QnaVO> adminQnaList();
		
	//(관리자) 1:1문의 답변 완료
	public List<Direct_QnaVO> adminQnaList2();
	
	
}
