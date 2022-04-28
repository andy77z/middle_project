package soju.service;


import soju.vo.ArtistVO;


public interface IArtistService {
	
	//아티스트 정보 가져오기
	public ArtistVO getArtistInfo(int num);
}
