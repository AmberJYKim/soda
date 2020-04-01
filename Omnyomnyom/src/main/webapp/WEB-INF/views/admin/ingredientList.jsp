<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
	<link rel="stylesheet" href="css/user-list.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/chef-list.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage/mall-manager.css" />


    <!-- 아이디, 비밀번호, 닉네임, 이름,연락처, 이메일, 주소(선택) , 생년월일  -->
    <div class="container">
        <div class="section">
            <div class="row">
				<jsp:include page="/WEB-INF/views/common/adminSidenav.jsp">
					<jsp:param value="예약목록" name="sidanav"/>
				</jsp:include>
                <div class="col-10">
                    <h4 class="border_bottom">재고관리</h4>
                    <br>

                    <div class="row">
                        <div class="col-12">
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
                    </div>
                    <div class="col-12 float-right">
                        <button type="button" class="btn btn-outline-danger">초기화</button>
                        <button type="button" class="btn btn-outline-success" id="mall-update">변경하기</button>
                    </div>
                    <br>

                    <div class="col-12 row">
                        <div class="col-1">&nbsp;</div>
                        <div class="col-2 count-menu-bar"></div>
                        <div class="col-3 count-menu-bar">상품 이름</div>
                        <div class="col-2 count-menu-bar text-ag">판매 단위</div>
                        <div class="col-2 count-menu-bar text-ag">가격</div>
                        <div class="col-2 count-menu-bar">재고</div>
                    </div>
                    <div class="col-12 sel_img row" value="나중에 판매상품 ID">

                        <div class="col-1">
                            <input type="checkbox" name="check_btn">
                        </div>
                        <div class="col-2 margin-bottong">
                            <img src="프로젝트용 소스/육류/기타/계란 노른자.jfif" alt="">
                        </div>
                        <div class="col-3 inner-col">도른자</div>
                        <div class="col-2 inner-col">200g</div>
                        <div class="col-2 inner-col">
                            <input type="number" name="price" class="form-control input-number" value="2900" step="10">
                        </div>
                        <div class="col-2 inner-col">
                            <input type="number" name="count" class="form-control input-number" value="123123">
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <style>
            .float-right * {
                float: right;
            }
            
            .agree {
                margin: auto;
                border-radius: 10px;
                border: 1px solid indianred;
                background-color: indianred;
                color: white;
                padding-top: 10px;
                padding-bottom: 10px;
                font-weight: 600;
                font-size: 14px;
            }
            
            .count-menu-bar {
                font-size: 14px;
                font-weight: 600;
            }
            
            .input_num {
                border: 1px solid black;
                border-collapse: collapse;
            }
            
            .input_num input {
                width: 60px;
            }
            
            .p-m-icon>input {
                width: 35px;
            }
            
            .inner-col {
                padding: 30px 5px;
            }
            
            .margin-bottong {
                margin-bottom: 10px;
            }
            
            .sel_img {
                font-size: 14px;
                font-weight: 600;
            }
            
            .p-m-icon img {
                width: 20px;
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
            $(".sel_img").on("click", function(e) {
                let $chk = $(this).find("[type=checkbox]")
                $chk.attr("checked", !$chk.attr("checked"));
            });
            $(".catch-click-event").find("p").on("click", function() {
                $(this).addClass("active");
                $(this).parent().siblings().find("p").removeClass("active");
            });
        </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
