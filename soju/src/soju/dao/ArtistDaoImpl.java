package soju.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import soju.util.SqlMapClientFactory;
import soju.vo.ArtistVO;

public class ArtistDaoImpl implements IArtistDao{
	private static IArtistDao dao;
	private SqlMapClient smc;
	
	private ArtistDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IArtistDao getInstance() {
		if(dao == null) dao = new ArtistDaoImpl();
		
		return dao;
	}
	
	@Override
	public ArtistVO getArtistInfo(int num) throws SQLException {
		// TODO Auto-generated method stub
		return (ArtistVO) smc.queryForObject("artist.getArtistInfo", num);
	}

}
