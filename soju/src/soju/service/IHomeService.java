package soju.service;

import java.util.List;

import soju.vo.AgencyVO;
import soju.vo.ArtistVO;
import soju.vo.MemberVO;
import soju.vo.PayVO;
import soju.vo.TicketListAllVO;
import soju.vo.TicketVO;

public interface IHomeService {

	//홈 아티스트 리스트
	public List<ArtistVO> listArtist();
	
	//관리자페이지 - 회원목록보기
	public List<MemberVO> listMember();
	
	//관리자페이지 - 소속사목록보기
	public List<AgencyVO> listAgency();
	
	//관리자페이지 - 아티스트목록보기
	public List<ArtistVO> listArtistAdmin();
	
	//관리자페이지 - 이용권 목록보기
	public List<TicketListAllVO> listAllTicket();
	
	//관리자페이지 - 결제 목록보기
	public List<PayVO> listAllPay();
}
