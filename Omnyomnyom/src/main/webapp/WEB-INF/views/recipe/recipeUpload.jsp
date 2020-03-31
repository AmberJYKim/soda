<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩설정 안해주면 한글 깨짐  -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/recipeUpload.css"/>
	<script src="${pageContext.request.contextPath }/resources/js/upload.js"></script>
		<!-- 해시태그부분 소스 -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/themes/prism.min.css">
        <script src='https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/prism.min.js'></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/tagify.css">
		<script src="${pageContext.request.contextPath }/resources/js/jq.multiinput.js"></script>
		<script src="${pageContext.request.contextPath }/resources/js/tagify.js"></script>
		<script src="${pageContext.request.contextPath }/resources/js/jQuery.tagify.min.js"></script>	
	
		<!-- 타임스탬프 -->
		<link href="${pageContext.request.contextPath }/resources/css/jq.multiinput.min.css" rel="stylesheet">
	
		 <!-- 에디터 부분 -->
		 <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
		 
		<style contenteditable>
			.tags-look .tagify__dropdown__item{
			  display: inline-block;
			  border-radius: 3px;
			  padding: .3em .5em;
			  border: 1px solid #CCC;
			  background: #F3F3F3;
			  margin: .2em;
			  font-size: .85em;
			  color: black;
			  transition: 0s;
			}
			
			.tags-look .tagify__dropdown__item--active{
			  color: black;
			}
			
			.tags-look .tagify__dropdown__item:hover{
			  background: lightyellow;
			  border-color: gold;
			}
			</style>	




	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
	
	<section class="page-top-section page-sp set-bg" data-setbg="img/page-top-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 m-auto text-white">
					<h2>레시피 등록하기</h2>
					<p>여러분이 자랑하고픈, 획기적인 아이디어와 손재주를 발휘해보세요.</p>
				</div>
			</div>
		</div>
	</section>
	 <!-- Page top Section end -->

	                                                                            
	<!-- 레시피 영상  Section -->
	<section class="classes-details-section spad overflow-hidden">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="recipe-details">
						<div class="classes-preview">
							<div class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text" id="basic-addon1">제목</span>
                                </div>
                                <input type="text" class="form-control" placeholder="레시피제목을 입력하세요." aria-label="Username" aria-describedby="basic-addon1">
							  </div>
							<hr>
							<!-- 이미지 등록 -->
							<span class="warning">*영상은 URL업로드 혹은 fileUpload중 한가지만 선택할 수 있습니다.</span>
							<div class="oneday_class_img">
								<div id="uploadbtn" class="uploadbtn" onclick="upload(this)">Upload Files</div>
								<input type='file' id="imgInput" hidden/>
								<!-- <img src="#" alt="" id="image_section"> -->
								<video src="#" alt=""id="image_section"></video>
							</div>
							
							<div class="input-group mb-3">
								<div class="input-group-prepend">
								  <span class="input-group-text" id="basic-addon1">URL</span>
								</div>
								<!-- <input class="form-control" name='basic' value="" placeholder="해시태그를 입력하세요." aria-label="Username" aria-describedby="basic-addon1" autofocus> -->
								<input class="form-control" name="" class="some_class_name" placeholder="해당 영상의 URL을 입력하세요." value="" aria-label="Username" aria-describedby="basic-addon1" autofocus>
							</div>
							<hr>
								<div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text" id="basic-addon1">해시태그</span>
									</div>
									<!-- <input class="form-control" name='basic' value="" placeholder="해시태그를 입력하세요." aria-label="Username" aria-describedby="basic-addon1" autofocus> -->
									<input class="form-control" name="input-custom-dropdown" class="some_class_name" placeholder="해시태크를 입력하세요." value="" aria-label="Username" aria-describedby="basic-addon1" autofocus>
								</div>
							<hr>
								<!-- 재료입력 -->
								<h6 class="insert-title">재료를 입력하세요.</h6>
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
                                <div class="row m-auto">
                                <span class="input input--yoshiko col-4 p-0">
                                    <input class="form-control" type="text" id="input-date" data-language='kr' data-timepicker="true" autocomplete="off" placeholder="재료명을 입력하세요."/>
								</span>
								<span class="input input--yoshiko col-4 p-0">
                                    <input class="form-control" type="text" id="input-date" data-language='kr' data-timepicker="true" autocomplete="off" placeholder="중량을 입력하세요."/>
                                </span>
                                <div class="col py-1 pr-0 input">
                                <!-- <button class="site-btn sb-gradient px-3" style="min-width: 100%;" type="button" onclick="addClassTime();">추가</button> -->
									<i class="fa fa-lg fa-plus-circle" style="min-width: 100%;" onclick="addClassTime();" type="button"></i>
								</div>
                                </div>
                                <div id="input-date-list"></div>
								</div>
							</div>
						</div>	
						<hr>
						</div>

						<div class="row">
							<!-- 셰프 정보 -->
							<!-- <div class="col-lg-5">
								
								<table>
								<th>
									<img src="img/classes/author/3.jpg" class="chef-img" alt="">
								</th>
								<td>
									<h3 class="chef-name">백종원</h3>
									<div class="cd-meta"></div>
								</td>
								</table>
							
							</div>	 -->
							<div class="col-lg-6 text-left text-md-right">
							</div>
						</div>
						<div class="row mb-5">
							
						</div>
					</div>
				<!-- 댓글 -->
				<div class="updatetext">
					<h6>해당 영상의 부가 설명을 입력하세요.</h6>
				</div>
				<div class="row recipe-editor">
					<div class="col-lg-12">

						<textarea name="editor1"></textarea>

					</div>
				</div>
			</div>
			
				<div class="col-lg-5 col-md-6 col-sm-9 sidebar">
				<!-- 타임 스탬프 start -->
					<div class="sb-widget">
						<h6 class="sb-title">요리방법을 작성해주세요. </h6>
						<div class="classes-info">
							<div class="container">
								<div class="row">
									<div class="col-xs-4">
									<div class="form-control" id="participants" name="participants"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 타임 스탬프 end -->

				</div>
			</div>
		</div>
	</section>
	<!-- Classes Details Section end -->

		


<!-- <script crossorigin="anonymous" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->


	
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>