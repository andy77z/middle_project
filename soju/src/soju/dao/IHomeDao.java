package soju.dao;

import java.sql.SQLException;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.MemberValuePair;

import soju.vo.AgencyVO;
import soju.vo.ArtistVO;
import soju.vo.MemberVO;
import soju.vo.PayVO;
import soju.vo.TicketListAllVO;
import soju.vo.TicketVO;

public interface IHomeDao {

	//홈 아티스트 리스트
	public List<ArtistVO> listArtist() throws SQLException;
	
	//관리자페이지 - 회원목록보기
	public List<MemberVO> listMember() throws SQLException;
	
	//관리자페이지 - 소속사목록보기
	public List<AgencyVO> listAgency() throws SQLException;
	
	//관리자페이지 - 아티스트목록보기
	public List<ArtistVO> listArtistAdmin() throws SQLException;
	
	//관리자페이지 - 이용권 목록보기
	public List<TicketListAllVO> listAllTicket() throws SQLException;
	
	//관리자페이지 - 결제 목록보기
	public List<PayVO> listAllPay() throws SQLException;
}
