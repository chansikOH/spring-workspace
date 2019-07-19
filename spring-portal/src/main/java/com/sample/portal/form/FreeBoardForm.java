package com.sample.portal.form;

import org.springframework.web.multipart.MultipartFile;

public class FreeBoardForm {

	private int no;
	private String title;
	private String writer;
	private String contents;
	private MultipartFile photofile1;
	private MultipartFile photofile2;
	private MultipartFile photofile3;

	public FreeBoardForm() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public MultipartFile getPhotofile1() {
		return photofile1;
	}

	public void setPhotofile1(MultipartFile photofile1) {
		this.photofile1 = photofile1;
	}

	public MultipartFile getPhotofile2() {
		return photofile2;
	}

	public void setPhotofile2(MultipartFile photofile2) {
		this.photofile2 = photofile2;
	}

	public MultipartFile getPhotofile3() {
		return photofile3;
	}

	public void setPhotofile3(MultipartFile photofile3) {
		this.photofile3 = photofile3;
	}
	
}
