package kr.co.hta.service;

import java.util.List;

import kr.co.hta.vo.Event;

public interface EventService {

	List<Event> getTopNEvents();
	List<Event> getAllEvents();
	
	Event getEventByNo(int eventNo);
	void updateEvent(Event event);
	
	void addEvent(Event event);
}
