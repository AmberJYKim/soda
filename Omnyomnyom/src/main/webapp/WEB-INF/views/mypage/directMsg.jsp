<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!-- 1:1문의 채팅 css -->


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="1:1 문의" name="pageTitle" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/1on1_chat.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/user-list.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mall_delivery_info.css" />
	
<!-- WebSocket:sock.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>

<!-- WebSocket: stomp.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>

<!-- Event Details Section -
<section class="event-details-section spad overflow-hidden">
	<div class="tm-section-2">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<h2 class="tm-section-title">1:1문의사항</h2>
					<p class="tm-color-white tm-section-subtitle">불편하신 사항에 대해 글을
						남겨주시면 답변을 남겨드리겠습니다</p>
				</div>
			</div>
		</div>
	</div>



	<div class="tm-section tm-position-relative">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"
			preserveAspectRatio="none" class="tm-section-down-arrow">
                    <polygon fill="#4949e7" points="0,0  100,0  50,60"></polygon>
                </svg>
	</div>
</section>
<!-- Event Details Section end -->

<div class="col side_nav">
					<p class="nav_text ">내 정보보기</p>
					<p class="nav_text selected_nav	">스크랩목록</p>
					<p class="nav_text ">예약목록</p>
					<p class="nav_text ">구매목록</p>
					<p class="nav_text">셰프 문의</p>
					<p class="nav_text">1:1 문의</p>		
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
				<div class="chat-num-messages">already 1 902 messages</div>
			</div>
			<!-- <i class="fa fa-star"></i> -->
		</div>
		<!-- end chat-header -->

		<div class="chat-history">
			<ul id="msg-target">
				<li class="clearfix">
					<div class="message-data align-right">
						<span class="message-data-time">시간</span> &nbsp;
						&nbsp; <span class="message-data-name">나</span> <i
							class="fa fa-circle me"></i>

					</div>
					<div class="message other-message float-right">메세지 1</div>
				</li>

				<li>
					<div class="message-data">
						<span class="message-data-name"><i
							class="fa fa-circle online"></i> 상대방</span> <span
							class="message-data-time">시간</span>
					</div>
					<div class="message my-message">내용 1</div>
				</li>

				<li class="clearfix">
					<div class="message-data align-right">
						<span class="message-data-time">시간</span> &nbsp;
						&nbsp; <span class="message-data-name">나</span> <i
							class="fa fa-circle me"></i>

					</div>
					<div class="message other-message float-right">메세지 2
					</div>
				</li>

				<li>
					<div class="message-data">
						<span class="message-data-name"><i
							class="fa fa-circle online"></i> 상대방</span> <span
							class="message-data-time">시간</span>
					</div>
					<div class="message my-message">내용 2</div>
				</li>

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

<!-- 1대1 문의 채팅 js -->
<script src="${pageContext.request.contextPath}/resources/js/directMsg.js"></script>

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
	let connectionDone = false;
	let intervalId = setInterval(()=>{
		if(connectionDone == true)
			clearInterval(intervalId);
		
		if(connectionDone==false && chatClient.connected){
			
			//stomp에서는 구독개념으로 세션을 관리한다. 핸들러 메소드의 @SendTo어노테이션과 상응한다.
			chatClient.subscribe('/chat/'+chatId, function(message) {
				console.log("receive from subscribe /chat/"+chatId+":", message);
				let messsageBody = JSON.parse(message.body);
				console.log(messsageBody.msg);
				$("#data").append("<li class=\"list-group-item\">"+messsageBody.memberId+" : "+messsageBody.msg+ "</li>");
				scrollTop();
			});
			connectionDone = true;
		}	
	},1000);
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />