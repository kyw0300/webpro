package kr.or.ddit.lprod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.lprod.vo.LprodVO;
import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;
import oracle.net.aso.l;

public class LprodDaoImpl implements ILprodDao {
	
	private static ILprodDao instance;
	private LprodDaoImpl() {}
	
	public static ILprodDao getInstance() {
		if(instance == null) instance = new LprodDaoImpl();
		return instance;
	}

	@Override
	public List<LprodVO> selectAll() {
		SqlSession session = null;
		List<LprodVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("lprod.selectAll");
		} finally {
			session.close();
		}
		
		return list;
	}

}
