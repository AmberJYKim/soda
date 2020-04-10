<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="셰프신청목록" name="pageTitle"/>
</jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/chef-request.css"/>
<!-- 아이디, 비밀번호, 닉네임, 이름,연락처, 이메일, 주소(선택) , 생년월일  -->
	<div class="container">
		<div class="section">
			<div class="row">
				<jsp:include page="/WEB-INF/views/common/adminSidenav.jsp">
					<jsp:param value="셰프신청목록" name="sidenav"/>
				</jsp:include>
				<div class="col-10">
					<h4 class="border_bottom">셰프신청목록</h4>
					<br>
<!-----------------------------------------출력 구간---------------------------------------------------------------->
					<c:if test="${chefRequestList != null}" >
					<c:forEach items="${chefRequestList}" var="chefRequest">
						<div class="col-12 row" id="${chefRequest.chefId}">
							<div class="col-2">
								<!-- <img src="1508_008.jpg" alt="" class="chef_list_img"> -->
 								<img src="${pageContext.request.contextPath}/resources/images/upload/profile/${chefRequest.chefProfile}" alt="${chefRequest.chefId}" class="chef_list_img">
							</div>
							<div class="col-4">
								<p>닉네임 : ${chefRequest.chefNickName}</p>
								<p>아이디 : ${chefRequest.chefId}</p> 
								<%-- <p>이메일 : ${chefRequest.email }</p> --%>
							</div>
	
							<div class="col-4">
								<%-- <p>연락처 : ${chefRequest.email }</p> --%>
								<p>대표 장르 : <jstr>${chefRequest.menuPrCategory}</jstr></p>
								<p>대표 채널/영상 : <a href="${chefRequest.chefApVideo }">링크</a> </p>
							</div>
							<c:choose>
								<c:when test="${chefRequest.chefReqOk eq 'W'}">
									<div class="col chef_list_chek_btn ">
										<img src="${pageContext.request.contextPath }/resources/images/icons/chek.png" alt="" class="ac_ok_btn">
									</div>
									<div class="col chef_list_chek_btn ">
										<!-- &nbsp;&nbsp;&nbsp;&nbsp; -->
										<img src="${pageContext.request.contextPath }/resources/images/icons/cc.png" alt="" class="ac_no_btn">
									</div>
								</c:when>
								<c:when test="${chefRequest.chefReqOk eq 'Y'}">
									<div class="col chef_list_chek_btn ">
										<img src="${pageContext.request.contextPath }/resources/images/icons/chek.png" alt="" class="ac_btn">
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-1 chef_list_chek_btn ">
										<img src="${pageContext.request.contextPath }/resources/images/icons/cc.png" alt="" class="ac_btn">
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
					${paging }
					</c:if>
<!-----------------------------------------출력 구간---------------------------------------------------------------->
					<script>
					$(function(){
			            $("jstr").each(function(index,jstr){
			            	$(this).html($(this).html().replace(/\{|\}|\[|\]|\"|:|value/g,""));
			            });
			            
						$(".ac_ok_btn").on("click",function(){
							$("#variable").val("Y");
							$("#chefId").val($(this).parent().parent().attr('id'));
							$("#request_put").submit();
						});
						
						$(".ac_no_btn").on("click",function(){
							$("#variable").val("N");
							$("#chefId").val($(this).parent().parent().attr('id'));
							$("#request_put").submit();
						});
					});
					</script>

				</div>
			</div>
		</div>
	</div>
	<form style="display: none" action="${pageContext.request.contextPath }/admin/chefRequest" method="POST" id="request_put">
	  <input type="hidden" id="chefId" name="chefId" value=""/>
	  <input type="hidden" id="variable" name="variable" value=""/>
	</form>
	



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
