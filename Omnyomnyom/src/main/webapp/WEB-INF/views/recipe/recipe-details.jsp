<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<!-- 인코딩설정 안해주면 한글 깨짐  -->

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" />
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mall_slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mall_slider_common.css" />
   	
   	 <script src="${pageContext.request.contextPath }/resources/js/autoslider.js"></script>
    <script>
    	$(function(){
    		<c:choose>
    			<c:when test="${isLiked != null}">
    				$('#recipe_like').children().html('favorite');
					$('#recipe_like').one('click',recipeUnlike);
    			</c:when>
    			<c:otherwise>
    				$('#recipe_like').children().html('favorite_border');
    				$('#recipe_like').one('click',recipeLike);
    			</c:otherwise>
    		</c:choose>
    		<c:choose>
				<c:when test="${scrap != null}">
					$('#recipe_scrap').children().html('스크랩 해제');
					$('#recipe_scrap').on('click',recipeUnscrap);
				</c:when>
				<c:otherwise>
					$('#recipe_scrap').children().html('스크랩');
					$('#recipe_scrap').on('click',recipeScrap);
				</c:otherwise>
			</c:choose>
    	});
    
        var tag = document.createElement('script'); //이거 뭔지 모름
        tag.src = "https://www.youtube.com/iframe_api"; //api 주소
        var firstScriptTag = document.getElementsByTagName('script')[0]; //이거 뭔지 모름
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); //이거 뭔지 모름
        var player; //유튜브 api 전역변수
        var setVideoId = "${recipe.videoLink}"; //유튜브영상 ID
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('testPTag', {
                videoId: setVideoId,
            });
        }

        //유튜브 영상 redirect
        function hreflink(s) {
            player.loadVideoById(setVideoId, s);
        }
        
        function recipeLike(){
        	$.ajax({
				url:"${pageContext.request.contextPath}/recipe/${memberLoggedIn.memberId}/like/${recipe.recipeNo}",
				success : function(data) {
					if(data == 't'){
						let $recipe_like = $('#recipe_like')
						$recipe_like.children().html('favorite');
						$recipe_like.one('click',recipeUnlike);
					}
				},
				error : function(x, s, e) {
					console.log(x, s, e);
				}
			});
        	
        	
        }
        
        function recipeUnlike(){
        	$.ajax({
				url:"${pageContext.request.contextPath}/recipe/${memberLoggedIn.memberId}/unlike/${recipe.recipeNo}",
				success : function(data) {
					if(data == 't'){
						let $recipe_like = $('#recipe_like')
						$recipe_like.children().html('favorite_border');
						$recipe_like.one('click',recipeLike);
					}
				},
				error : function(x, s, e) {
					console.log(x, s, e);
				}
			});
        	
        }
        
        function recipeScrap(){
			let val = prompt("스크랩 내용을 입력하세요.","");
        	
        	console.log(val);
        	if(!$.trim(val)){
        		if(val != null)
        			alert("스크랩 하려면 내용을 입력하세요.");
        		return;
        	}
        	let $recipe_scrap = $('#recipe_scrap');
        	
        	$recipe_scrap.off('click');
        	
        	$.ajax({
				url:"${pageContext.request.contextPath}/recipe/scrap/${recipe.recipeNo}?memo="+val,
				success : function(data) {
					if(data == 't'){
						
						$recipe_scrap.children().html('스크랩 해제');
						$recipe_scrap.on('click',recipeUnscrap);
					}
				},
				error : function(x, s, e) {
					console.log(x, s, e);
				}
			});
        }
        
        function recipeUnscrap(){
        	let bool = confirm('스크랩을 해제하시겠습니까?');
        	
        	if(!bool)
        		return;
        	
        	let $recipe_scrap = $('#recipe_scrap');
        	
        	$recipe_scrap.off('click');
        	
        	$.ajax({
				url:"${pageContext.request.contextPath}/recipe/unscrap/${recipe.recipeNo}",
				success : function(data) {
					if(data == 't'){
						
						$recipe_scrap.children().html('스크랩');
						$recipe_scrap.on('click',recipeScrap);
					}
				},
				error : function(x, s, e) {
					console.log(x, s, e);
				}
			});
        }
    </script><!-- 레시피 영상  Section -->
    <section class="classes-details-section spad overflow-hidden">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="recipe-details">
                        <div class="classes-preview">
                            <h2>${recipe.videoTitle}</h2>
                            <div id="youtubevideo">
                                <div class="recipe-video" id="testPTag"></div>
                            </div>
                            <div class="hashtag" id="hashtag">
                                <br>
                                <a href="#">${recipe.category }</a>
                                <br>
                            </div>
                        </div>
                        <div class="row">
                            <!-- 셰프 정보 -->
                            <div class="col-lg-5">
                                <table>
                                	<tr>
                                    <th>
                                        <img src="/img/classes/author/3.jpg" class="chef-img" alt=""><!-- 후에 셰프 이미지 경로 정하고... -->
                                    </th>
                                    <td>
                                        <h3 class="chef-name"><a href="${pageContext.request.contextPath }/chef/${recipe.chefNick }/chefPage">${recipe.chefNick}</a></h3>
                                        <div class="cd-meta">
                                            <p><i class="material-icons">people_outline</i>조회수 | ${recipe.viewCount }</p>
                                        </div>
                                    </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-7 text-left text-md-right">
                            	<c:if test="${memberLoggedIn != null}">
                            		<a id="recipe_like" style="cursor:pointer;"><i class="material-icons"></i></a><!-- favorite -->
                            		<a id="recipe_scrap" style="cursor:pointer;"><div class="cd-price"></div></a>
                                </c:if>
                            </div>
                        </div>
                        <div class="row">
                            <h3 style="margin-top:30px; border-bottom:3px solid black; margin-bottom:30px;">재료</h3>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col" colspan="2">재료명</th>
                                        <th scope="col">용량</th>

                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${recipe.ingredientList}" var="ingr" varStatus="vs">
                                    <tr>
                                        <th scope="row">${vs.count }</th>
                                        <td colspan="2">${ingr.ingredientName }</td>
                                        <td>${ingr.minWeight }</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                        </div>
                        <!-- 셰프 설명글 -->

                        <pre  style="ont-size: 15px; color: #666666; line-height: 1.8; font-family: 'Noto Sans KR', sans-serif; white-space: pre-wrap;">${recipe.recipeContent }</pre>
                    </div>
               
                    
                </div>

                <div class="col-lg-5 col-md-6 col-sm-9 sidebar">
                    <!-- 타임 스탬프 start -->
                    <div class="sb-widget">
                        <h2 class="sb-title">요리방법 </h2>
                        <div class="classes-info">
                        <c:forEach items="${fn:split(recipe.timeline,'⇔')}" var="timeline" varStatus="vs">
                            <p class="yt_time_stamp" onclick="hreflink(${fn:split(timeline,'∮')[0]});"><span>${vs.count }.</span>&nbsp;${fn:split(timeline,'∮')[1] }</p>
                        </c:forEach>
                        </div>
                    </div>
                    <!-- 타임 스탬프 end -->
                    
					<div class="sb-widget">
                        <h2 class="sb-title">연관영상</h2>
                        <div class="another-video-widget">
                            <table>
                               <c:forEach items="${relationRecipes}" var="recipe" varStatus="vs">
                                <tr>
                                    <!-- 유튜브 썸네일 추출 방식-->
                                    <th>
                                    	<a href="${pageContext.request.contextPath }/recipe/recipe-details?recipeNo=${recipe.recipeNo}">
                                    		<img src="https://img.youtube.com/vi/${recipe.videoLink}/mqdefault.jpg" alt="" width="200" height="100">
                                    	</a>
                                    </th>
                                    <td>
                                    	<a href="${pageContext.request.contextPath }/recipe/recipe-details?recipeNo=${recipe.recipeNo}">
                                    	<ul>
                                        <li>${recipe.videoTitle}</li>
                                        <li>${recipe.chefNick }</li>
                                        <li>${recipe.viewCount}</li>
                                        </ul>
                                        </a>
                                    </td>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 재료 판매 -->
            <div class="row">
                <div class="goods-add-product">
                    <div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
                        <h3 class="goods-add-product-title">뇸뇸몰</h3>
                        <button class="goods-add-product-move goods-add-product-move-left __slide-go-left">왼쪽으로 슬라이드 이동</button>
                        <button class="goods-add-product-move goods-add-product-move-right __slide-go-right">오른쪽으로 슬라이드 이동</button>
                        <div class="goods-add-product-list-wrapper" style="height:320px">
                            <ul class="goods-add-product-list __slide-mover" style="left: 0px;">
						<c:forEach items="${ingrMallList}" var="ingrMall" varStatus="vs">
	                                <li class="goods-add-product-item __slide-item">
	                                    <div class="goods-add-product-item-figure">
	                                        <a href="${pageContext.request.contextPath }/mall/productDetail?ingMallNo=${ingMall.ingMallNo}" target="_blank">
	                                        	<img src="${pageContext.request.contextPath }/resources/images/ingredient/${ingrMall.prevImg}" class="goods-add-product-item-image" 
	                                        		 onerror="this.src='${pageContext.request.contextPath }/resources/images/mall/ing_info_default.png'">
	                                        </a>
	                                    </div>
	                                    <div class="goods-add-product-item-content">
	                                        <div class="goods-add-product-item-content-wrapper">
	                                            <p class="goods-add-product-item-name">${ingrMall.ingMallName} </p>
	                                            <p class="goods-add-product-item-price">${ingrMall.price}원</p>
	                                        </div>
	
	                                    </div>
	                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 댓글 -->
            <div  id="comment">
            <h3 class="comment-title mt-3">댓글</h3>
            <ul class="comment-list">
                <li>
                    <div class="comment-text">
                        <h3>Beverly Price </h3>
                        <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                        <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                        <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                    </div>
                    <ul class="comment-sub-list">
                        <li>
                            <div class="comment-text">
                                <h3>Jacqueline Watkins</h3>
                                <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                                <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                                <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li>
                    <div class="comment-text">
                        <h3>Lori Gonzales</h3>
                        <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                        <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                        <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                    </div>
                </li>
                <c:if test="${memberLoggedIn != null}">
                <li>
                <form class="singup-form">
                	<div>
                        <textarea name="content" placeholder="댓글 작성"></textarea>
                        <a href="#" class="site-btn sb-gradient">댓글 달기</a>
                    </div>
                </form>
                </li>
                </c:if>
            </ul>
            </div>
            <div id="question">
            <h3 class="comment-title">문의하기</h3>
            <form class="singup-form">
                <div class="row">
                    <div class="col-md-6">
                        <input type="text" placeholder="First Name">
                    </div>
                    <div class="col-md-6">
                        <input type="text" placeholder="Last Name">
                    </div>
                    <div class="col-md-6">
                        <input type="text" placeholder="Your Email">
                    </div>
                    <div class="col-md-6">
                        <input type="text" placeholder="Phone Number">
                    </div>
                    <div class="col-md-12">
                        <textarea placeholder="Message"></textarea>
                        <a href="#" class="site-btn sb-gradient">Send message</a>
                    </div>
                </div>
            </form>
            </div>
        </div>
    </section>
    <!-- Classes Details Section end -->

		

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>