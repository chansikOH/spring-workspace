package com.sample.portal.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sample.portal.form.FreeBoardForm;
import com.sample.portal.service.FreeBoardService;
import com.sample.portal.vo.FreeBoard;
import com.sample.portal.vo.FreeBoardComment;
import com.sample.portal.vo.User;

@Controller
@RequestMapping("/free")
public class FreeBoardController {

	@Value("${dir.image.free}")
	private String freeImageSaveDirectory;
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	@RequestMapping("/list.do")
	public String list(Model model) {
		model.addAttribute("freeBoards", freeBoardService.getAllFreeBoards());
		return "free/list";
	}
	
	@RequestMapping("/form.do")
	public String form() {
		return "free/form";
	}
	
	@RequestMapping("/add.do")
	public String add(FreeBoardForm freeBoardForm) throws Exception {
		
		FreeBoard freeBoard = new FreeBoard();
		BeanUtils.copyProperties(freeBoardForm, freeBoard);
		
		MultipartFile mf1 = freeBoardForm.getPhotofile1();
		if(!mf1.isEmpty()) {
			String filename = mf1.getOriginalFilename();
			
			FileCopyUtils.copy(mf1.getBytes(), new File(freeImageSaveDirectory, filename));
			freeBoard.setFileName1(filename);
		}
		
		MultipartFile mf2 = freeBoardForm.getPhotofile2();
		if(!mf1.isEmpty()) {
			String filename = mf2.getOriginalFilename();
			
			FileCopyUtils.copy(mf2.getBytes(), new File(freeImageSaveDirectory, filename));
			freeBoard.setFileName2(filename);
		}
		
		MultipartFile mf3 = freeBoardForm.getPhotofile3();
		if(!mf1.isEmpty()) {
			String filename = mf3.getOriginalFilename();
			
			FileCopyUtils.copy(mf3.getBytes(), new File(freeImageSaveDirectory, filename));
			freeBoard.setFileName3(filename);
		}
		
		freeBoardService.addNewFreeBoard(freeBoard);
		return "redirect:list.do";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("no") int boardNo, Model model) {
		model.addAttribute("board", freeBoardService.getFreeBoardDetail(boardNo));
		model.addAttribute("comments", freeBoardService.getFreeBoardComments(boardNo));
		
		return "free/detail";
	}
	
	@RequestMapping("/addcomment.do")
	public @ResponseBody List<FreeBoardComment> addComment(HttpSession session, 
														@RequestParam("contents") String contents,
														@RequestParam("no") int boardNo) {
		User user = (User) session.getAttribute("LOGIN_USER");
		
		FreeBoardComment comment = new FreeBoardComment();
		comment.setWriter(user.getId());
		comment.setContents(contents);
		comment.setBoardNo(boardNo);
		freeBoardService.addNewFreeBoardComment(comment);
		
		List<FreeBoardComment> comments = freeBoardService.getFreeBoardComments(boardNo);
		return comments;
	}
}
