<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/portal/home.do">포털 사이트</a>
    	</div>
	    <ul class="nav navbar-nav">
	    	<li class="${menu eq 'home' ? 'active' : '' }"><a href="/portal/home.do">홈</a></li>
	    	<li><a href="#">Page 1</a></li>
	    	<li class="${menu eq 'notice' ? 'active' : '' }"><a href="/portal/notice/list.do">공지사항</a></li>
	    	<li class="${menu eq 'free' ? 'active' : ''}"><a href="/portal/free/list.do">자유 게시판</a></li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	    <c:choose>
	    	<c:when test="${empty LOGIN_USER }">
		    	<li class="${menu eq 'login' ? 'active' : '' }"><a href="/portal/user/login.do">로그인</a></li>
		    	<li class="${menu eq 'register' ? 'active' : '' }"><a href="/portal/user/register.do">회원가입</a></li>
	    	</c:when>
	    	<c:otherwise>
		    	<li><a href="">내정보 보기</a></li>
		    	<li><a href="/portal/user/logout.do">로그아웃</a></li>
	    	</c:otherwise>
	    </c:choose>
	    </ul>
    </div>
</nav>