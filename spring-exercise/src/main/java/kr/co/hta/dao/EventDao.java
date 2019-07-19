package kr.co.hta.dao;

import java.util.List;

import kr.co.hta.vo.Event;

public interface EventDao {
	
	List<Event> getTopNEvents();
	List<Event> getAllEvents();
	
	Event getEventByNo(int eventNo);
	void updateEvent(Event event);
	
	void addEvent(Event event);
}
