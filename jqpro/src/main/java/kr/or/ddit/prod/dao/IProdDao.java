package kr.or.ddit.prod.dao;

import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdDao {
	public List<ProdVO> prodList(String gu);
	
	public ProdVO prodDetail(String id);
}
