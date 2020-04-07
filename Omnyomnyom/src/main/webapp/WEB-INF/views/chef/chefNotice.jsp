<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>

 <section class="page-top-section page-sp set-bg" data-setbg="">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 m-auto text-white">

                    <h2>CHEF CHANNAL</h2>
					<p>공지사항</p>
                </div>
            </div>
        </div>
    </section>
    
	 <section class="classes-details-section spad overflow-hidden">
	        <div class="container">
				<div id="board-container">
					<div class="col-lg-6 m-auto">
						<form name="boardFrm" 
							  action=""
							  method="post" 
							  onsubmit="return boardValidate();"
							  enctype="multipart/form-data">
						
							<input type="text" class="form-control" placeholder="제목" name="boardTitle" id="noticeTitle" required>
							<input type="text" class="form-control" name="boardWriter" value="${memberLoggedIn.memberId }" readonly required>
							<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
							<input type="text" class="form-control" placeholder="카테고리(ex.원데이클래스)" name="boardTitle" id="boardTitle" required>
						    <textarea class="form-control" name="boardContent" placeholder="내용" required></textarea>
							<br />
							<input type="submit" class="btn btn-outline-success" value="저장 " >
						</form>
					</div>
				</div>
			</div>
	</section>
	<script>
		function boardValidate(){
			if($("#board"))
		}
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
