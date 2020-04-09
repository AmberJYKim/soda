<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩설정 안해주면 한글 깨짐  -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chefList.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">

 <script>
            $(document).ready(function(){
                $("#Ylist").hide();
                
                
                $("section .row .chef_list").on("click", function(e) {
                	
                	$("h6.chefSelectOne").removeClass("chefPageGo");
                    $(".image_overflow_hidden").css("box-shadow", "none");
                    $(this).find(".image_overflow_hidden").css("box-shadow", "#4949E7 0px 0px 0px 4.5px");
                    console.log($(this));
                    
                    $("#Ylist").show();
                    $(this).find("h6").addClass("chefPageGo");
           
                });
            });
 </script>

    <section class="page-top-section page-sp set-bg" data-setbg="img/page-top-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 m-auto text-white">
                    <h2>CHEF CHANNAL</h2>
                    <p>셰프채널 </p>
                </div>
            </div>
        </div>
    </section>
    <!-- 1 -->
    <!-- Page top Section end -->
    <div class="container">
        <div class="event-filter-warp">
            <div class="row">
                <div class="col-xl-2">
                    <p>셰프별 검색</p>
                </div>
                <div class="col-xl-10">
                    <form class="event-filter-form" 
                    		Method="GET"
                    		onsubmit="return cheafSearch();" 
                    		action="${pageContext.request.contextPath }/chef/chefSearch">
                        <div class="ef-item">
                            <i class="material-icons">search</i>
                            <input type="text" placeholder="" id="chefsearchBar" name="chefsearchBar">
                        </div>
                        <input type="submit" class="site-btn sb-gradient" id="chefsearch" value="셰프 검색">
                    </form>
                </div>
            </div>
        </div>
    </div>

<Script>
 $(function(){
	 
	function chefSearch(){
		let chefsearchBar = $("#chefsearchBar").val();
		
		if(chefsearchBar == ""){
			alert("검색어를 입력해 주세요.");
			return false;
		}
		
		return true;
		
		
		/*  $.ajax({
			url:"${pageContext.request.contextPath}/chef/"+chefsearchBar+"/chefsearch",
			success: data => {
				
				console.log(data);
				
				if(data == null){
					alert("해당 결과가 없습니다."); 
				}else{
					$("#")	
				}
				
			},
			error : (x,s,e) =>{
				console.log(x,s,e);
			}
			
		 });
 */	
 	};
 });
</Script>

    <section class="sectionArea">


        <div class="container chef-List">
            <div class="row">
                <div class="col-lg-12 listbutton">
                    <button type="button" class="btn btn-outline-danger">인기순</button>
                    <button type="button" class="btn btn-outline-danger">전체</button>
                </div>
            </div>

<!-- 셰프리스트  -->
            <div class="row">
            <c:forEach items="${chefList}" var="chef" >
                <div class="col-xs-6 col-sm-3 plsaceholder chef_list" style="margin-top:50px;">
                    <div class="image_overflow_hidden">
                       <img id="profile" src="${pageContext.request.contextPath}/resources/upload/profile/${chef.chefProfile}" class="" alt="">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <h6 class="chefSelectOne" id="${chef.chefNickName}">${chef.chefNickName}</h6>
                            <c:forEach items="${chef.chefCategoryList}" var="vs">
                            	<span class="color-2">#${vs}</span>
                            </c:forEach>
                        </div>
                        <div class="col-4 align-self-center">
                            <button type="button">채널</button>
                        </div>
                    </div>
                </div>
               </c:forEach>      
            </div>

<!-- 셰프클릭시 해당 셰프영상 밑에 뜨기 -->

            <div class="row" id="Ylist">
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <a href="${pageContext.request.contextPath }/recipe/recipe-details.do"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" class="chef-Thumbnail">
                    <p class="chef-Thumbnail-title">불맛나는 고기 짬뽕라면</p></a>
                    <div class="row">
                        <div class="col-8">
                            <img src="/img/1508_008.jpg" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;">
                            <span class="chef-min-name">1종원</span>
                        </div>
                        <div class="col-4 chef-view-count">
                            <span>조회수 250</span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <a href="${pageContext.request.contextPath }/recipe/recipe-details.do"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" class="chef-Thumbnail">
                    <p class="chef-Thumbnail-title">불맛나는 고기 짬뽕라면</p></a>
                    <div class="row">
                        <div class="col-8">
                            <img src="/img/1508_008.jpg" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;">
                            <span class="chef-min-name">1종원</span>
                        </div>
                        <div class="col-4 chef-view-count">
                            <span>조회수 250</span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <a href="${pageContext.request.contextPath }/recipe/recipe-details.do"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" class="chef-Thumbnail">
                    <p class="chef-Thumbnail-title">불맛나는 고기 짬뽕라면</p></a>
                    <div class="row">
                        <div class="col-8">
                            <img src="/img/1508_008.jpg" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;">
                            <span class="chef-min-name">1종원</span>
                        </div>
                        <div class="col-4 chef-view-count">
                            <span>조회수 250</span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <a href="${pageContext.request.contextPath }/recipe/recipe-details.do"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" class="chef-Thumbnail">
                    <p class="chef-Thumbnail-title">불맛나는 고기 짬뽕라면</p></a>
                    <div class="row">
                        <div class="col-8">
                            <img src="/img/1508_008.jpg" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;">
                            <span class="chef-min-name">1종원</span>
                        </div>
                        <div class="col-4 chef-view-count">
                            <span>조회수 250</span>
                        </div>
                    </div>
                  <!--   <p class="chef-Thumbnail-link" onclick="go_chefpage();"> &nbsp;&nbsp; 채널로 이동 &nbsp;&nbsp;</p> -->
                  	
                	<input type="button" class="chef-Thumbnail-link" onclick="go_chefpage();" value="채널로 이동">
                
                </div>
            </div>
            
         </div>
        <!-- end-->
       
    </section>

	<script>
	function go_chefpage(){
    	let chefNickName = $("h6.chefPageGo").attr('id');
    	alert( $("h6.chefPageGo").attr('id'));
    	location.href = "${pageContext.request.contextPath}/chef/"+chefNickName+"/chefPage";
    }
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>