package com.sample.portal.form;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class UserForm {

	@NotBlank(message = "아이디는 필수입력값입니다.")
	@Pattern(regexp = "^[a-zA-Z0-9]{6,}$", message = "아이디는 6글자이상, 영어대소문자/숫자만 입력하세요")
	private String id;
	
	@NotBlank(message = "이름은 필수 입력값입니다.")
	@Pattern(regexp = "^[가-힣]{2,}$", message = "이름은 2글자 이상, 한글로 입력하세요")
	private String name;
	
	@NotBlank
	@Pattern(regexp = "^[a-zA-Z0-9]{8,}$", message = "비밀번호는 8글자이상, 영어대소문자/숫자만 입력하세요")
	private String password;
	
	@NotBlank(message = "이메일은 필수 입력값입니다.")
	@Email(message = "유효한 이메일 형식이 아닙니다.")
	private String email;
	
	@NotBlank(message = "전화번호는 필수 입력값입니다.")
	@Pattern(regexp = "^0\\d{1,2}-\\d{3,4}-\\d{4}$", message = "유효한 전화번호 형식이 아닙니다.")
	private String phone;
	
	@NotNull(message = "나이는 필수 입력값입니다.")
	@Min(value = 19, message = "가입가능 연령은 19세 이상입니다.")
	private int age;
	
	@NotNull(message = "생일은 필수 입력값입니다.")
	@Past(message = "생일은 현재날짜 이전 값을 입력하세요")
	private Date birth;
	private MultipartFile photofile;

	public UserForm() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public MultipartFile getPhotofile() {
		return photofile;
	}

	public void setPhotofile(MultipartFile photofile) {
		this.photofile = photofile;
	}
	
}
