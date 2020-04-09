<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!-- 1:1문의 채팅 css -->


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/1on1_chat.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/user-list.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mall_delivery_info.css" />
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
				<div class="chat-with">Chat with Vincent Porter</div>
				<div class="chat-num-messages">already 1 902 messages</div>
			</div>
			<!-- <i class="fa fa-star"></i> -->
		</div>
		<!-- end chat-header -->

		<div class="chat-history">
			<ul>
				<li class="clearfix">
					<div class="message-data align-right">
						<span class="message-data-time">10:10 AM, Today</span> &nbsp;
						&nbsp; <span class="message-data-name">Olia</span> <i
							class="fa fa-circle me"></i>

					</div>
					<div class="message other-message float-right">Hi Vincent,
						how are you? How is the project coming along?</div>
				</li>

				<li>
					<div class="message-data">
						<span class="message-data-name"><i
							class="fa fa-circle online"></i> Vincent</span> <span
							class="message-data-time">10:12 AM, Today</span>
					</div>
					<div class="message my-message">Are we meeting today? Project
						has been already finished and I have results to show you.</div>
				</li>

				<li class="clearfix">
					<div class="message-data align-right">
						<span class="message-data-time">10:14 AM, Today</span> &nbsp;
						&nbsp; <span class="message-data-name">Olia</span> <i
							class="fa fa-circle me"></i>

					</div>
					<div class="message other-message float-right">Well I am not
						sure. The rest of the team is not here yet. Maybe in an hour or
						so? Have you faced any problems at the last phase of the project?
					</div>
				</li>

				<li>
					<div class="message-data">
						<span class="message-data-name"><i
							class="fa fa-circle online"></i> Vincent</span> <span
							class="message-data-time">10:20 AM, Today</span>
					</div>
					<div class="message my-message">Actually everything was fine.
						I'm very excited to show this to our team.</div>
				</li>

				<li>
					<div class="message-data">
						<span class="message-data-name"><i
							class="fa fa-circle online"></i> Vincent</span> <span
							class="message-data-time">10:31 AM, Today</span>
					</div> <i class="fa fa-circle online"></i> <i class="fa fa-circle online"
					style="color: #AED2A6"></i> <i class="fa fa-circle online"
					style="color: #DAE9DA"></i>
				</li>

			</ul>

		</div>
		<!-- end chat-history -->

		<div class="chat-message clearfix">
			<textarea name="message-to-send" id="message-to-send"
				placeholder="Type your message" rows="3"></textarea>

			<i class="fa fa-file-o"></i> &nbsp;&nbsp;&nbsp; <i
				class="fa fa-file-image-o"></i>

			<button>Send</button>

		</div>
		<!-- end chat-message -->

	</div>
	<!-- end chat -->

</div>
<!-- end container -->

<script id="message-template" type="text/x-handlebars-template">
  <li class="clearfix">
    <div class="message-data align-right">
      <span class="message-data-time" >{{time}}, Today</span> &nbsp; &nbsp;
      <span class="message-data-name" >Olia</span> <i class="fa fa-circle me"></i>
    </div>
    <div class="message other-message float-right">
      {{messageOutput}}
    </div>
  </li>
</script>

<script id="message-response-template" type="text/x-handlebars-template">
  <li>
    <div class="message-data">
      <span class="message-data-name"><i class="fa fa-circle online"></i> Vincent</span>
      <span class="message-data-time">{{time}}, Today</span>
    </div>
    <div class="message my-message">
      {{response}}
    </div>
  </li>
</script>
<!-- partial -->
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery<!-- .min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js'></scr -->ipt>

        
        

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
<script
	src="${pageContext.request.contextPath}/resources/js/directMsg.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />