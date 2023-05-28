package base.admin.champion.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("ChampionDAO")
public class ChampionDAO {
	
	@Resource(name="sqlSession")
	private SqlSession session;
	
	public List<HashMap<String, String>> selectChampionList(Map<String, String> searchMap) {
		return session.selectList("base.admin.champion.mapper.selectChampionList",searchMap);
	}

	public HashMap<String, String> selectChampion(String chIndex) {
		return session.selectOne("base.admin.champion.mapper.selectChampion",chIndex);
	}

	public int selectInsertKey() {
		return session.selectOne("base.admin.champion.mapper.selectInsertKey");
	}
	
	public void insertChampion(Map<String, Object> params) {
		session.insert("base.admin.champion.mapper.insertChampion",params);
	}

	public void updateChampion(Map<String, Object> params) {
		session.insert("base.admin.champion.mapper.updateChampion",params);
	}


}
