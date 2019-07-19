package com.sample.portal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sample.portal.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired 
	private SqlMapClientTemplate template;
	
	@SuppressWarnings("deprecation")
	@Override
	public void addNotice(Notice notice) {
		template.insert("notice.addNotice", notice);
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public List<Notice> getAllNotices() {
		return template.queryForList("notice.getAllNotices");
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public Notice getNoticeByNo(int noticeNo) {
		return (Notice) template.queryForObject("notice.getNoticeByNo", noticeNo);
	}
}
