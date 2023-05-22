package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.service.ILprodService;
import kr.or.ddit.lprod.service.LprodServiceImpl;
import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.ProdDaoImpl;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdServiceImpl implements IProdService {
	private IProdDao dao;
	private static IProdService instance;
	
	private ProdServiceImpl() {
		dao = ProdDaoImpl.getInstance();
	}
	
	public static IProdService getInstance() {
		if(instance == null) instance = new ProdServiceImpl();
		return instance;
	}
	
	@Override
	public List<ProdVO> prodList(String gu) {
		return dao.prodList(gu);
	}

	@Override
	public ProdVO prodDetail(String id) {
		return dao.prodDetail(id);
	}

}
