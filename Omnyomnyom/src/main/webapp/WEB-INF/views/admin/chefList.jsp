<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/chef-request.css"/>

    <script>
        $(document).ready(function() {
            $(".chef-content").click(function() {
                location.href = "http://www.naver.com"
                    // location.href="http://www.naver.com/"+$(this).attr("id")
            });
        });
    </script>
    <!-- 아이디, 비밀번호, 닉네임, 이름,연락처, 이메일, 주소(선택) , 생년월일  -->
    <div class="container">
        <div class="section">
            <div class="row">
				<jsp:include page="/WEB-INF/views/common/adminSidenav.jsp">
					<jsp:param value="예약목록" name="sidanav"/>
				</jsp:include>
                <div class="col-10">
                    <h4 class="border_bottom">셰프목록</h4>
                    <br>

                    <br>

                    <div class="col-12 row">
                        <div class="col-4 row chef-content">
                            <div class="col-4">
                                <img src="1508_008.jpg" alt="" class="chef_list_img" id="셰프아이디">
                            </div>
                            <div class="col-8 che-list-p">
                                <p>51종원</p>
                                <p>51Jong@cook.com</p>
                                <p>한식, 퓨전</p>
                            </div>
                        </div>
                        <div class="col-4 row chef-content">
                            <div class="col-4">
                                <img src="1508_008.jpg" alt="" class="chef_list_img">
                            </div>
                            <div class="col-8 che-list-p">
                                <p>51종원</p>
                                <p>51Jong@cook.com</p>
                                <p>한식, 퓨전</p>
                            </div>
                        </div>
                        <div class="col-4 row chef-content">
                            <div class="col-4">
                                <img src="1508_008.jpg" alt="" class="chef_list_img">
                            </div>
                            <div class="col-8 che-list-p">
                                <p>51종원</p>
                                <p>51Jong@cook.com</p>
                                <p>한식, 퓨전</p>
                            </div>
                        </div>
                        <div class="col-4 row chef-content">
                            <div class="col-4">
                                <img src="1508_008.jpg" alt="" class="chef_list_img">
                            </div>
                            <div class="col-8 che-list-p">
                                <p>51종원</p>
                                <p>51Jong@cook.com</p>
                                <p>한식, 퓨전</p>
                            </div>
                        </div>
                        <div class="col-4 row chef-content">
                            <div class="col-4">
                                <img src="1508_008.jpg" alt="" class="chef_list_img">
                            </div>
                            <div class="col-8 che-list-p">
                                <p>51종원</p>
                                <p>51Jong@cook.com</p>
                                <p>한식, 퓨전</p>
                            </div>
                        </div>
                        <div class="col-4 row chef-content">
                            <div class="col-4">
                                <img src="1508_008.jpg" alt="" class="chef_list_img">
                            </div>
                            <div class="col-8 che-list-p">
                                <p>51종원</p>
                                <p>51Jong@cook.com</p>
                                <p>한식, 퓨전</p>
                            </div>
                        </div>

                    </div>
                    <br>

                </div>
            </div>
        </div>
    </div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
