package soju.service;

import java.util.List;
import java.util.Map;

import soju.vo.NoticeVO;

public interface INoticeService {

	//공지사항 리스트
	public List<NoticeVO> selectByPage(Map<String, Integer> map);
	
	//전체 글 개수 가져오기
	public int totalCount();
	
	//페이지
	public Map<String, Integer> pageInfo(int page);
	
	//게시글 등록
	public int insertNotice(NoticeVO vo);
	
	//게시글 수정
	public int updateNotice(NoticeVO vo);
	
	//게시글 삭제
	public int deleteNotice(int num);
	
}
