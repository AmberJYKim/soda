<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>

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
        </div>        <div class="container">
            <div class="row ">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row"> 
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
                                            <li>
                                                <p class="active">인기재료</p>
                                            </li>
                                            <li>
                                                <p>과일</p>
                                            </li>
                                            <li>
                                                <p>잎채소</p>
                                            </li>
                                            <li>
                                                <p>열매채소</p>
                                            </li>
                                            <li>
                                                <p>뿌리채소</p>
                                            </li>
                                            <li>
                                                <p>버섯</p>
                                            </li>
                                            <li>
                                                <p>나물/허브류</p>
                                            </li>
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
                        <div class="col-3 row product_container">
                            <img src="${pageContext.request.contextPath }/resources/images/ingredient/image_recipe_ramen.png" alt="" class="col-12">
                            <div class="col-6">
                                <p class="mini-font">라면(150g)</p>
                            </div>
                            <div class="col-6 ">
                                <p class="mini-font price-font">11,500</p>
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
                        <div class="col-3 row product_container">
                            <img src="${pageContext.request.contextPath }/resources/images/ingredient/image_recipe_ramen.png" alt="" class="col-12">
                            <div class="col-6">
                                <p class="mini-font">라면(150g)</p>
                            </div>
                            <div class="col-6">
                                <p class="mini-font price-font">11,500</p>
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
                        <div class="col-3 row product_container">
                            <img src="${pageContext.request.contextPath }/resources/images/ingredient/image_recipe_ramen.png" alt="" class="col-12">
                            <div class="col-6">
                                <p class="mini-font">라면(150g)</p>
                            </div>
                            <div class="col-6">
                                <p class="mini-font price-font">11,500</p>
                            </div>
                        </div>                        <div class="col-3 row product_container">
                            <img src="${pageContext.request.contextPath }/resources/images/ingredient/image_recipe_ramen.png" alt="" class="col-12">
                            <div class="col-6">
                                <p class="mini-font">라면(150g)</p>
                            </div>
                            <div class="col-6">
                                <p class="mini-font price-font">11,500</p>
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
                        <div class="col-3 row product_container">
                            <img src="${pageContext.request.contextPath }/resources/images/ingredient/image_recipe_ramen.png" alt="" class="col-12">
                            <div class="col-6">
                                <p class="mini-font">라면(150g)</p>
                            </div>
                            <div class="col-6">
                                <p class="mini-font price-font">11,500</p>
                            </div>
                        </div>                        <div class="col-3 row product_container">
                            <img src="${pageContext.request.contextPath }/resources/images/ingredient/image_recipe_ramen.png" alt="" class="col-12">
                            <div class="col-6">
                                <p class="mini-font">라면(150g)</p>
                            </div>
                            <div class="col-6">
                                <p class="mini-font price-font">11,500</p>
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
                        <div class="col-3 row product_container">
                            <img src="${pageContext.request.contextPath }/resources/images/ingredient/image_recipe_ramen.png" alt="" class="col-12">
                            <div class="col-6">
                                <p class="mini-font">라면(150g)</p>
                            </div>
                            <div class="col-6">
                                <p class="mini-font price-font">11,500</p>
                            </div>
                        </div>                        <div class="col-3 row product_container">
                            <img src="${pageContext.request.contextPath }/resources/images/ingredient/image_recipe_ramen.png" alt="" class="col-12">
                            <div class="col-6">
                                <p class="mini-font">라면(150g)</p>
                            </div>
                            <div class="col-6">
                                <p class="mini-font price-font">11,500</p>
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
    $(".catch-click-event").find("p").on("click",function(){
        $(this).addClass("active");
        $(this).parent().siblings().find("p").removeClass("active");
        console.log($(this).text());
    });
	
    $(".product_container").on("click",function(){
    	location.href = "${pageContext.request.contextPath }/mall/productDetail.do";
    });

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
