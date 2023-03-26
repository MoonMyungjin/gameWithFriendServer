package gameMatching.cassandra;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.log4j.Logger;

import com.datastax.oss.driver.api.core.CqlSession;
import com.datastax.oss.driver.api.core.cql.BoundStatement;
import com.datastax.oss.driver.api.core.cql.ResultSet;
import com.datastax.oss.driver.api.core.cql.Row;
import com.datastax.oss.driver.api.querybuilder.QueryBuilder;
import com.datastax.oss.driver.api.querybuilder.insert.InsertInto;
import com.datastax.oss.driver.api.querybuilder.insert.RegularInsert;

import gameMatching.vo.UserGameInfoVO;

public class CassandraMapper {

	Logger log;

	private final CqlSession session = null;

	protected CqlSession getSession() {
		return this.session;
	}

	public void selectTest() {
		int idx = 1;
		String contents = "hello world";
		// cassandra 접속 (try 영역을 벗어나면 자동 close)
		try (CassandraConnector client = new CassandraConnector("127.0.0.1", 9042, "datacenter1", "cassandra",
				"cassandra")) {
			// 세션 취득
			CqlSession session = client.getSession();

			// 쿼리 검색
			ResultSet result = session.execute("select * from mykeyspace.USER_GAME_INFO");
			// 검색 결과
			List<Row> list = result.all();
			for (Row row : list) {
				System.out.println(row.getObject(0));
				System.out.println(row.getObject(1));
			}
		} catch (Exception e) {
			log.error(e);
		}
	}

	public void apiDBInsert(UserGameInfoVO userGameInfo) {
		try (CassandraConnector client = new CassandraConnector("127.0.0.1", 9042, "datacenter1", "cassandra",
				"cassandra")) {
			// 세션 취득
			CqlSession session = client.getSession();
			String userId = "jse36855";
			String lolId = userGameInfo.getLolId();
			String lolLevel = userGameInfo.getLolLevel();
			System.out.println(lolId);
			System.out.println(lolLevel);
		
			// 쿼리 생성
			InsertInto into = QueryBuilder.insertInto("mykeyspace","USER_GAME_INFO");
			// 쿼리에서 idx와 contents는 바인딩 설정
			RegularInsert insert = into.value("user_id", QueryBuilder.bindMarker())
					.value("lol_level", QueryBuilder.bindMarker()).value("lol_name", QueryBuilder.bindMarker());
			// 바인딩 설정
			BoundStatement statement = session.prepare(
					insert.build()).bind()
					.setString("user_id", userId) // contents 설정
					.setString("lol_level", lolLevel) // contents 설정
					.setString("lol_name", lolId); // contents 설정
			session.execute(statement);

		} catch (Exception e) {
			log.error(e);
		}
	}
	
	public UserGameInfoVO selectUserGameInfo(UserGameInfoVO userGameInfo) {

		// cassandra 접속 (try 영역을 벗어나면 자동 close)
		try (CassandraConnector client = new CassandraConnector("127.0.0.1", 9042, "datacenter1", "cassandra",
				"cassandra")) {
			// 세션 취득
			CqlSession session = client.getSession();
			
			
			String UserId = userGameInfo.getUserId();
			// 쿼리 검색
			ResultSet result = session.execute("select * from mykeyspace.USER_GAME_INFO WHERE USER_ID = \'"+UserId+"\'");
			// 검색 결과
			List<Row> list = result.all();
			for (Row row : list) {
				System.out.println(row.getObject(0));
				userGameInfo.setLolId(row.getObject(0).toString());
				System.out.println(row.getObject(1));
				userGameInfo.setLolLevel(row.getObject(1).toString());
			}
		} catch (Exception e) {
			log.error(e);
		}
		
		return userGameInfo;
	}
}
