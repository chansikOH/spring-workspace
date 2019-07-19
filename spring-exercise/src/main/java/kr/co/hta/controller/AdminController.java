package kr.co.hta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hta.service.EventService;
import kr.co.hta.service.NoticeService;
import kr.co.hta.service.ProductService;
import kr.co.hta.vo.Event;
import kr.co.hta.vo.Notice;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private ProductService ProductService;

	@RequestMapping("/events.do")
	public String event(Model model) {
		model.addAttribute("events", eventService.getAllEvents());
		return "admin/events";
	}
	
	@RequestMapping("/switchEvent.do")
	public @ResponseBody List<Event> switchEvent(int eventNo) {
		Event event = eventService.getEventByNo(eventNo);
		if(event.getActive().equals("Y")) {
			event.setActive("N");
		} else if (event.getActive().equals("N")) {
			event.setActive("Y");			
		}
		eventService.updateEvent(event);

		return eventService.getAllEvents();
	}
	
	@RequestMapping("/addEvent.do")
	public @ResponseBody List<Event> addEvent(@RequestBody Event event) {
		eventService.addEvent(event);
		return eventService.getAllEvents();
	}
	
	@RequestMapping("/notices.do")
	public String notices(Model model) {
		model.addAttribute("notices", noticeService.getAllNotices());
		return "admin/notices";
	}
	
	@RequestMapping("/removeNotice/{dataNo}.do")
	public @ResponseBody List<Notice> removeNotice(@PathVariable("dataNo") int noticeNo) {
		noticeService.removeNotice(noticeNo);
		return noticeService.getAllNotices();
	}
	
	@RequestMapping("/addNotice.do")
	public @ResponseBody List<Notice> addNotice(@RequestBody Notice notice) {
		noticeService.addNotice(notice);
		return noticeService.getAllNotices();
	}
	
	@RequestMapping("/products.do")
	public String products(Model model) {
		model.addAttribute("products", ProductService.getAllProducts());
		return "admin/products";
	}

}
