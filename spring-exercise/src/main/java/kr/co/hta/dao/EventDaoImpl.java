package kr.co.hta.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.co.hta.vo.Event;

@Repository
public class EventDaoImpl implements EventDao {
	
	@Autowired
	private SqlMapClientTemplate template;
	
	@Override
	public List<Event> getTopNEvents() {
		return template.queryForList("event.getTopNEvents");
	}
	
	@Override
	public List<Event> getAllEvents() {
		return template.queryForList("event.getAllEvents");
	}
	
	@Override
	public Event getEventByNo(int eventNo) {
		return (Event) template.queryForObject("event.getEventByNo", eventNo);
	}
	
	@Override
	public void updateEvent(Event event) {
		template.update("event.updateEvent", event);
	}
	
	@Override
	public void addEvent(Event event) {
		template.insert("event.addEvent", event);
	}
}
