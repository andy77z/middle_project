package soju.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import soju.vo.Direct_QnaVO;

public interface IDiQnaDao {

	//나의 문의 목록 보기
	public List<Direct_QnaVO> myQnaList(String dqID) throws SQLException;
	
	//1:1문의 등록
	public int insertDiQna(Direct_QnaVO vo) throws SQLException;
	
	//1:1문의에 댓글 등록 하기 (관리자만)
	public int myQnainsertReply(Direct_QnaVO vo) throws SQLException;
	
	//1:1문의 댓글 목록
	public List<Direct_QnaVO> myQnaReplyList(int bonum) throws SQLException;
	
	//(관리자)1:1문의 답변대기 목록
	public List<Direct_QnaVO> adminQnaList() throws SQLException;
	
	//(관리자)1:1문의 답변완료 목록
	public List<Direct_QnaVO> adminQnaList2() throws SQLException;
	
	
	
}

