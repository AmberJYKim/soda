<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:requestEncoding value="utf-8"/>
				<div class="col side_nav">
					<a href="${pageContext.request.contextPath}/admin/chefRequestList"><p class="nav_text ${param.sidenav eq '셰프신청목록'? 'selected_nav':''}">셰프신청목록</p></a>
					<a href="${pageContext.request.contextPath}/admin/ingredientList"><p class="nav_text ${param.sidenav eq '재고관리'? 'selected_nav':''}">재고관리</p></a>
					<a href="${pageContext.request.contextPath}/admin/qnaMsg"><p class="nav_text ${param.sidenav eq '1:1문의'? 'selected_nav':''}">1:1 문의</p></a>
					<br>
					<a href="${pageContext.request.contextPath}/admin/memberList"><p class="nav_text ${param.sidenav eq '회원목록'? 'selected_nav':''}">회원목록</p></a>
					<a href="${pageContext.request.contextPath}/admin/chefList"><p class="nav_text ${param.sidenav eq '셰프목록'? 'selected_nav':''}">셰프목록</p></a>
					<a href="${pageContext.request.contextPath}/admin/"><p class="nav_text ${param.sidenav eq '판매목록'? 'selected_nav':''}">판매목록</p></a>
					<a href="${pageContext.request.contextPath}/admin/"><p class="nav_text ${param.sidenav eq '댓글목록'? 'selected_nav':''}">댓글목록</p></a>
					<a href="${pageContext.request.contextPath}/admin/reservationList"><p class="nav_text ${param.sidenav eq '예약목록'? 'selected_nav':''}">예약목록</p></a>
					<a href="${pageContext.request.contextPath}/admin/onedayReviewList"><p class="nav_text ${param.sidenav eq '후기목록'? 'selected_nav':''}">후기목록</p></a>
					<a href="${pageContext.request.contextPath}/admin/"><p class="nav_text ${param.sidenav eq '문의목록'? 'selected_nav':''}">문의목록</p></a>
					<a href="${pageContext.request.contextPath}/admin/reportList"><p class="nav_text ${param.sidenav eq '신고목록'? 'selected_nav':''}">신고목록</p></a>
				</div>