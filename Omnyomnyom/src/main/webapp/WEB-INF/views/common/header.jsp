<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <title>${param.pageTitle}</title>
    <meta charset="UTF-8">
    <meta name="description" content="Ahana Yoga HTML Template">
    <meta name="keywords" content="yoga, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 로그인 모달창 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <!-- Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/util.css" />

    <!-- Main Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <!-- login.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />

    <!-- [if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif] -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
    <!-- 회원가입 js -->
    <script src="${pageContext.request.contextPath }/resources/js/signup.js"></script>
    
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section -->
    <header class="header-section">
        <div class="header-bottom">
            <a href="index.html" class="site-logo">
                <img src="${pageContext.request.contextPath }/resources/images/onn_logo_red.png" alt="" class="main_logo">
            </a>
            <div class="hb-right">
                <div class="hb-switch" id="search-switch">
                    <img src="${pageContext.request.contextPath }/resources/images/icons/search.png" class="logo" alt="">
                </div>
                <!-- 로그인버튼 -->
                <div class="hb-switch" id="search-switch">
                    <a href="#ex1" rel="modal:open"><img src="${pageContext.request.contextPath }/resources/images/icons/login.png" alt=""></a>
                </div>

                <!-- 로그인/회원가입 form start -->
                <div class="hb-switch" id="infor-switch">
                    <div id="ex1" class="modal">
                        <img src="" alt="" width="300px" style="margin-bottom: 30px;">
                        <div class="login_container" id="login_container">
                            <div class="form-container sign-up-container">
                                <form action="${pageContext.request.contextPath }/member/enroll" method="POST" >
                                    <h1>회원가입</h1>
                                    <!-- <div class="social-container">
                                    
                                        </div> -->
                                    <input type="text" placeholder="아이디를 입력하세요" id="memberid" name="memberId" onblur="emailValidate();" required/>
                                    <span class="error" id="errorId"></span>
                                    <input type="password" name="memberPwd" id="password_" placeholder="Password" onblur="pwValidate();" required />
                                    <span class="error" id="errorPw"></span>
                                    <input type="password" id="password_2" placeholder="Confirm Password" onblur="isEqualPwd();" required>
                                    <span class="error" id="errorPwChk"></span>
                                    <input type="email" placeholder="Email" id="email" name="email" onblur="emailValidate();" required/>
                                    <span class="error" id="errorEmail"></span>
                                    <input type="text" name="memberName" id="memberName" placeholder="Name" required>
                                    <span class="error" id="errorName"></span>
                                    <input type="text" placeholder="닉네임을 입력하세요" name="memberNick" id="nickname" maxlength="" required>
                                    <span class="error" id="errorPhone"></span>
                                    <input type="tel" placeholder="Phone Number(-없이)" name="phone" id="phone" maxlength="11" required>
                                    <span class="error" id="errorPhone"></span>
                                    <input type="number" name="ssn" id="brithday" required>
                                    <input type="address" name="address" id="address" placeholder="주소를 입력하세요" required>
                                    <span class="error" id="errorName"></span>
                                    <button type="submit" >회원가입</button>
                                </form>
                            </div>
                            <div class="form-container sign-in-container">
                                <form action="" method="get">
                                    <h1>로그인</h1>
                                    <!-- <div class="social-container">
                                        
                                        </div> -->
                                    <input type="text" placeholder="아이디를 입력하세요" name="loginId" id="loginId" />
                                    <input type="password" placeholder="Password" name="loginPassword" id="loginPassword" />
                                    <p><input type="checkbox" style="float: left; width: 20px;" name="saveId" id="saveId">
                                        <label for="saveId" style="float: left; font-size: 15px; margin-top:5px;">아이디 저장</label> </p>
                                    <!-- 아이디/비밀번호 찾기 페이지 -->
                                    <a href="">아이디/비밀번호 찾기</a>
                                    <button>옴뇸뇸 로그인</button>
                                    <div class="td-social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-linkedin"></i></a>
                                    </div>
                                </form>
                            </div>
                            <div class="overlay-container">
                                <div class="overlay">
                                    <div class="overlay-panel overlay-left">
                                        <h1>OmNyomNyom 회원가입</h1>
                                        <p></p>
                                        <button class="ghost" id="signIn">로그인</button>
                                    </div>
                                    <div class="overlay-panel overlay-right">
                                        <h1>OmNyomNyom 오서오세요</h1>
                                        <p>옴뇸뇸에 오신 것을 환영합니다.</p>
                                        <button class="ghost" id="signUp">회원가입</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 에이젝스, jsp에서 -->
                        <!-- <script>
                    //아이디 사용여부
                    $("#email").keyup(function(e){
                        let email = $(this).val().trim();
                        $.ajax({
                            url: "",
                            data: {email: email},
                            dataType : "text",
                            success: function(data){
                                //입력한 이메일이 DB에 있는지 없는지에 따른 결과를 출력한다.
                                if(data==0){
                                    $("#errorEmail").html("사용가능한 이메일입니다.");
                                }else{
                                    $("#errorEmail").html("<font color='red'>사용중인 이메일입니다.</font>");
                                }
                            },
                            error: function(){
                                alert("에러가 발생했습니다. 관리자에게 문의 하세요");
                            }
                        });
                    });
                    </script> -->



                    </div>
                </div>
                <!-- 로그인/회원가입 form end-->
            </div>
            <div class="container">
                <ul class="main-menu">
                    <li><a href="about.html" class="active">레시피</a>
                        <ul class="sub-menu">
                            <li><a href="${pageContext.request.contextPath }/recipe/recipe-menu-search.do">메뉴</a></li>
                            <li><a href="${pageContext.request.contextPath}/recipe/ingredientsSelection.do">냉장고 재료</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/mall/productList.do">뇸뇸몰</a></li>
                    <li><a href="${pageContext.request.contextPath}/chef/chefList.do">셰프</a></li>
                    <li><a href="${pageContext.request.contextPath}/oneday/oneday.do">원데이 클래스</a></li>
                    <li><a href="contact.html">사이트 안내</a>
                        <ul class="sub-menu">
                            <li><a href="classes.html">사이트 소개</a></li>
                            <li><a href="classes-details.html">공지사항</a></li>
                            <li><a href="classes-details.html">FAQ</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <!-- Header Section end -->
