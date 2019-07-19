package com.sample.portal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.portal.dao.NoticeDao;
import com.sample.portal.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public void addNotice(Notice notice) {
		noticeDao.addNotice(notice);
	}

	@Override
	public List<Notice> getAllNotice() {
		return noticeDao.getAllNotices();
	}

	@Override
	public Notice getNoticeDetail(int noticeNo) {
		return noticeDao.getNoticeByNo(noticeNo);
	}
	
	
}
