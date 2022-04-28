package soju.service;

import java.sql.SQLException;

import soju.dao.ArtistDaoImpl;
import soju.dao.IArtistDao;
import soju.vo.ArtistVO;

public class ArtistServiceImpl implements IArtistService{
	private static IArtistService service;
	private IArtistDao dao;
	
	private ArtistServiceImpl() {
		dao = ArtistDaoImpl.getInstance();
	}
	
	public static IArtistService getInstance() {
		if(service == null) service = new ArtistServiceImpl();
		
		return service;
	}
	
	@Override
	public ArtistVO getArtistInfo(int num) {
		 ArtistVO vo = null;
		 
		   try {
			vo = dao.getArtistInfo(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return vo;
	}

}
