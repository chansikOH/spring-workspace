package com.sample.portal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sample.portal.vo.FreeBoard;
import com.sample.portal.vo.FreeBoardComment;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{

	@Autowired
	private SqlMapClientTemplate template;

	@Override
	public List<FreeBoard> getAllFreeBoards() {
		return template.queryForList("freeboard.getAllFreeBoards");
	}

	@Override
	public FreeBoard getFreeBoardByNo(int freeBoardNo) {
		return (FreeBoard) template.queryForObject("freeboard.getFreeBoardByNo", freeBoardNo);
	}

	@Override
	public void insertFreeBoard(FreeBoard freeBoard) {
		template.insert("freeboard.insertFreeBoard", freeBoard);
	}
	
	@Override
	public List<FreeBoardComment> getCommentsByBoardNo(int boardNo) {
		return template.queryForList("freeboard.getCommentsByBoardNo", boardNo);
	}
	
	@Override
	public void addComment(FreeBoardComment freeBoardComment) {
		template.insert("freeboard.addComment", freeBoardComment);
	}
}
