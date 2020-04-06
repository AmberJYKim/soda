<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
	<link rel="stylesheet" href="css/chef-list.css"/>

<!-- 아이디, 비밀번호, 닉네임, 이름,연락처, 이메일, 주소(선택) , 생년월일  -->
	<div class="container">
		<div class="section">
			<div class="row">
				<div class="col side_nav">
					<a href="${pageContext.request.contextPath}/mypage/"><p class="nav_text selected_nav">내 정보보기</p></a>
					<a href="${pageContext.request.contextPath}/mypage/"><p class="nav_text ">예약목록</p></a>
					<a href="${pageContext.request.contextPath}/mypage/"><p class="nav_text ">구매목록</p></a>
					<a href="${pageContext.request.contextPath}/mypage/"><p class="nav_text ">1:1 문의</p></a>
					<a href="${pageContext.request.contextPath}/chef/chefInsert"><p class="nav_text">셰프신청</p></a>
				</div>
				<div class="col-10">
					<h4 class="border_bottom">내 정보보기</h4>
					<br>
					<table class="table">
						<tr class="row">
							<td class="col-3">이름</td>
							<td class="col-9">${memberLoggedIn.memberName }</td>
						</tr>
						<tr class="row">
							<td class="col-3">생년월일</td>
							<td class="col-9">${memberLoggedIn.ssn }</td>
						</tr>
						<tr class="row">
							<td class="col-3">연락처</td>
							<td class="col-9">${memberLoggedIn.phone }</td>
						</tr>
						<tr class="row">
							<td class="col-3">이메일</td>
							<td class="col-9">${memberLoggedIn.email }</td>
						</tr>
						<tr class="row">
							<td class="col-3">주소(배송지)</td>
							<td class="col-9">${memberLoggedIn.address }</td>
						</tr>
					</table>
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