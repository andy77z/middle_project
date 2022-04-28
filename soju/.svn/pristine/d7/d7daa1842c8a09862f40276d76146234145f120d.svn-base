package soju.service;

import java.sql.SQLException;

import soju.vo.AgencyVO;
import soju.vo.ArtistVO;
import soju.vo.Login_infoVO;
import soju.vo.ManagerVO;
import soju.vo.MemberVO;

public interface ILoginService {
	public int checkMember(Login_infoVO vo);
	public MemberVO findMember(MemberVO vo);
	public int ResetPass(MemberVO vo);
	public int ResetPass2(MemberVO vo);
	
	public MemberVO getLoginInfo(MemberVO vo);
	public ArtistVO getLoginInfo(ArtistVO vo);
	public AgencyVO getLoginInfo(AgencyVO vo);
	public ManagerVO getLoginInfo(ManagerVO vo);
}
