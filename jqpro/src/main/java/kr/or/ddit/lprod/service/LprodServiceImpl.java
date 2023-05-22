package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.vo.LprodVO;

public class LprodServiceImpl implements ILprodService {
	
	private ILprodDao dao;
	private static ILprodService instance;
	
	private LprodServiceImpl() {
		dao = LprodDaoImpl.getInstance();
	}
	
	public static ILprodService getInstance() {
		if(instance == null) instance = new LprodServiceImpl();
		return instance;
	}

	@Override
	public List<LprodVO> selectAll() {
		return dao.selectAll();
	}

}
