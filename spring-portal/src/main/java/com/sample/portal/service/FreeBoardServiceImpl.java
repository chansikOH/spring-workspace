package com.sample.portal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.portal.dao.FreeBoardDao;
import com.sample.portal.vo.FreeBoard;
import com.sample.portal.vo.FreeBoardComment;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardDao freeBoardDao;

	@Override
	public List<FreeBoard> getAllFreeBoards() {
		return freeBoardDao.getAllFreeBoards();
	}

	@Override
	public FreeBoard getFreeBoardDetail(int boardNo) {
		return freeBoardDao.getFreeBoardByNo(boardNo);
	}

	@Override
	public void addNewFreeBoard(FreeBoard freeBoard) {
		freeBoardDao.insertFreeBoard(freeBoard);
	}
	
	@Override
	public void addNewFreeBoardComment(FreeBoardComment comment) {
		freeBoardDao.addComment(comment);
	}
	
	@Override
	public List<FreeBoardComment> getFreeBoardComments(int boardNo) {
		return freeBoardDao.getCommentsByBoardNo(boardNo);
	}
}
