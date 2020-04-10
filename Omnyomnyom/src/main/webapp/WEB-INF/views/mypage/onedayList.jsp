<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chef-list.css"/>
<!-- 아이디, 비밀번호, 닉네임, 이름,연락처, 이메일, 주소(선택) , 생년월일  -->
	<div class="container">
		<div class="section">
			<div class="row">
				<div class="col side_nav">
					<p class="nav_text">내 정보보기</p>
					<p class="nav_text">예약목록</p>
					<p class="nav_text">구매목록</p>
					<p class="nav_text">셰프 문의</p>
					<p class="nav_text">1:1 문의</p>
					
				</div>
				<div class="col-10">
					<h4 class="border_bottom">예약목록</h4>
					<br>
					<div class="row">
						<div class="col-10">
							<div class="row font-17 th_border">
								<div class="col-4">이름</div>
								<div class="col-3">시간</div>
								<div class="col-1">인원</div>
								<div class="col-2">금액</div>
								<div class="col-2">예약 상태</div>
							</div>
							<br>
							<div class="row">
								<div class="col-4">원데이 클래스 이름</div>
								<div class="col-3">2020.03.25<br>18:00 ~ 19:00</div>
								<div class="col-1">3 명</div>
								<div class="col-2">18000원<br>(인당 6000원)</div>
								<div class="col-2">진행중</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-4">원데이 클래스 이름</div>
								<div class="col-3">2020.03.25<br>18:00 ~ 19:00</div>
								<div class="col-1">3 명</div>
								<div class="col-2">18000원<br>(인당 6000원)</div>
								<div class="col-2">진행중</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-4">원데이 클래스 이름</div>
								<div class="col-3">2020.03.25<br>18:00 ~ 19:00</div>
								<div class="col-1">3 명</div>
								<div class="col-2">18000원<br>(인당 6000원)</div>
								<div class="col-2">취소됨(앙)</div>
							</div>
						</div>
						<div class="col"></div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>

	
		$(function(){
			$(".side_nav").children().click(function(){
				// console.log($(this).html());
				location.href=$(this).html()+".html";
			});
		});
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
