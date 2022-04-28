package soju.dao;

import java.sql.SQLException;
import java.util.List;

import soju.vo.ChatVO;



public interface IChatDao {
	
	//채팅리스트
	public List<ChatVO> chatList(String art_name) throws SQLException;

	//채팅 db에 넣기
	public int insertChat(ChatVO vo) throws SQLException;	
	
	//채팅 삭제
	public int deleteChat() throws SQLException;
	
	public List<ChatVO> chatListArt(String nowTime) throws SQLException;

	
}