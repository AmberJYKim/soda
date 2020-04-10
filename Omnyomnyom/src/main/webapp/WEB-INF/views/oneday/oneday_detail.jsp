<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
.classes-info{
 margin-top : 53px;
}
h2{
 margin-top : 20px;
 margin-bottom : 20px;
}
.class-map, .class-map p{
 margin-top : 30px;
 color: #f65d5d;
}
.site-btn{
	margin-top : 20px;
}
.mapser{
	margin-bottom: 25px;
}
.circle-select{
	display: block;
}
.onedayprice{
	font-weight: bold;
	font-size: 28px;
	line-height: 30px;
	letter-spacing: -0.5px;
	word-break: break-all;
	color: #4949E7;

}
.onedayprice{
	margin-bottom : 20px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
-webkit-appearance: none;
margin: 0;
}


</style>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/datepicker.min.css" />
    <script src="${pageContext.request.contextPath}/resources/js/datepicker.kr.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/datepicker.min.js"></script> --%>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxef268e11d2dc431a8ad959b54870e233"></script>
<script type="text/javascript">

var map, marker;
var markerArr = [];
function initTmap(){
 	// 1. 지도 띄우기
	map = new Tmapv2.Map("map_div", {
		center: new Tmapv2.LatLng(37.570028, 126.986072),
		width : "430px",
		height : "330px",
		zoom : 15,
		zoomControl : true,
		scrollwheel : true
		
	});
	
	// 2. POI 통합 검색 API 요청
	$("#btn_select").click(function(){
		
		var searchKeyword = $('#searchKeyword').val();
		$.ajax({
			method:"GET",
			url:"https://apis.openapi.sk.com/tmap/pois?version=1&format=json&callback=result",
			async:false,
			data:{
				"appKey" : "l7xxef268e11d2dc431a8ad959b54870e233",
				"searchKeyword" : searchKeyword,
				"resCoordType" : "EPSG3857",
				"reqCoordType" : "WGS84GEO",
				"count" : 10
			},
			success:function(response){
				var resultpoisData = response.searchPoiInfo.pois.poi;
				
				// 기존 마커, 팝업 제거
				if(markerArr.length > 0){
					for(var i in markerArr){
						markerArr[i].setMap(null);
					}
				}
				var innerHtml ="";	// Search Reulsts 결과값 노출 위한 변수
				var positionBounds = new Tmapv2.LatLngBounds();		//맵에 결과물 확인 하기 위한 LatLngBounds객체 생성
				
				for(var k in resultpoisData){
					
					var noorLat = Number(resultpoisData[k].noorLat);
					var noorLon = Number(resultpoisData[k].noorLon);
					var name = resultpoisData[k].name;
					
					var pointCng = new Tmapv2.Point(noorLon, noorLat);
					var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(pointCng);
					
					var lat = projectionCng._lat;
					var lon = projectionCng._lng;
					
					var markerPosition = new Tmapv2.LatLng(lat, lon);
					
					marker = new Tmapv2.Marker({
				 		position : markerPosition,
				 		//icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
				 		icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_" + k + ".png",
						iconSize : new Tmapv2.Size(24, 38),
						title : name,
						map:map
				 	});
					
					innerHtml += "<li><img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_" + k + ".png' style='vertical-align:middle;'/><span>"+name+"</span></li>";
					
					markerArr.push(marker);
					positionBounds.extend(markerPosition);	// LatLngBounds의 객체 확장
				}
				
				$("#searchResult").html(innerHtml);	//searchResult 결과값 노출
				map.panToBounds(positionBounds);	// 확장된 bounds의 중심으로 이동시키기
				map.zoomOut();
				
			},
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
}

</script>   
   
   
    <!-- Event Details Section -->
    
    <section class="event-details-section spad overflow-hidden">
        <div class="container">
        <form action="${pageContext.request.contextPath }/oneday/oneday_reservation" method="POST" >
            <div class="row">
                <div class="col-lg-7">
                    <div class="oneday_class_img">
                        <img src="img/hero-slider/main2.jpg" alt="">
                    </div>
                    <div class="sb-widget">
                        <h2 class="sb-title"></h2>
                        <div class="about-instructor-widget">
                            <img src="${pageContext.request.contextPath}/resources/upload/onedayclass/${oneday.onedayImg}" alt="클래스 사진">
                            <h6>${oneday.memberId} </h6>
                            <p>${oneday.menuList }</p>
                        </div>
                    </div>
                    <div class="event-details">
                      ${oneday.onedayContent}
                    </div>
 
                    <h3 class="comment-title">Comments</h3>
                    <ul class="comment-list">
                        <li>
                            <img src="img/classes/author/3.jpg" class="comment-pic" alt="">
                            <div class="comment-text">
                                <h3>Beverly Price </h3>
                                <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                                <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                                <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                            </div>
                            <ul class="comment-sub-list">
                                <li>
                                    <img src="img/classes/author/2.jpg" class="comment-pic" alt="">
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
                            <img src="img/classes/author/1.jpg" class="comment-pic" alt="">
                            <div class="comment-text">
                                <h3>Lori Gonzales</h3>
                                <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                                <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                                <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                            </div>
                        </li>
                    </ul>
                    
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
                <!-- 사이드부분 -->
                <div class="col-lg-5 col-md-5 col-sm-8 sidebar">
                    <div class="sb-widget">
                        <div class="classes-info">
                            <h2>${oneday.onedayName }</h2>
                            <p>${oneday.memberId }</p>
                            <!-- 예약할 시 필요한 no -->
                            <input type="number" name="onedayclassNo" style="display: none" value="${oneday.onedayclassNo}"/>
                            <h4 id="price" class="onedayprice"><fmt:formatNumber value="${oneday.onedayPrice }" pattern="#,###"/></h4>
                            <ul>
                                <li><i class="material-icons">alarm_on</i>클래스 소요시간 : ${oneday.onedayTime}시간</li>
                                <li><i class="material-icons">people_outline</i>최대인원 : ${oneday.onedayMaxper}명</li>
                                <li><i class="material-icons">person_outline</i>최소인원 : ${oneday.onedayMinper}명</li>
                            </ul>
                            <h2>클래스 날짜</h2>
                        	<div class="col-md-3">
                        	
                        		<div class="row">
                        		<c:forEach items="${list}" var="time">
                        		<input type="number" name="onedayTimeNo" style="display: none" value="${time.onedayTimeNo}"/>
                        		</c:forEach>
                        		
			                    	<select class="circle-select" id="regDate" name="regDate">
			                    	<c:forEach items="${list}" var="time">
			                            <option value="${time.onedayTimeDate}">${time.onedayTimeDate}</option>			                    		
			                        </c:forEach>
			                        </select>
		                		</div>
							</div>

								
                            <h2>인원 선택</h2>
                           	<div class="input-group">
                                               
	                            <div class="option ">
									<span class="count"><button type="button" class="btn down" id="countdown">-</button> 
									<input type="number" class="inp" id="count" name="personnel" value="1" min="1"> 
									<button type="button" class="btn up" id="countup">+</button></span>
								</div>
                            </div>
                                           
                            <p class="onedayprice"><span id="total_price" class="onedayprice"><fmt:formatNumber value="${oneday.onedayPrice }" pattern="#,###"/></span>원</p>
                           	
                           	<input type="number" id="input_price" name="resPrice" style="display: none;" value="${oneday.onedayPrice }"/>
      	
                           	<script>
      							$(document).on('click','#countup, #countdown', function(){
      								
      								let tPrice = $('#total_price').text();
      								
      								console.log(tPrice);
      								
      								let sPrice = tPrice.split(',').join('');
      								sPrice =Number(sPrice);
      								console.log(sPrice);
      								$('#input_price').attr("value",sPrice); 
      								
      							});                  		
                           		
                           	</script>
                           	
                            <input class="site-btn sb-gradient reservation_class" type="submit" value="신청하기"/>
                        	
                        </div>
                    </div>
                    <div class="sb-widget">
                        <div class="class-map">
                            <h3>클래스 위치</h3>
                            <p><i class="material-icons">map</i>${oneday.addr}${oneday.detailedAddr }</p>
                            <!-- 지도 api -->
                           <body onload="initTmap();">
								<div class="mapser">
									<input type="text" class="text_custom form-control" id="searchKeyword" name="searchKeyword" value="${oneday.addr}${oneday.detailedAddr }">	
									<input id="btn_select" class="site-btn sb-gradient reservation_class" value="위치 검색">
								</div>
								<div>
									
									<div id="map_div" class="map_wrap" style="float:left"></div>
								</div>
							</body>
                        </div>
                    </div>
                </div>
            </div>
          </form>
        </div>
    </section>
    <!-- Event Details Section end -->
     <script>
     
    function countChange(b){
        $count = $("#count");
        let cnum = Number($count.val())+Number(b);
        if(cnum<=0){
            $count.text(1);
            cnum = 1;
            console.log(1);
        }
        $count.val(cnum);
        let price = $("#price").text()
        price = price.replace(/\,/g,"");
        let ppap = Number(price)*cnum;
        $("#total_price").text(String(ppap).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
/*          $("#total_price").text(Number(price)*cnum); */

    }
    
    $("#countup").on("click",function(){
        countChange(1);
    });
    $("#countdown").on("click",function(){
        countChange(-1);
    });
    $("#count").on("keyup",function(){
        countChange(0);
    });
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
