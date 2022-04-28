package soju.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import soju.vo.QnaVO;

public interface IQnaDao {

	//공지사항 리스트
	public List<QnaVO> QnaselectByPage(Map<String, Integer> map) throws SQLException;
	
	//전체 글 개수 가져오기
	public int QnatotalCount() throws SQLException;
	
	//게시글 등록
	public int insertQna(QnaVO vo) throws SQLException;
	
	//게시글 수정
	public int updateQna(QnaVO vo) throws SQLException;
		
	//게시글 삭제
	public int deleteQna(int num) throws SQLException;
	
}
