package kr.co.hta.dao;

import java.util.List;

import kr.co.hta.vo.Notice;

public interface NoticeDao {

	List<Notice> getTopNNotices();
	List<Notice> getAllNotices();
	
	void removeNotice(int noticeNo);
	void addNotice(Notice notice);
}
