<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="1:1 문의" name="pageTitle" />
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/1on1_chat.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/chef-list.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mall_delivery_info.css" />
	

<!-- WebSocket:sock.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>

<!-- WebSocket: stomp.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>

<script>
const memberId = '${memberLoggedIn.memberId}';
   
//웹소켓 선언 및 연결
//1.최초 웹소켓 생성 url: /onn
let socket = new SockJS('<c:url value="/chat" />');
/* let socket = new SockJS('/onn/chat'); */
let chatClient = Stomp.over(socket);

let sessionId;
chatClient.connect({}, function(frame) {
	console.log('connected stomp over sockjs');
	console.log(frame);

	//(미사용)websocket sessionId 값 추출하기
	let url = chatClient.ws._transport.url;
	url = url.replace("ws://"+location.host+"/${pageContext.request.contextPath}/chat/","");
	url = url.replace(/^\d+\//,"");
	url = url.replace("/websocket","");
	sessionId = url;

	//2. stomp에서는 구독개념으로 세션을 관리한다. 핸들러 메소드의 @SendTo어노테이션과 상응한다.
	//전체공지
	chatClient.subscribe('/notice', function(message) {
		console.log("receive from subscribe /notice :", message);

		//notice 뱃지 보임 처리
		$("#noticeLink").fadeIn(500);
		//전역변수 notice에 보관
		notice = JSON.parse(message.body);
	});


	//3. 개인공지 구독신청
	chatClient.subscribe('/notice/'+memberId, function(message) {
		console.log("receive from subscribe /notice/"+memberId+" :", message);

		//notice 뱃지 보임 처리
		$("#noticeLink").fadeIn(500);
		//전역변수 notice에 보관
		notice = JSON.parse(message.body);
	});

});
</script>
<div class="container">
	<div class="section">
		<div class="row">

			<div class="col-2 side_nav">
				<a href="${pageContext.request.contextPath}/mypage/main"><p class="nav_text ">내 정보보기</p></a>
				<a href="${pageContext.request.contextPath}/mypage/onedayList"><p class="nav_text ">예약목록</p></a>
				<a href="${pageContext.request.contextPath}/mypage/buyList"><p class="nav_text ">구매목록</p></a>
				<a href="${pageContext.request.contextPath}/mypage/qnaMsg"><p class="nav_text selected_nav">1:1 문의</p></a>
				<a href="${pageContext.request.contextPath}/mypage/scrapList"><p class="nav_text">스크랩 목록</p></a>
				<a href="${pageContext.request.contextPath}/chef/chefInsert"><p class="nav_text">셰프신청</p></a>
				<a href="${pageContext.request.contextPath}/mypage/dingdongList"><p class="nav_text">알림목록</p></a>
			</div>
			<div class="col-2 side_nav">
				<c:forEach items="${recentList }" var="msg">
				<div class="chat_thumbnail_box">
					<a href="${pageContext.request.contextPath}/chat/msg/${msg.memberId}"><p>
					<c:choose>
						<c:when test='${msg.memberId eq "sdmin" }'>
							<img src="${pageContext.request.contextPath}/resources/upload/profile/sdmin.jpg" alt="" class="chat_thumbnail" />
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/upload/profile/${msg.prevImg}" alt="" class="chat_thumbnail"/>
						</c:otherwise>
					</c:choose>
					<br />	
					${msg.memberNick }
					</p></a>
				</div>
				</c:forEach>				
			</div>
				

		<!-- 1:1문의 채팅 start -->
		<!-- partial:index.partial.html -->
		<div class="chat_container clearfix">
		
		
			<div class="chat">
				<div class="chat-header clearfix">
					<img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_01_green.jpg"
						alt="avatar" />
		
					<div class="chat-about">
						<div class="chat-with">상대방 닉네임</div>
						<div class="chat-num-messages" ><span id="msg-count">${fn:length(chatList)}</span> Message</div>
					</div>
					<!-- <i class="fa fa-star"></i> -->
				</div>
				<!-- end chat-header -->
		
				<div class="chat-history">
					<ul id="msg-target">
						<c:forEach items="${chatList }" var="chat" >
							<c:if test="${chat.memberId eq memberLoggedIn.memberId }">
								<li class="clearfix">
									<div class="message-data align-right">
										<span class="message-data-name"></span>
										<i 	class="fa fa-circle me"></i>
										&nbsp;
										&nbsp;  
										<span class="message-data-time">${chat.time }</span> 
				
									</div>
									<div class="message other-message float-right">${chat.msg }</div>
								</li>
							
							</c:if>				
							<c:if test="${chat.memberId ne memberLoggedIn.memberId }">
								<li>
									<div class="message-data">
										<span class="message-data-name"><i
											class="fa fa-circle online"></i> ${chat.memberId }</span> <span
											class="message-data-time">${chat.time }</span>
									</div>
									<div class="message my-message">${chat.msg }</div>
								</li>
							
							</c:if>				
						
						</c:forEach>
		
		
		
					</ul>
		
				</div>
				<!-- end chat-history -->
		
				<div class="chat-message clearfix">
					<textarea name="message-to-send" id="message-to-send" placeholder="Type your message" rows="3"></textarea>
		
					<i class="fa fa-file-o"></i> &nbsp;&nbsp;&nbsp; <i
						class="fa fa-file-image-o"></i>
		
					<button id="sendBtn">Send</button>
		
				</div>
				<!-- end chat-message -->
		
			</div>
			<!-- end chat -->
		
		</div>
	</div>
	</div>

</div>		
<!-- end container -->
<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js'></script>


        
        

        <!-- <div class="credits"><a href="https://codepen.io/clintioo/pen/HAkjq">Original Pen</a> by <a href="https://codepen.io/clintioo/pen/HAkjq">clintioo</a></div> -->
    <!-- 1:1문의 채팅 end -->



    <script src="${pageContext.request.contextPath}/resources/js/datepicker.min.js"></script>
<!-- Include English language -->
<script
	src="${pageContext.request.contextPath}/resources/js/datepicker.kr.js"></script>
<script>
	(function() {
		// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
		if (!String.prototype.trim) {
			(function() {
				// Make sure we trim BOM and NBSP
				var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
				String.prototype.trim = function() {
					return this.replace(rtrim, '');
				};
			})();
		}
		[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
			// in case the input is already filled..
			if( inputEl.value.trim() !== '' ) {
				classie.add( inputEl.parentNode, 'input--filled' );
			}
			// events:
			inputEl.addEventListener( 'focus', onInputFocus );
			inputEl.addEventListener( 'blur', onInputBlur );
		} );
		function onInputFocus( ev ) {
			classie.add( ev.target.parentNode, 'input--filled' );
		}
		function onInputBlur( ev ) {
			if( ev.target.value.trim() === '' ) {
				classie.remove( ev.target.parentNode, 'input--filled' );
			}
		}
	})();

</script>


<!-- 사용자 chat관련 script -->
<script src="${pageContext.request.contextPath }/resources/js/chat.js"></script>


<script>

const chatId = '${chatId}';

/**
 * 각 페이지에서 작성하면, chat.js의 onload함수에서 호출함.
* chat페이지에서 추가적으로 subscripe 한다.
* 웹소켓 connection이 맺어지기 전 요청을 방지하기 위해 stompClient.connected를 체크한다.
* connectionDone 으로 구독요청 완료를 체크해서 1초마다 반복적으로 구독요청한다.
*/
function chatSubscribe(){
	//페이지별로 구독신청 처리
	let iii = 1;
	let connectionDone = false;
	console.log(iii%2);
	let intervalId = setInterval(()=>{
		if(connectionDone == true)
			clearInterval(intervalId);
		
		if(connectionDone==false && chatClient.connected){
			
			//stomp에서는 구독개념으로 세션을 관리한다. 핸들러 메소드의 @SendTo어노테이션과 상응한다.
			chatClient.subscribe('/chat/'+chatId, function(message) {

				console.log("receive from subscribe /chat/"+chatId+":", message);
				let messsageBody = JSON.parse(message.body);
				
				console.log('--------------------');
				console.log(messsageBody);
				console.log('--------------------');
				if(iii%2 != 0){
				if(memberId == messsageBody.memberId){
				    $("#msg-target").append(''
						+'<li class="clearfix">'
						+'<div class="message-data align-right">'
						+'<span class="message-data-time">'+dateTransform(messsageBody.time)+'</span>'
						+'</div> <div class="message other-message float-right">'+messsageBody.msg+'</div>'
						+'</li>'); 
				}else{
				    $("#msg-target").append(''
						+'<li>'
						+'<div class="message-data">'
						+'<span class="message-data-name"><i class="fa fa-circle online"></i>'+messsageBody.memberId+'</span>'
						+'<span class="message-data-time">'+dateTransform(messsageBody.time)+'</span>'
						+'</div> <div class="message my-message">'+messsageBody.msg+'</div>'
						+'</li>'); 
					
				}
				scrollTop();
				$("#msg-count").text(Number($("#msg-count").text())+1);
				}
				iii++;
			});
			connectionDone = true;
			
		}	
		
		
	},1000);
	
}
function dateTransform(time){
	
	var now = new Date(Number(time));
	var hour = now.getHours();
	
	return now.getMonth() + 1 + "월 "+ now.getDate()+"일("+['일','월','화','수','목','금','토','일'][now.getDay()]+") " + (hour>=12?"오후 ":"오전 ") + hour%12+"시 "+now.getMinutes()+"분";
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />