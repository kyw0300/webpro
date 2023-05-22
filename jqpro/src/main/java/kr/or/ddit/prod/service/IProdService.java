package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

public interface IProdService {
	public List<ProdVO> prodList(String gu);
	
	public ProdVO prodDetail(String id);
}
