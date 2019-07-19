package com.sample.portal.dao;

import java.util.List;

import com.sample.portal.vo.FreeBoard;
import com.sample.portal.vo.FreeBoardComment;

public interface FreeBoardDao {

	List<FreeBoard> getAllFreeBoards();
	FreeBoard getFreeBoardByNo(int freeBoardNo);
	void insertFreeBoard(FreeBoard freeBoard);
	
	List<FreeBoardComment> getCommentsByBoardNo(int boardNo);
	void addComment(FreeBoardComment freeBoardComment);
}
