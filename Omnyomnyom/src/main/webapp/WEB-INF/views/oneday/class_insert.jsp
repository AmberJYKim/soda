
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="원데이 클래스 등록" name="pageTitle" />
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
<!-- Event Details Section -->

<section class="event-details-section spad overflow-hidden">
	<div class="container">
		<form action="insert.do" method="post" enctype="multipart/form-data">
		<!-- 셰프채널 = memberId 입력란-->
		<input type="text" id="input-class-channel" name="memberId" value="sims1" hidden/> 
			<div class="row">
				<div class="col-lg-7">
					<!-- 이미지 등록 -->
					<div class="oneday_class_img">
						<div id="uploadbtn" onclick="upload(this)">Upload Files</div>
						<input type='file' id="imgInput" name="onedayImgFile" hidden /> <img src="#" alt="" id="image_section">
					</div>

					<!-- 셰프 정보 -->
<%-- 					<div class="sb-widget">
						<h2 class="sb-title">셰프소개</h2>
						<div class="about-instructor-widget">
							<img src="${pageContext.request.contextPath }/resources/images/classes/author/1.jpg" alt="">
							<h6>Yoga Trainer</h6>
							<p>Yoga & Therapy Certificate of Uttarakhand University</p>
						</div>
					</div> --%>

					<!-- ck에디터 -->
					<div class="event-details w-100">
						<textarea name="onedayContent"></textarea>
					</div>
				</div>

				<!-- 사이드부분 -->
				<div class="col-lg-5 col-md-5 col-sm-8 sidebar">
					<div class="sb-widget">
						<div class="classes-info">

							<!-- 클래스 명 입력란 -->
							<span class="input input--yoshiko"> 
							<!-- 클래스명 input --> 
							<input class="input__field input__field--yoshiko" type="text" id="input-class-name" name="onedayName"/> 
							<!-- 클래스명 라벨 --> 
							<label class="input__label input__label--yoshiko" for="input-class-name"> 
							<span class="input__label-content input__label-content--yoshiko" data-content="클래스명">클래스명</span>
							</label>
							</span>
								
							<!-- 메뉴 입력란 -->
							<span class="input input--yoshiko"> 
							<!-- 클래스명 input --> 
							<input class="input__field input__field--yoshiko" type="text" id="input-menu-name" name="menuList"/> 
							<!-- 클래스명 라벨 --> 
							<label class="input__label input__label--yoshiko" for="input-menu-name"> 
							<span class="input__label-content input__label-content--yoshiko" data-content="메뉴명">메뉴명</span>
							</label>
							</span>
							<!-- 클래스 비용 입력란 -->
							<span class="input input--yoshiko"> <!-- 클래스 비용 input -->
								<input class="input__field input__field--yoshiko" type="number" step="1000" min="1000"  id="input-class-cost" name="price"/> 
								<!-- 클래스 비용 라벨 --> 
								<label class="input__label input__label--yoshiko" for="input-class-cost"> 
								<span class="input__label-content input__label-content--yoshiko" data-content="클래스 비용">클래스 비용</span>
							</label>
							</span>
							
							<!-- 클래스 소요시간 입력란 -->
							<div class="row m-auto">
								<div class="col-4 px-0 py-3 input">
									<h5 class="insert-title">클래스 소요시간</h5>
								</div>
								<!-- 시간 입력란 -->
								<span class="input input--yoshiko col px-1"> <!-- 시간 input -->
									<input class="input__field input__field--yoshiko" type="number"
									id="input-class-time-h" name="onedayTime" min="0" autocomplete="off" /> 
									<!-- 시간 라벨 -->
									<label class="input__label input__label--yoshiko" for="input-class-time-h"> 
									<span class="input__label-content input__label-content--yoshiko" data-content="시간">시간</span>
								</label>
								</span>
								<!-- 분 입력란 -->
								<span class="input input--yoshiko col pr-0"> 
								<!-- 분 input -->
								<input class="input__field input__field--yoshiko" type="number" id="input-class-time-m" name="onedayTimeM" min="0" max="59" autocomplete="off" />
									<!-- 분 라벨 --> 
								<label class="input__label input__label--yoshiko" for="input-class-time-m"> 
								<span class="input__label-content input__label-content--yoshiko" data-content="분">분</span>
								</label>
								</span>
							</div>
							<!-- 클래스 소요시간 입력란 end -->

							<div class="row">
								<!-- 최대 정원 인원 입력란 -->
								<span class="input input--yoshiko col"> <!-- 최대 정원 인원 input -->
									<input class="input__field input__field--yoshiko" type="number" id="input-class-max" name="onedayMaxper" min="0" max="100" autocomplete="off" /> 
									<!-- 정원 인원 라벨 -->
									<label class="input__label input__label--yoshiko" for="input-class-max"> 
									<span class="input__label-content input__label-content--yoshiko" data-content="정원 인원">정원 인원</span>
								</label>
								</span>
								<!-- 최소 인원 입력란 -->
								<span class="input input--yoshiko col"> <!-- 최소 인원 input -->
									<input class="input__field input__field--yoshiko" type="number" id="input-class-min" name="onedayMinper" min="0" max="100" autocomplete="off" /> 
									<!-- 최소 인원 라벨 -->
									<label class="input__label input__label--yoshiko" for="input-class-min"> 
									<span class="input__label-content input__label-content--yoshiko" data-content="최소 인원">최소 인원</span>
								</label>
								</span>
							</div>
							<!-- 클래스 주소 입력란 -->
							<span class="input input--yoshiko"> <!-- 클래스 주소 input -->
								<input class="input__field input__field--yoshiko" type="text"
								id="input-class-adress" name="detailedAddr" /> <!-- 클래스 주소 라벨 --> <label
								class="input__label input__label--yoshiko"
								for="input-class-adress"> <span
									class="input__label-content input__label-content--yoshiko"
									data-content="클래스 주소">클래스 주소</span>
							</label>
							</span>

							<h5 class="insert-title">클래스 날짜</h5>
							<!-- 클래스 날짜 입력란 -->
							<div class="row m-auto">
								<span class="input input--yoshiko col-9 p-0"> <!-- 클래스 날짜 input -->
									<input
									class="input__field input__field--yoshiko datepicker-here"
									type="text" id="input-date" name="classdate" data-language='kr'
									data-timepicker="true" autocomplete="off" />
								</span>

								<div class="col py-1 pr-0 input">
									<!-- 클래스 날ㅉ 버튼 -->
									<button class="site-btn sb-gradient px-3"
										style="min-width: 100%;" type="button"
										onclick="addClassTime();">추가</button>
								</div>
							</div>
							<!-- 클래스 날짜 리스트 div -->
							<div id="input-date-list" name="classDateList"></div>
						</div>
					</div>
					<div class="sb-widget col py-1 pr-0 input">
						<!-- 위도/경도 더미 값 -->
						<input type="number" name="latitude" value="150" hidden/><input type="number" name="longitude" value="150" hidden/>
						<!-- 클래스 등록 버튼 -->
						<input type="submit" class="site-btn sb-gradient px-3 reservation_class" value="등록하기"></input>
					</div>
				</div>
			</div>
		</form>
	</div>
</section>


<!-- Event Details Section end -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
