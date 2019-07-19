package kr.co.hta.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.co.hta.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlMapClientTemplate template;
	
	@Override
	public List<Notice> getTopNNotices() {
		return template.queryForList("notice.getTopNNotices");
	}
	
	@Override
	public List<Notice> getAllNotices() {
		return template.queryForList("notice.getAllNotices");
	}
	
	@Override
	public void removeNotice(int noticeNo) {
		template.delete("notice.removeNotice", noticeNo);
	}
	
	@Override
	public void addNotice(Notice notice) {
		template.insert("notice.addNotice", notice);
	}
}
