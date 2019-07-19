package kr.co.hta.service;

import java.util.List;

import kr.co.hta.vo.Notice;

public interface NoticeService {

	List<Notice> getTopNNotices();
	List<Notice> getAllNotices();
	
	void removeNotice(int noticeNo);
	void addNotice(Notice notice);
}
