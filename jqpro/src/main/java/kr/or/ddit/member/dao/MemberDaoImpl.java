package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;
import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;

// 자신의 객체를 생성해서 리턴하는 메소드
// mapper에 접근하여 SQL문을 실행 - SqlSession 객체가 필요 - SqlSessionFactory이 생성
public class MemberDaoImpl implements IMemberDao {
	private SqlSessionFactory sessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	private static IMemberDao instance;
	private MemberDaoImpl() {
		sessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	}
	
	public static IMemberDao getInstance() {
		if(instance == null) instance = new MemberDaoImpl();
		return instance;
	}
	
	@Override
	public List<MemberVO> getAllMember() {
		// SqlSession 객체가 필요
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		
		List<MemberVO> memList = null;
		try {
			memList = session.selectList("member.getAllMember");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return memList;
	}
	
	public int insertMember(MemberVO vo) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
		
		int cnt = 0;
		try {
			cnt = session.insert("member.insertMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}
	
	@Override
	public String idCheck(String id) {
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
				
		String memId = null;
		try {
			memId = session.selectOne("member.idCheck", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return memId;
	}

	@Override
	public List<ZipVO> zipSearch(String dong) {
		// SqlSession 객체가 필요
		SqlSession session = MybatisSqlSessionFactory.getSqlSession();
				
		List<ZipVO> zipList = null;
		try {
			zipList = session.selectList("member.zipSearch", dong);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
				
		return zipList;
	}
	
	
}
