package com.sample.portal.service;

import java.util.List;

import com.sample.portal.vo.FreeBoard;
import com.sample.portal.vo.FreeBoardComment;

public interface FreeBoardService {

	List<FreeBoard> getAllFreeBoards();
	FreeBoard getFreeBoardDetail(int boardNo);
	void addNewFreeBoard(FreeBoard freeBoard);
	
	void addNewFreeBoardComment(FreeBoardComment comment);
	List<FreeBoardComment> getFreeBoardComments(int boardNo);
}