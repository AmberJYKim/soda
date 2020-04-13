<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩설정 안해주면 한글 깨짐  -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/class_insert.css" />

<link href="${pageContext.request.contextPath }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<!-- 스크립트 -->
<script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/datepicker.kr.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/class_insert.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/classie.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Event Details Section -->

<style>
.top{
	margin-top: 200px;
	
}
.review_btn{
	float: right;
}


</style>

<form action="reviewWrite" method="post" enctype="multipart/form-data">
<div class="container">
	<div class="row">
	<input type="text" id="memberId" name="memberId" value="${memberLoggedIn.memberId}" hidden/>
	<input type="text" id="onedayclassNo" name="onedayclassNo" value="${onedayclassNo}" hidden/>
		<div class="col-lg-12">
			 <div class="form-group top">
			    <label for="Title">후기 제목</label>
			    <input type="text" class="form-control" id="reviewTitle" name="reviewTitle" aria-describedby="emailHelp">
			    <small id="reviewtitle" class="form-text text-muted">이유없는 비난, 원색적인 표현은 예고없이 삭제될 수 있습니다.</small>
			  </div>
		</div>
		<div class="col-lg-2">
			<div class="form-group">
			    <label for="exampleFormControlSelect1">평점</label>
			    <select class="form-control" id="exampleFormControlSelect1" name="reviewScore">
			      <option value="1">1</option>
			      <option value="2">2</option>
			      <option value="3">3</option>
			      <option value="4">4</option>
			      <option value="5">5</option>
			    </select>
			  </div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
		<!-- ck에디터 -->
			<div class="event-details w-100">
				<textarea name="reviewContent"></textarea>
			</div>
		</div>
	</div>
</div>
<div class="row">
<div class="col-lg-10">
<input type="submit" class="site-btn sb-gradient reservation_class review_btn" value="작성하기"/>
</div>
</div>
</form>






<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>






















