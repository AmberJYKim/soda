<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩설정 안해주면 한글 깨짐  -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="메뉴명으로 레시피 검색하기~!" name="pageTitle"/>
</jsp:include>
    <!-- Main Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe-search(Menu).css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe-search(Ingredients).css">
    
    <script>
    	var contextPath = "${pageContext.request.contextPath}";    
    </script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/recipe/searchbymenu.js"></script>    
        <style>
    .mid-select{
        margin-left: 27px;
        padding-bottom: 50px;
        padding-top: 15px;
    }
    .select li{
        margin-right: 70px;
    
    }
    </style>
    
            <!-- --------------------------------------------------------------------------------------------------------- -->
        <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
    
        <section class="page-top-section page-sp set-bg" data-setbg="img/page-top-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 m-auto text-white">
                        <h2>메뉴 이름으로 레시피 검색</h2>
                        <p>메뉴 이름으로 검색하고 카테고리별로 필터링하기</p>
                    </div>
                </div>
            </div>
        </section>
			
<!-- Page top Section end -->

	<!-- 검색바 시작 -->
    <div class="container">
        <div class="event-filter-warp">
            <div class="row">
                <div class="col-xl-2">
                    <p>메뉴로 검색</p>
                </div>
                <div class="col-xl-10">
                    <form class="event-filter-form">
                        <div class="ef-item">
                            <i class="material-icons">search</i>
                            <input type="text" placeholder="">
                        </div>
                        <button class="site-btn sb-gradient">메뉴 검색</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<!-- 검색바 끝 -->
    <section class="classes-details-section spad overflow-hidden">
        <div class="container">
            <!--  셰프채널 navbar -->
            
            <div class="container">
			<ul class="main-ctg-menu">
				<li>
					<p>한식</p>
				</li>
				<li>
					<p>중식</p>
				</li>
				<li>
					<p>일식</p>
				</li>
				<li>
					<p>양식</p>
				</li>
				<li>
					<p>즉석식</p>
				</li>
				<li>
					<p>밀식</p>
				</li>
				<li>
					<p>건강식</p>
				</li>
			</ul>
		</div>
		
		<div class="row">
			<div class="container">
				<ul class="sub-ctg-menu">

				</ul>
			</div>
		</div>
           
                
    </section><!--  -->
    
    	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>