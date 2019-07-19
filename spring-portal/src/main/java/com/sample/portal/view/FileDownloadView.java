package com.sample.portal.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class FileDownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String directory = (String) model.get("directory");
		String filename = (String) model.get("filename");
		
		// 응답컨텐츠의 타입을 설정한다.
		// application/octet-stream은 구체적인 파일의 타입을 알 수 없는 바이너리파일을
		// 응답으로 내려보낼 때 설정하는 기본값이다.
		// 첨부파일을 응답으로 내려보낼 때 주로 사용된다.
		response.setContentType("application/octet-stream");
		
		// 응답헤더값을 설정한다.
		// Content-Disposition 응답헤더는 응답으로 전달되는 파일명을 지정할 때 사용한다.
		// "Content-Disposition", "attachment; filename=a.pdf"와 같은 형식으로 적으면 
		// 파일 다운로드시 무조건 "파일다운로드" 대화상자가 나타나도록 하거나,
		// 크롬 같은 경우에는 파일이 즉시 다운로드되게 한다.
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "utf-8"));
		
		// 첨부파일을 브라우저로 내려보내기
		// 1. 지정된 디렉토리에서 해당 파일을 읽어오는 스트림을 생성한다.
		// 2. 응답객체에서 브라우저로 내보내는 스트림을 획득한다.
		// 3. 복사한다.
		InputStream in = new FileInputStream(new File(directory, filename));
		OutputStream out = response.getOutputStream();
		FileCopyUtils.copy(in, out);
	}
}
