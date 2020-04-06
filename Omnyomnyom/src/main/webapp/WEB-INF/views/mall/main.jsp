<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>
<style>
.search-bar-header{
	margin-top: 45px;
}
</style>

 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mall_delivery_info.css" />
<section class="event-details-section spad overflow-hidden">
        <div class="tm-section-2">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <h2 class="tm-section-title">뇸뇸몰</h2>
                        <p class="tm-color-white tm-section-subtitle">신선한 식재료만을 추구합니다. </p>
                    </div>
                </div>
            </div>
        </div>   
        <div class="container">
        <div class="event-filter-warp search-bar-header">
            <div class="row">
                <div class="col-12">
                    <form class="event-filter-form row">
                    	<div class="col"></div>
                        <div class="ef-item col-5">
                            <i class="material-icons">search</i>
                            <input type="text" placeholder="">
                        </div>
                        <button class="site-btn sb-gradient col-2">메뉴 검색</button>
                    	<div class="col"></div>
                    </form>
                </div>
		         </div>
		     </div>
	 	</div>	     
        <div class="container">
            <div class="row ">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row ingre-list"> 
                        <div class="col-11">
                            <div class="container">
                                <ul class="main-ctg-menu catch-click-event">
                                    <li>
                                        <p class="active">채소/과일</p>
                                    </li>
                                    <li>
                                        <p>육류</p>
                                    </li>
                                    <li>
                                        <p>수산물</p>
                                    </li>
                                    <li>
                                        <p>곡물/견과류</p>
                                    </li>
                                    <li>
                                        <p>양념/소스</p>
                                    </li>
                                    <li>
                                        <p>가공/유제품</p>
                                    </li>
                                    <li>
                                        <p>기타</p>
                                    </li>
                                </ul>
                            </div>
                            <div class="row sub-container">
                                <div class="bx container ">
                                    <div class="container">
                                        <ul class="sub-ctg-menu catch-click-event">
                                        </ul>
                                    </div>
                                </div>
                            </div>                    
                        </div>

                        <div class="col-3 row product_container">
                            <img src="${pageContext.request.contextPath }/resources/images/ingredient/image_recipe_ramen.png" alt="" class="col-12">
                            <div class="col-6">
                                <p class="mini-font">라면(150g)</p>
                            </div>
                            <div class="col-6">
                                <p class="mini-font price-font">11,500</p>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>    
        </div>

    </section>

    <style>
    	.border-rai{
    		border-radius: 50%;
    	}
        .price-font{
            color: red;
        }
        .mini-font{
            font-size: small;
            font-weight: 400;
            margin-bottom: 0.2em;
        }
        /* 메인 카테고리 관련 */
        .main-ctg-menu {
            list-style: none;
            text-align: center;
            padding-top: 15px;
        }
        @media only screen and (min-width: 768px) and (max-width: 991px),
        only screen and (min-width: 576px) and (max-width: 767px),
        (max-width: 576px) {
            .main-ctg-menu {
                display: none;
            }
        }
        .main-ctg-menu li {
            display: inline-block;
            margin-right: 50px;
            position: relative;
        }
        .main-ctg-menu li>p:hover {
            color: rgba(205, 92, 92, 0.753);
        }
        @media only screen and (min-width: 992px) and (max-width: 1200px) {
            .main-ctg-menu li {
                margin-right: 15px;
            }
        }
        .main-ctg-menu li:last-child {
            margin-right: 0;
        }
        .main-ctg-menu li>p {
            display: block;
            padding-bottom: 5px;
            font-size: 15px;
            font-weight: 600;
            text-transform: uppercase;
            color: gray;
        }
        .main-ctg-menu li>p.active {
            color: indianred;
        }
        /* 서브 카테고리 관련 */
        .sub-ctg-menu {
            list-style: none;
            text-align: center;
            padding-top: 15px;
        }
        @media only screen and (min-width: 768px) and (max-width: 991px),
        only screen and (min-width: 576px) and (max-width: 767px),
        (max-width: 576px) {
            .sub-ctg-menu {
                display: none;
            }
        }
        .sub-ctg-menu li {
            display: inline-block;
            margin-right: 50px;
            position: relative;
        }
        @media only screen and (min-width: 992px) and (max-width: 1200px) {
            .sub-ctg-menu li {
                margin-right: 15px;
            }
        }
        .sub-ctg-menu li:last-child {
            margin-right: 0;
        }
        .sub-ctg-menu li>p {
            display: block;
            padding-bottom: 5px;
            font-size: 14px;
            font-weight: 600;
            text-transform: uppercase;
            color: gray;
        }
        .sub-ctg-menu li>p.active {
            border-bottom: 3px solid indianred;
        }
        .sub-ctg-menu li>p:hover {
            border-bottom: 3px solid rgba(205, 92, 92, 0.753);
        }

    </style>

<script>
	$(document).on("click",".sub-ctg-menu p",function(){
			console.log("1");
		    	ingredient_list($(this));
		    	console.log("서브메뉴")
	});
	function ingredient_list(e){
		let subCtg = $(e).text();
		$.ajax({
 	    	url:"${pageContext.request.contextPath}/mall/seachList/"+subCtg+"/ajax",
	    	data : subCtg,
	    	dataType : 'json',
	    	method : "GET",
	    	success : data =>{
	    	/* 재료목록 교체작업 */
	    		console.log(data);
		        $(e).addClass("active");
		        $(e).parent().siblings().find("p").removeClass("active");
		        $(".product_container").remove();
		    	$.each(data,function(index, item){
		    		let ingMall = '';
		    		ingMall = "<div class='col-3 row product_container'>"
                           +"<img src='${pageContext.request.contextPath }/resources/images/ingredient/"+item.mallEngPrCategory+"/"+item.mallEngCdCategory+"/"+item.prevImg+"' alt='' class='col-12 border-rai'>"
                           +"<div class='col-6'>"
                           +"<p class='mini-font'>"+item.ingMallName+"("+item.minUnit+")</p>"
                           +"</div>"
                           +"<div class='col-6'>"
                           +"<p class='mini-font price-font'>"+item.price+"</p>"
                           +"</div>"
                           +"</div>";
			    	$(".ingre-list").append(ingMall);
		    	});
	
	    	},
	    	error : (x,s,e) =>{
	    		console.log(x,s,e);
	    	}
		});
	}
    $(function(){
	    $(".catch-click-event").find("p").on("click",function(){
	        $(this).addClass("active");
	        $(this).parent().siblings().find("p").removeClass("active");
	        console.log($(this).text());
	    });
		
	    $(".product_container").on("click",function(){
	    	location.href = "${pageContext.request.contextPath }/mall/productDetail.do";
	    });
	    $(".main-ctg-menu").find("p").on("click",function(){
	    	cd_category($(this));
	    });
	    
	   
	    
	    function cd_category(e){
	    	let mainCtg = {'mainCtg':$(e).html()};
	    	$.ajax({
		    	url:"${pageContext.request.contextPath}/recipe/getSubCtg",
		    	dataType: "json",
		    	method : "GET",
		    	data: mainCtg,
		    	success : data =>{
		    	/* 서브 카테고리 교체작업 */
			    	let subCtgList = ' ';
			    	$.each(data,function(index, item){
				    	if(index == 0){
				    		subCtgList += '<li> <p class="active">'+item+'</p> </li>';
				    	}else{
					    	subCtgList += '<li> <p>'+item+'</p> </li>';
				    	}
			    	});
			    	$(".sub-ctg-menu").html(subCtgList);
		    	},
		    	error : (x,s,e) =>{
		    		console.log(x,s,e);
		    	}
	    	});
    	}
    	
    })

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
