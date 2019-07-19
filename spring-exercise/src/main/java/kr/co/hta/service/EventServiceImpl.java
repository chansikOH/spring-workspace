package kr.co.hta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.hta.dao.EventDao;
import kr.co.hta.vo.Event;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao eventDao;
	
	@Override
	public List<Event> getTopNEvents() {
		return eventDao.getTopNEvents();
	}
	
	@Override
	public List<Event> getAllEvents() {
		return eventDao.getAllEvents();
	}
	
	@Override
	public Event getEventByNo(int eventNo) {
		return eventDao.getEventByNo(eventNo);
	}
	
	@Override
	public void updateEvent(Event event) {
		eventDao.updateEvent(event);
	}
	
	@Override
	public void addEvent(Event event) {
		eventDao.addEvent(event);
	}
}
