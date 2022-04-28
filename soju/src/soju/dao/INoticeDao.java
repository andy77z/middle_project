package soju.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import soju.vo.NoticeVO;

public interface INoticeDao {

	//공지사항 리스트
	public List<NoticeVO> selectByPage(Map<String, Integer> map) throws SQLException;
	
	//전체 글 개수 가져오기
	public int totalCount() throws SQLException;
	
	//게시글 등록
	public int insertNotice(NoticeVO vo) throws SQLException;
	
	//게시글 수정
	public int updateNotice(NoticeVO vo) throws SQLException;
		
	//게시글 삭제
	public int deleteNotice(int num) throws SQLException;
	
}
