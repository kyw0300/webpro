package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.board.vo.ReplyVO;

public interface IBoardService {
	
	//글쓰기 - 실행된 행의 개수를 리턴 - 시퀀스값을 리턴하도록 변경
	public int insertBoard(BoardVO boardVo);
	
	//글삭제
	public int deleteBoard(int num);
	
	//글수정
	public int updateBoard(BoardVO boardVo);
	
	//조회수 증가
	public int updatehit(int num);
	
	//리스트 - 검색 포함
	public List<BoardVO> selectByPage(Map<String, Object> map);
	
	// 댓글쓰기
	public int insertReply(ReplyVO replyVo);
	
	// 댓글 리스트
	public List<ReplyVO> selectReplyList(int bonum);
	
	// 댓글 삭제 ???
	public int deleteReply(int renum);
	
	// 댓글 수정
	public int updateReply(ReplyVO replyVo);
	
	// 페이지별 정보 구하기 - 페이지 처리
	public PageVO pageInfo(int page, String stype, String sword);
	
	// 전체글 개수 구하기
	public int totalCount(Map<String, Object> map);
}
