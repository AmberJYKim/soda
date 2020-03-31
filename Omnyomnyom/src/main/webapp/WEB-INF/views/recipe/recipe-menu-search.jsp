<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩설정 안해주면 한글 깨짐  -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
    <!-- Main Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe-search(Menu).css">
    
        <style>
    .mid-select{
        margin-left: 27px;
        padding-bottom: 50px;
        padding-top: 15px;
    }
    .select li{
        margin-right: 70px;
    
    }
    </style>
    
    
            <!-- --------------------------------------------------------------------------------------------------------- -->
        <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
    
        <section class="page-top-section page-sp set-bg" data-setbg="img/page-top-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 m-auto text-white">
                        <h2>레시피 검색</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
        </section>
         <!-- Page top Section end -->
    <div class="container">
        <div class="event-filter-warp">
            <div class="row">
                <div class="col-xl-2">
                    <p>메뉴로 검색</p>
                </div>
                <div class="col-xl-10">
                    <form class="event-filter-form">
                        <div class="ef-item">
                            <i class="material-icons">search</i>
                            <input type="text" placeholder="">
                        </div>
                        <button class="site-btn sb-gradient">메뉴 검색</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <section class="classes-details-section spad overflow-hidden">
        <div class="container">
            <!--  셰프채널 navbar -->
            <div class="row">
                <div class="col-lg-12">
                    <ul class="nav nav-pills nav-fill">
                        <li class="nav-item">
                            <a class="nav-link" id="home-tab" data-toggle="tab" href="#kor" role="tab" aria-controls="home" aria-selected="ture">한식</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#cn" role="tab" aria-controls="profile" aria-selected="false">중식</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#jp" role="tab" aria-controls="profile" aria-selected="false">일식</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#us" role="tab" aria-controls="profile" aria-selected="false">양식</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#instant" role="tab" aria-controls="contact" aria-selected="false">즉석식</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#flour" role="tab" aria-controls="contact" aria-selected="false">밀식</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#health" role="tab" aria-controls="contact" aria-selected="false">건강식</a>
                        </li>
                    </ul>
                </div>
            </div>
                <!-- 대분류 , 중분류 탭 -->
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="kor" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row classes-details-section spad overflow-hidden mid-select">
                            <div class="col-lg-12">
                                <ul class="nav nav-pills nav-fill select">
                                    <li class="nav-item">
                                        <a class="nav-link" id="home-tab" data-toggle="tab" href="#kor-1" role="tab" aria-controls="home" aria-selected="ture">국물요리</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#kor-2" role="tab" aria-controls="profile" aria-selected="false">반찬</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#kor-3" role="tab" aria-controls="profile" aria-selected="false">잔치요리</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#kor-4" role="tab" aria-controls="profile" aria-selected="false">죽</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#kor-5" role="tab" aria-controls="contact" aria-selected="false">찜</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#kor-6" role="tab" aria-controls="contact" aria-selected="false">조림</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#kor-7" role="tab" aria-controls="contact" aria-selected="false">면</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#kor-8" role="tab" aria-controls="contact" aria-selected="false">분식</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                  
                    <!-- 동영상 탭 클릭시 나오는 모든 영상 (업로드 순) -->
                    <div class="tab-pane fade" id="cn" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="row classes-details-section spad overflow-hidden mid-select">
                            <div class="col-lg-12">
                                <ul class="nav nav-pills nav-fill select">
                                    <li class="nav-item">
                                        <a class="nav-link" id="home-tab" data-toggle="tab" href="#cn-1" role="tab" aria-controls="home" aria-selected="ture">볶음요리</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#cn-2" role="tab" aria-controls="profile" aria-selected="false">탕요리</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#cn-3" role="tab" aria-controls="profile" aria-selected="false">면요리</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#cn-4" role="tab" aria-controls="profile" aria-selected="false">튀김</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#cn-5" role="tab" aria-controls="contact" aria-selected="false">밥</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#cn-6" role="tab" aria-controls="contact" aria-selected="false">찜</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#cn-7" role="tab" aria-controls="contact" aria-selected="false">준비중</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 공지사항 탭을 누르면 나오는 게시판목록 -->
                    <div class="tab-pane fade" id="jp" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="row classes-details-section spad overflow-hidden mid-select">
                            <div class="col-lg-12">
                                <ul class="nav nav-pills nav-fill select">
                                    <li class="nav-item">
                                        <a class="nav-link" id="home-tab" data-toggle="tab" href="#jp-1" role="tab" aria-controls="home" aria-selected="ture">회/사시미</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#jp-2" role="tab" aria-controls="profile" aria-selected="false">볶음(야끼)</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#jp-3" role="tab" aria-controls="profile" aria-selected="false">면요리</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#jp-4" role="tab" aria-controls="profile" aria-selected="false">튀김요리</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#jp-5" role="tab" aria-controls="contact" aria-selected="false">초밥</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#jp-6" role="tab" aria-controls="contact" aria-selected="false">절임류</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#jp-7" role="tab" aria-controls="contact" aria-selected="false">조림</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                <div class="tab-pane fade" id="us" role="tabpanel" aria-labelledby="contact-tab">
                    <div class="row classes-details-section spad overflow-hidden mid-select">
                        <div class="col-lg-12">
                            <ul class="nav nav-pills nav-fill select">
                                <li class="nav-item">
                                    <a class="nav-link" id="home-tab" data-toggle="tab" href="#us-1" role="tab" aria-controls="home" aria-selected="ture">고기</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#us-2" role="tab" aria-controls="profile" aria-selected="false">샐러드</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#us-3" role="tab" aria-controls="profile" aria-selected="false">파스타</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#us-4" role="tab" aria-controls="profile" aria-selected="false">피자</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#us-5" role="tab" aria-controls="contact" aria-selected="false">햄버거</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#us-6" role="tab" aria-controls="contact" aria-selected="false">절임류</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#us-7" role="tab" aria-controls="contact" aria-selected="false">리조또</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="instant" role="tabpanel" aria-labelledby="contact-tab">
                    <div class="row classes-details-section spad overflow-hidden mid-select">
                        <div class="col-lg-12">
                            <ul class="nav nav-pills nav-fill select">
                                <li class="nav-item">
                                    <a class="nav-link" id="home-tab" data-toggle="tab" href="#instant-1" role="tab" aria-controls="home" aria-selected="ture"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#instant-2" role="tab" aria-controls="profile" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#instant-3" role="tab" aria-controls="profile" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#instant-4" role="tab" aria-controls="profile" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#instant-5" role="tab" aria-controls="contact" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#instant-6" role="tab" aria-controls="contact" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#instant-7" role="tab" aria-controls="contact" aria-selected="false"></a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>

                <div class="tab-pane fade" id="flour" role="tabpanel" aria-labelledby="contact-tab">
                    <div class="row classes-details-section spad overflow-hidden mid-select">
                        <div class="col-lg-12">
                            <ul class="nav nav-pills nav-fill select">
                                <li class="nav-item">
                                    <a class="nav-link" id="home-tab" data-toggle="tab" href="#flour-1" role="tab" aria-controls="home" aria-selected="ture">빵</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#flour-2" role="tab" aria-controls="profile" aria-selected="false">쿠키</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#flour-3" role="tab" aria-controls="profile" aria-selected="false">케익</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#flour-4" role="tab" aria-controls="profile" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#flour-5" role="tab" aria-controls="contact" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#flour-6" role="tab" aria-controls="contact" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#flour-7" role="tab" aria-controls="contact" aria-selected="false"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="health" role="tabpanel" aria-labelledby="contact-tab">
                    <div class="row classes-details-section spad overflow-hidden mid-select">
                        <div class="col-lg-12">
                            <ul class="nav nav-pills nav-fill select">
                                <li class="nav-item">
                                    <a class="nav-link" id="home-tab" data-toggle="tab" href="#health-1" role="tab" aria-controls="home" aria-selected="ture">비건</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#health-2" role="tab" aria-controls="profile" aria-selected="false">다이어트 식</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#health-3" role="tab" aria-controls="profile" aria-selected="false">채식</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#health-4" role="tab" aria-controls="profile" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#health-5" role="tab" aria-controls="contact" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#health-6" role="tab" aria-controls="contact" aria-selected="false"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#health-7" role="tab" aria-controls="contact" aria-selected="false"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>       
            </div>
            <!-- <div class="tab-pane fade" id="#" role="tabpanel" aria-labelledby="profile-tab">
                
            </div> -->

            <!-- 한식 > kor-1셀렉하면 나오는 뷰  id값이 결정-->
            <div class="tab-pane fade" id="kor-1" role="tabpanel" aria-labelledby="profile-tab">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div> 
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                        <div class="col-lg-3 upload-video">
                            <img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                            <h6>백종원의 불맛나는 짬뽕은 어떻게 만드는 것일까??</h6>
                            <p>조회수 : 16.5만회</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 한식 > 셀렉하면 나오는 뷰  id값이 결정-->
            <div class="tab-pane fade" id="kor-2" role="tabpanel" aria-labelledby="profile-tab">
                1 반찬
            </div>
            <div class="tab-pane fade" id="kor-3" role="tabpanel" aria-labelledby="profile-tab">
                2 잔치요리
            </div>
            <div class="tab-pane fade" id="kor-4" role="tabpanel" aria-labelledby="profile-tab">
                3 죽
            </div>
            <div class="tab-pane fade" id="kor-5" role="tabpanel" aria-labelledby="profile-tab">
                4 찜
            </div>
            <div class="tab-pane fade" id="kor-6" role="tabpanel" aria-labelledby="profile-tab">
                5 조림
            </div>
            <div class="tab-pane fade" id="kor-6" role="tabpanel" aria-labelledby="profile-tab">
                6 면
            </div>
            <div class="tab-pane fade" id="kor-6" role="tabpanel" aria-labelledby="profile-tab">
                7 분식
            </div>
    </section>
    
    	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>