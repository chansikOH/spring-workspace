package com.sample.portal.form;

import org.springframework.web.multipart.MultipartFile;

public class NoticeForm {

	private String title;
	private String contents;
	private MultipartFile attachmentfile;

	public NoticeForm() {
		super();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public MultipartFile getAttachmentfile() {
		return attachmentfile;
	}

	public void setAttachmentfile(MultipartFile attachmentfile) {
		this.attachmentfile = attachmentfile;
	}
	
}
