package gameMatching.cassandra;

import java.io.Closeable;
import java.net.InetSocketAddress;

import com.datastax.oss.driver.api.core.CqlSession;
import com.datastax.oss.driver.api.core.CqlSessionBuilder;

public class CassandraConnector implements Closeable{
	// Cql 쿼리를 사용하기 위한 CqlSession
	private CqlSession session;
	// 생성자 파라미터 접속 ip, port, datacenter, id, pw
	public CassandraConnector(String ip, Integer port, String datacenter, String id, String pw) {
		// builder를 생성
	    CqlSessionBuilder b = CqlSession.builder();
	    // 접속 포인트 설정
	    b.addContactPoint(new InetSocketAddress(ip, port));
	    // 아이디, 패스워드 설정
	    b.withAuthCredentials(id, pw);
	    // 데이터센터 설정
	    b.withLocalDatacenter(datacenter);
	    // 세션 생성
	    session = b.build();
	}
	
	// 세션 생성
	public CqlSession getSession() {
	  return this.session;
	}
	  
	// 세션 닫기	  	  
	public void close() {
		session.close();  
	}
		
}


