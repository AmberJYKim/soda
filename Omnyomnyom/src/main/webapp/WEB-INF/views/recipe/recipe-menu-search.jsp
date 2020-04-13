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
    <%  
    	request.setCharacterEncoding("UTF-8");
	    
    %>
    
    <script>
    	var contextPath = "${pageContext.request.contextPath}";    
    	/* ------------------------------------------------------- */
 	$().ready(function(){
		console.log('jquery로드 완료');
		subCtgload();
		
	});
	
    	
    	//검색버튼 클릭 이벤트
	function keywordValidate() {
		let searchKey = $("#searchKey");
		
		console.log(searchKey.val());
		
		if(searchKey.val().trim().length == 0){
			alert("최소 한 글자 이상 입력해야 검색이 가능합니다.");
			searchKey.focus();
			return false;
		}	
		
		true;
	}    	
    	
	function subCtgload(){
		/* 메인 카테고리 선택에 따른 변경 */
		$(".main-ctg-menu p").on('click', function(){
			/* 이미 선택된 분류라면 아래의 코드 수행하지 않음 */
			
		 	if($(this).hasClass("active"))
				return; 
			
			console.log($(this));
			let mainCtg = {'mainCtg' : $(this).html()};
			
			console.log(mainCtg);
			$(".main-ctg-menu p").removeClass("active");
		 	$(this).addClass("active");
			
			$.ajax({
				url: contextPath+"/recipe/getSubMenuCtg",
				dataType: "json",
				method : "GET",
				data: mainCtg,
				success : data =>{
					console.log(data);
					/* 서브 카테고리 교체작업 */
					let subCtgList = ' '; 
					$.each(data,function(index, item){
						
						
						subCtgList += '<li> <p>'+item+'</p> </li>';
						
						
						console.log(item);
					});
					$(".sub-ctg-menu").html(subCtgList);
					selectSubCt();
				},
				error : (x,s,e) =>{
					console.log(x,s,e);
				}
			});
			
			
		});
	}; //서브 카테고리 교체 끝
	
	
	function selectSubCt(){
		$(".sub-ctg-menu p").on('click', function(){
			if($(this).hasClass("active"))
				return; 
			
			console.log($(this));
			let subCtg = $(".sub-ctg-menu p.active").text();
			
			$(".sub-ctg-menu p").removeClass("active");
		 	$(this).addClass("active");
			
		});
		
	};
    
	
	//선택된 재료로 검색 , 버튼 클릭에 따른 이벤트 작동.
	function recipeSearchByIng(){
		console.log("버튼 클릭됨");
		let pTagList = $('.selected-ingredients').children('p');
		let ingNoArr = new Array();
		$.each(pTagList, function(index, item){
			ingNoArr[index] = $(item).data('ingredientno');
		});
		let forwardingData = {"ingNoArr" : ingNoArr};
		$.ajax({
			url: contextPath+"/recipe/recipeSerachByIng",
			dataType: "json",
			method : "GET",
			data: forwardingData,
			success : data =>{
			
				console.log(data);
				
				RList = data.recipeList;
				/* 검색된 영상 리스트  교체작업*/
				$("div.searchList").empty();
				$.each(RList, function(index, item){
					let eachRecipe = '<div class="col-xs-6 col-sm-3 placeholder chef_list">' +
									'<a href="'+contextPath+'/recipe/recipe-details?recipeNo='+item.recipeNo+'"><img src="https://img.youtube.com/vi/'+item.videoLink+'/mqdefault.jpg" alt="" class="chef-Thumbnail">'+
									'<div class="forTitle"><p class="chef-Thumbnail-title">'+item.videoTitle+'</p></div></a>' +
									'<div class="row"> <div class="col-8">'+
									'<img src="'+item.chefProfile+'" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;"> <span class="chef-min-name">'+item.chefNick+'</span></div>' +						
									'<div class="col-4 chef-view-count"> <span><small> 조회수 :'+item.viewCount+'</span> </small></div>'+
									'</div> </div>';
					
					
					$("div.searchList").append(eachRecipe);
				});
				
			},
			error : (x,s,e) =>{
				console.log(x,s,e);
			}
		});
		
		
	}; 
	
	
	
	
	
    </script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/recipe/searchbymenu.js"></script> --%>    
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
                    <form class="event-filter-form" method="GET" action="${pageContext.request.contextPath}/recipe/searchByMenu" onsubmit="return keywordValidate();" >
                        <div class="ef-item">
                            <i class="material-icons">search</i>
                            <input type="text" placeholder="검색하고자 하는 메뉴의 이름을 입력하세요~" id="searchKey" name="searchKeyword">
                        </div>
                         <input class="site-btn sb-gradient" type="submit" value="검색 하기">
                    </form>
                </div>
            </div>
        </div>
    </div>
	<!-- 검색바 끝 -->
    <section class="classes-details-section overflow-hidden">
        <div class="container">
            <!--  셰프채널 navbar -->
            
		 <c:if test="${not empty searchedList }">
            <div class="container">
				<ul class="main-ctg-menu">
					<li> <p>한식</p> </li>
					<li> <p>중식</p> </li>
					<li> <p>일식</p> </li>
					<li> <p>양식</p> </li>
					<li> <p>즉석식</p> </li>
					<li> <p>밀식</p> </li>
					<li> <p>건강식</p> </li>
				</ul>
			</div>
		
		<div class="row">
			<div class="container">
				<ul class="sub-ctg-menu">

				</ul>
			</div>
		</div>
        </c:if>
        </div>
	</section>   
	<section class="overflow-hidden spad">
	<div class="container col-md-12">
		<div class="container">
			<!-- 영상리스트 섹션 -->
			
				<c:if test="${not empty searchedList }">
			<div class=row>
				<h4>"<c:if test="${not empty searchKey}"> ${searchKey }</c:if>"로 메뉴 검색  결과</h4>
			</div>
			<div class="row Ylist" id="Ylist">
					
			</div>
			<!-- 페이지 바 달기 -->
			
			<div class="row ing-paging text-center">
					<ul class="pagination justify-content-center col">

					</ul>
				</div>
			</c:if>
			<div class=row>
				<h5>인기영상</h5>
			</div>
			<div class="row Ylist" id="Ylist">
				<c:if test="${not empty popRecipe}">
					<c:forEach items="${popRecipe}" var="rec">
					<div class="col-xs-6 col-sm-3 placeholder chef_list">
						<a
							href="${pageContext.request.contextPath }/recipe/recipe-details?recipeNo=${rec.recipeNo }"><img
							src="https://img.youtube.com/vi/${rec.videoLink }/mqdefault.jpg" alt=""
							class="chef-Thumbnail">
							<div class="forTitle"><p class="chef-Thumbnail-title">${rec.videoTitle }</p></div></a>
						<div class="row">
							<div class="col-8">
								<img src="${pageContext.request.contextPath }/resources/upload/profile/${rec.chefProfile }" class="" alt=""
									style="width: 40px; height: 40px; border-radius: 50%;"> <span
									class="chef-min-name">${rec.chefNick }</span>
							</div>
							<div class="col- chef-view-count">
								<span><small>조회수 : ${rec.viewCount }</small></span>
							</div>
						</div>
					</div>
					</c:forEach>
				</c:if> 
			</div>
		</div>
		<!-- end-->
	</div>
</section>
    	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>