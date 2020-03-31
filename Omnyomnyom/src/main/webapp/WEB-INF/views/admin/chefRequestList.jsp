<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/chef-request.css"/>
<!-- 아이디, 비밀번호, 닉네임, 이름,연락처, 이메일, 주소(선택) , 생년월일  -->
	<div class="container">
		<div class="section">
			<div class="row">
				<div class="col side_nav">
					<p class="nav_text ">회원목록</p>
					<p class="nav_text ">셰프목록</p>
					<p class="nav_text ">신고목록</p>
					<p class="nav_text selected_nav">셰프신청목록</p>
					<p class="nav_text ">재고관리</p>
					<p class="nav_text">1:1 문의</p>
					
				</div>
				<div class="col-10">
					<h4 class="border_bottom">셰프신청목록</h4>
					<br>
					<div class="col-12 row">
						<div class="col-2">
							<img src="1508_008.jpg" alt="" class="chef_list_img">
						</div>
						<div class="col-4">
							<p>이름 : 51종원</p> 
							<p>닉네임 : 백종원</p>
							<p>이메일 : 51Jong@cook.com</p>
						</div>

						<div class="col-4">
							<p>연락처 : 010-8888-0909</p>
							<p>대표 장르 : 한식, 퓨전</p>
							<p>대표 채널/영상 : <a href="https://www.youtube.com/channel/UCyn-K7rZLXjGl7VXGweIlcA">링크</a> </p>
						</div>
						<div class="col-1 chef_list_chek_btn ">
							<img src="img/admin/chek.png" alt="" class="ac_btn">
						</div>
						<div class="col-1 chef_list_chek_btn ">
							<img src="img/admin/cc.png" alt="" class="ac_btn">
						</div>
					</div>
					
					<br>
					<div class="col-12 row">
						<div class="col-2">
							<img src="1508_008.jpg" alt="" class="chef_list_img">
						</div>
						<div class="col-4">
							<p>이름 : 52종원</p> 
							<p>닉네임 : 백종원</p>
							<p>이메일 : 51Jong@cook.com</p>
						</div>

						<div class="col-4">
							<p>연락처 : 010-8888-0909</p>
							<p>대표 장르 : 한식, 퓨전</p>
							<p>대표 채널/영상 : <a href="https://www.youtube.com/channel/UCyn-K7rZLXjGl7VXGweIlcA">링크</a> </p>
						</div>
						<div class="col-1 chef_list_chek_btn ">
							<img src="img/admin/chek.png" alt="" class="ac_btn">
						</div>
						<div class="col-1 chef_list_chek_btn ">
							<img src="img/admin/cc.png" alt="" class="ac_btn">
						</div>
					</div>

					<br>
					<div class="col-12 row">
						<div class="col-2">
							<img src="1508_008.jpg" alt="" class="chef_list_img">
						</div>
						<div class="col-4">
							<p>이름 : 53종원</p> 
							<p>닉네임 : 백종원</p>
							<p>이메일 : 51Jong@cook.com</p>
						</div>

						<div class="col-4">
							<p>연락처 : 010-8888-0909</p>
							<p>대표 장르 : 한식, 퓨전</p>
							<p>대표 채널/영상 : <a href="https://www.youtube.com/channel/UCyn-K7rZLXjGl7VXGweIlcA">링크</a> </p>
						</div>
						<div class="col-1 chef_list_chek_btn ">
							<img src="img/admin/chek.png" alt="" class="ac_btn">
						</div>
						<div class="col-1 chef_list_chek_btn ">
							<img src="img/admin/cc.png" alt="" class="ac_btn">
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
