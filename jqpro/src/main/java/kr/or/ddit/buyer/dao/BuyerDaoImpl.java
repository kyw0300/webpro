package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.mybatis.config.MybatisSqlSessionFactory;

public class BuyerDaoImpl implements IBuyerDao {
	
	private static IBuyerDao instance;
	private BuyerDaoImpl() {}
	
	public static IBuyerDao getInstance() {
		if(instance == null) instance = new BuyerDaoImpl();
		return instance;
	}
	
	@Override
	public List<BuyerVO> selectIdName() {
		SqlSession session = null;
		List<BuyerVO> list = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("buyer.selectIdName");
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public BuyerVO selectById(String id) {
		SqlSession session = null;
		BuyerVO vo = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("buyer.selectById", id);
		} finally {
			session.close();
		}
		
		return vo;
	}

}
