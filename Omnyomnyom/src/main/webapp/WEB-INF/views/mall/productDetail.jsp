<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mall_common.css" />
 <!--  Section start -->
    <section class="classes-details-section spad overflow-hidden">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="recipe-details">
                        <div class="section_view">

                            <div id="sectionView">
                                <div class="inner_view">
                                    <div class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/158519696333y0.jpg&quot;);"><img src="https://res.kurly.com/mobile/service/goodsview/1910/bg_375x482.png" alt="상품 대표 이미지" class="bg"></div>
                                    <p class="goods_name"><span class="btn_share"></span> <strong class="name">[다향오리] 덕팸</strong></p>
                                    <p class="goods_price">
                                        <span class="position">
                                            <span class="dc">
                                                    <span class="dc_price">3,400
                                                    <span class="won">원</span>
                                        </span>
                                        </span>
                                        </span>


                                    </p>
                                    <div class="goods_info">
                                        <dl class="list"><dt class="tit">판매단위/중량/용량</dt>
                                            <dd class="desc">1캔/200g</dd>
                                        </dl>
                                        <dl class="list"><dt class="tit">배송구분</dt>
                                            <dd class="desc">채성택배</dd>
                                        </dl>
                                        <dl class="list"><dt class="tit">원산지</dt>
                                            <dd class="desc">국산</dd>
                                        </dl>
                                        <dl class="list"><dt class="tit">유통기한</dt>
                                            <dd class="desc">1일</dd>
                                        </dl>
                                        <dl class="list"><dt class="tit">포장타입</dt>
                                            <dd class="desc"> 상온/종이포장
                                                <strong class="emph">택배배송은 에코포장이 스티로폼으로 대체됩니다.</strong>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>

                            <div id="cartPut">
                                <div class="cart_option cart_type2">
                                    <div class="inner_option">
                                        <strong class="tit_cart">[다향오리] 덕팸</strong>
                                        <div class="in_option">
                                            <div class="list_goods">

                                                <ul class="list list_nopackage">
                                                    <li class="on"><span class="btn_position"><button type="button" class="btn_del"><span class="txt">삭제하기</span></button>
                                                        </span> <span class="name">[다향오리] 덕팸</span> <span class="tit_item">구매수량</span>
                                                        <div class="option">
                                                            <span class="count"><button type="button" class="btn down">수량내리기</button> <input type="number" readonly="readonly" onfocus="this.blur()" class="inp"> <button type="button" class="btn up">수량올리기</button></span>
                                                            <span class="price"><span class="dc_price">3,400원</span>

                                                            </span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="total">
                                                <div class="price">
                                                    <strong class="tit">총 상품금액 :</strong>

                                                    <span class="sum">
                                                         <span class="num">3,400</span>
                                                    <span class="won">원</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="group_btn off">

                                            <div class="view_function">
                                                <button type="button" class="btn btn_save">구매하기</button>
                                                <button type="button" class="btn btn_alarm off">1:1문의</button>
                                            </div>
                                            <span class="btn_type1">
                                                <input type="button" class="txt_type" value="장바구니 담기" onclick="shoppingBasket();">
                                            </span>
                                        </div>

                                    </div>
                                </div>
                                <form name="frmBuyNow" method="post" action="/shop/order/order.php"><input type="hidden" name="mode" value="addItem"> <input type="hidden" name="goodsno" value=""></form>
                                <form name="frmWishlist" method="post"></form>
                            </div>
                        </div>
                    </div>

                    <div clss="row">
                        <hr style="margin:auto; position: relative; left:25%;">
                        <h3 class="product_title">상품상세</h3>
                        <p class="product_sub_title">자세한 정보를 확인해 주세요.</p>
                        <hr style="margin:auto; position: relative; left:25%;">
                        <div class="col-lg-12 m-auto">
                            <img src="/img/mall_detail.jpg" class="mall_detail_img">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--  Section end -->
    <script>
    function shoppingBasket(){
    	location.href="${pageContext.request.contextPath }/mall/shoppingBasket.do"
    }
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
