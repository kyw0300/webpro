<%@page import="kr.or.ddit.board.vo.PageVO"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardVO> list = (List<BoardVO>) request.getAttribute("boardList");
	PageVO pvo = (PageVO) request.getAttribute("pagevo");

	JsonObject obj = new JsonObject();
	
	if(list != null && list.size() > 0) {
		obj.addProperty("sp", pvo.getStartPage());
		obj.addProperty("ep", pvo.getEndPage());
		obj.addProperty("tp", pvo.getTotalPage());
		
		Gson gson = new Gson();
		JsonElement result = gson.toJsonTree(list);
		
		obj.add("datas", result);
	} else {
		obj.addProperty("tp", 0);
	}

	out.print(obj);
	out.flush();
%>
