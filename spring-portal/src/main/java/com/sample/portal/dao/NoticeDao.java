package com.sample.portal.dao;

import java.util.List;

import com.sample.portal.vo.Notice;

public interface NoticeDao {

	void addNotice(Notice notice);
	List<Notice> getAllNotices();
	Notice getNoticeByNo(int noticeNo);
}
