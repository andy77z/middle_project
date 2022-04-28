package soju.service;

import java.util.List;
import java.util.Map;

import soju.vo.QnaVO;


public interface IQnaService {

	//공지사항 리스트
	public List<QnaVO> qnaselectByPage(Map<String, Integer> map);
	
	//전체 글 개수 가져오기
	public int qnatotalCount();
	
	//페이지
	public Map<String, Integer> qnapageInfo(int page);
	
	//게시글 등록
	public int insertQna(QnaVO vo);
	
	//게시글 수정
	public int updateQna(QnaVO vo);
	
	//게시글 삭제
	public int deleteQna(int num);
	
}
