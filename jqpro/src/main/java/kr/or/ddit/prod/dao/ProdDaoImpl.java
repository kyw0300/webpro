package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdDaoImpl implements IProdDao {
	private static IProdDao instance;
	private ProdDaoImpl() {}
	
	public static IProdDao getInstance() {
		if(instance == null) instance = new ProdDaoImpl();
		return instance;
	}
	
	@Override
	public List<ProdVO> prodList(String gu) {
		SqlSession session = null;
		List<ProdVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("prod.prodList",gu);
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public ProdVO prodDetail(String id) {
		SqlSession session = null;
		ProdVO vo = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("prod.prodDetail",id);
		} finally {
			session.close();
		}
		
		return vo;
	}

}
