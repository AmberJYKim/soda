<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩설정 안해주면 한글 깨짐  -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<!--  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chefpage.css">
    <script>
        var tag = document.createElement('script'); //이거 뭔지 모름
        tag.src = "https://www.youtube.com/iframe_api"; //api 주소
        var firstScriptTag = document.getElementsByTagName('script')[0]; //이거 뭔지 모름
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); //이거 뭔지 모름
        var player; //유튜브 api 전역변수
        var setVideoId = "t4Es8mwdYlE"; //유튜브영상 ID
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('testPTag', {
                videoId: setVideoId,
            });
        }


        //유튜브 영상 redirect
        function hreflink(s) {
            player.loadVideoById(setVideoId, s);
        }
       
    </script>
    
    <script>
    
    function recipeUpload() {
		location.href="${pageContext.request.contextPath}/recipe/recipeUpload.do";
	};
    function recipeUpdate() {
    	location.href="${pageContext.request.contextPath}/recipe/recipeUpdate.do";
		
	};
	function classManage() {
		location.href="${pageContext.request.contextPath}/oneday/class_manager.do";
	};
	function classUpload(){
		location.href="${pageContext.request.contextPath}/oneday/class_insert";
	}
    
    </script>		
    <section class="page-top-section page-sp set-bg" data-setbg="">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 m-auto text-white">
                    <h2>셰프</h2>

                </div>
            </div>
        </div>
    </section>


    <section class="classes-details-section spad overflow-hidden">
        <div class="container">
            <!--  셰프채널 navbar -->
            <div class="row">
                <div class="col-lg-12">
                    <ul class="nav nav-pills nav-fill">
                        <li class="nav-item">
                            <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="ture">홈</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#video" role="tab" aria-controls="profile" aria-selected="false">동영상</a>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#playlist" role="tab" aria-controls="contact" aria-selected="false">재생목록</a>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#notice" role="tab" aria-controls="contact" aria-selected="false">공지사항</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#onedayclass" role="tab" aria-controls="contact" aria-selected="false">원데이 클래스</a>
                        </li>
                    </ul>
                </div>

                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="container">
                            <div class="row">
                                <!-- 셰프 대표영상 start  -->
                                <div class="col-lg-5">
                                    <div class="chef-home-details">
                                        <div class="classes-preview">
                                            <div id="youtubevideo">
                                                <div class="chef-home-video" id="testPTag"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 셰프 프로필 -->
                                <div class="col-lg-7">
                                    <div class="trainer-details infobox" id="chef-details">
                                        <div class="trainer-info">
                                            <div class=" col-lg-5 pull-left">
                                                <!-- 셰프프로필 사진  -->
                                                <img src="/img/classes/1.jpg" alt="">
                                                <!-- 셰프 sns옵션 -->
                                                <div class="td-social">
                                           
                                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                                </div>
                                            </div>
                                            <div class="td-right col-lg-7 chefinfo">
                                                <h3>채널명 (셰프닉네임)</h3>
                                                <h6>셰프 아이디</h6>
                                                <ul>
                                                    <li><strong>개설일</strong>
                                                        <p>2020.03.02</p>
                                                    </li>
                                                    <li><strong>이메일</strong>
                                                        <p>emily-walker@example.com</p>
                                                    </li>
                                                    <li><strong>사업장 정보</strong>
                                                        <p>더본코리아 | 서울특별시 강남구 논현동 165-3</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 쉐프 텍스트들어가는 부분 -->
                                <div class="container">
                                    <div class="row">
                                        <div class="trainer-details" id="chef-details">
                                            <div class="trainer-info">
                                                <div class="td-right col-lg-12">
                                                    <div class="">안녕하세요 여러분 저는 백종원이라고합니다. 여러분들이 쉽고 재밌게 요리를 배울 수 있을 뿐만아니라, 누구보다 맛있게 음식을 만들 수 있게 노력하겠습니다.(셰프가 작성하는 텍스트란, 자기소개페이지 같은..) </div>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <hr>
                        <!-- 홈-인기동영상 -->
                        <div class="container" id="fav-video">
                            <h6>인기 동영상</h6>
                            <div class="row">
                                <div class="col-lg-3 upload-video">
                                    <a href="${pageContext.request.contextPath }/recipe/recipe-details.do"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                     <a href="#"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                     <a href="#"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                    <a href="#"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <!-- 홈-업로드한 동영상 -->
                        <div class="container" id="upload-video">

                            <h6>업로드한 동영상</h6>
                            <div class="row">
                                <div class="col-lg-3 upload-video">
                                    <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                    <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                    <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                  	<a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 동영상 탭 클릭시 나오는 모든 영상 (업로드 순) -->
                    <div class="tab-pane fade" id="video" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="upvideo container" id="video-upload-video">
                            <h6>업로드한 동영상</h6>
                            <div class="row">
                                <div class="col-lg-12">
                                    <button type="button" class="btn btn-outline-danger" onclick="recipeUpdate();">동영상 관리</button>
                                    <button type="button" class="btn btn-outline-danger" onclick="recipeUpload();">동영상 업로드</button>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 upload-video">
                                    <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                    <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                     <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                     <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                     <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                    <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                     <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                                <div class="col-lg-3 upload-video">
                                     <a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="300" height="150">
                                    <h6>백종원의 불맛나는 짬뽕을 5분안에 어떻게 만들까??</h6></a>
                                    <li>조회수 : 16.5만회</li>
                                </div>
                            </div>
                        </div>
                        <div class="site-pagination pt-3.5">
                            <a href="#"><i class="material-icons">keyboard_arrow_left</i></a>
                            <div class="site-pagination pt-3.5">
                                <a href="#" class="active">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="material-icons">keyboard_arrow_right</i></a>
                            </div>
                        </div>

                    </div>

                    <!-- <div class="tab-pane fade" id="playlist" role="tabpanel" aria-labelledby="contact-tab">재생목록</div> -->
                    <!-- 공지사항 탭을 누르면 나오는 게시판목록 -->
                    <div class="tab-pane fade" id="notice" role="tabpanel" aria-labelledby="contact-tab">
                        <div id="notice">
                            <h4>공지사항</h4>
                        </div>

                        <!-- 아코디언 게시판 -->
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="accordion" id="accordionExample">
                                        <div class="card">
                                            <div class="card-header notice_header" id="headingOne">
                                                <h2 class="mb-0">
                                                    <button class="btn btn-link notice_content" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                <ul class="notice_content">
                                                    
                                                    <li>[원데이 클래스]</li>
                                                    <li>원데이클래스 공지합니다.</li>
                                                    <li>2020-03-18</li>
                                                </ul>
                                              </button>
                                                </h2>
                                            </div>

                                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                                                    on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                                                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card">
                                            <div class="card-header notice_header" id="headingTwo">
                                                <h2 class="mb-0">
                                                    <button class="btn btn-link notice_content collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                <ul class="notice_content">
                                                    
                                                    <li>[레시피]</li>
                                                    <li>레시피 공지합니다.</li>
                                                    <li>2020-03-18</li>
                                                </ul>
                                              </button>
                                                </h2>
                                            </div>
                                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                                                    on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                                                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header notice_header" id="headingThree">
                                                <h2 class="mb-0">
                                                    <button class="btn btn-link notice_content collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                <ul class="notice_content">
                                                    
                                                    <li>[원데이 클래스]</li>
                                                    <li>원데이클래스 시간조정합니다.</li>
                                                    <li>2020-03-18</li>
                                                </ul>
                                              </button>
                                                </h2>
                                            </div>
                                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                                                    on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                                                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header notice_header" id="headingThree">
                                                <h2 class="mb-0">
                                                    <button class="btn btn-link notice_content collapsed" type="button" data-toggle="collapse" data-target="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
                                                    <ul class="notice_content">
                                                    
                                                        <li>[기타]</li>
                                                        <li>방송 결방 합니다.</li>
                                                        <li>2020-03-18</li>
                                                    </ul>
                                                </button>
                                                </h2>
                                            </div>
                                            <div id="collapsefour" class="collapse" aria-labelledby="collapsefour" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                                                    on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                                                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header notice_header" id="headingThree">
                                                <h2 class="mb-0">
                                                    <button class="btn btn-link notice_content collapsed" type="button" data-toggle="collapse" data-target="#collapsefive" aria-expanded="false" aria-controls="collapsefive">
                                                    <ul class="notice_content">
                                                    
                                                        <li>[원데이 클래스]</li>
                                                        <li>원데이클래스 공지합니다.</li>
                                                        <li>2020-03-18</li>
                                                    </ul>
                                                </button>
                                                </h2>
                                            </div>
                                            <div id="collapsefive" class="collapse" aria-labelledby="collapsefive" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                                                    on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.
                                                    Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <a class="btn btn-default pull-right">글쓰기</a>
                                </div>
                            </div>
                            <div class="site-pagination pt-3.5">
                                <a href="#"><i class="material-icons">keyboard_arrow_left</i></a>
                                <div class="site-pagination pt-3.5">
                                    <a href="#" class="active">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#"><i class="material-icons">keyboard_arrow_right</i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="onedayclass" role="tabpanel" aria-labelledby="contact-tab">
                        <!-- 클래스 목록들 start -->
                        <div class="row f-class">
                            <div class="col-lg-6">
                                <h6 class="">인기 클래스</h6>
                            </div>
                            <div class="col-lg-6">
                                <input type="button" class="btn btn-outline-danger" onclick="classManage();" value="클래스 관리">
                                <input type="button" class="btn btn-outline-danger" onclick="classUpload();" value="클래스 업로드">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="classes-item-warp">
                                    <div class="classes-item item_rate">
                                        <div class="ci-img">
                                            <img src="/img/classes/cook.jpg" alt="">
                                        </div>
                                        <div class="ci-text">
                                            <h4>클래스명</h4>
                                            <div class="ci-metas">
                                                <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
                                                <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                                            </div>
                                            <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                                        </div>
                                        <div class="ci-bottom">
                                            <div class="ci-author">
                                                <img src="/img/classes/author/1.jpg" alt="">
                                                <div class="author-text">
                                                    <h6>클래스명</h6>
                                                    <p>셰프이름</p>
                                                </div>
                                            </div>
                                            <a href="" class="site-btn sb-gradient">예약하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="classes-item-warp">
                                    <div class="classes-item item_rate">
                                        <div class="ci-img">
                                            <img src="/img/classes/cook.jpg" alt="">
                                        </div>
                                        <div class="ci-text">
                                            <h4>클래스명</h4>
                                            <div class="ci-metas">
                                                <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
                                                <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                                            </div>
                                            <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                                        </div>
                                        <div class="ci-bottom">
                                            <div class="ci-author">
                                                <img src="/img/classes/author/1.jpg" alt="">
                                                <div class="author-text">
                                                    <h6>클래스명</h6>
                                                    <p>셰프이름</p>
                                                </div>
                                            </div>
                                            <a href="" class="site-btn sb-gradient">예약하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="classes-item-warp">
                                    <div class="classes-item item_rate">
                                        <div class="ci-img">
                                            <img src="/img/classes/cook.jpg" alt="">
                                        </div>
                                        <div class="ci-text">
                                            <h4>클래스명</h4>
                                            <div class="ci-metas">
                                                <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
                                                <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                                            </div>
                                            <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                                        </div>
                                        <div class="ci-bottom">
                                            <div class="ci-author">
                                                <img src="/img/classes/author/1.jpg" alt="">
                                                <div class="author-text">
                                                    <h6>클래스명</h6>
                                                    <p>셰프이름</p>
                                                </div>
                                            </div>
                                            <a href="" class="site-btn sb-gradient">예약하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="classes-item-warp">
                                    <div class="classes-item item_rate">
                                        <div class="ci-img">
                                            <img src="/img/classes/cook.jpg" alt="">
                                        </div>
                                        <div class="ci-text">
                                            <h4>클래스명</h4>
                                            <div class="ci-metas">
                                                <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
                                                <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                                            </div>
                                            <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                                        </div>
                                        <div class="ci-bottom">
                                            <div class="ci-author">
                                                <img src="/img/classes/author/1.jpg" alt="">
                                                <div class="author-text">
                                                    <h6>클래스명</h6>
                                                    <p>셰프이름</p>
                                                </div>
                                            </div>
                                            <a href="" class="site-btn sb-gradient">예약하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <h6 class="f-class">신규 클래스</h6>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="classes-item-warp">
                                        <div class="classes-item item_rate">
                                            <div class="ci-img">
                                                <img src="/img/classes/cook.jpg" alt="">
                                            </div>
                                            <div class="ci-text">
                                                <h4>클래스명</h4>
                                                <div class="ci-metas">
                                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
                                                    <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                                                </div>
                                                <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                                            </div>
                                            <div class="ci-bottom">
                                                <div class="ci-author">
                                                    <img src="/img/classes/author/1.jpg" alt="">
                                                    <div class="author-text">
                                                        <h6>클래스명</h6>
                                                        <p>셰프이름</p>
                                                    </div>
                                                </div>
                                                <a href="" class="site-btn sb-gradient">예약하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="classes-item-warp">
                                        <div class="classes-item item_rate">
                                            <div class="ci-img">
                                                <img src="/img/classes/cook.jpg" alt="">
                                            </div>
                                            <div class="ci-text">
                                                <h4>클래스명</h4>
                                                <div class="ci-metas">
                                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
                                                    <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                                                </div>
                                                <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                                            </div>
                                            <div class="ci-bottom">
                                                <div class="ci-author">
                                                    <img src="/img/classes/author/1.jpg" alt="">
                                                    <div class="author-text">
                                                        <h6>클래스명</h6>
                                                        <p>셰프이름</p>
                                                    </div>
                                                </div>
                                                <a href="" class="site-btn sb-gradient">예약하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="classes-item-warp">
                                        <div class="classes-item item_rate">
                                            <div class="ci-img">
                                                <img src="/img/classes/cook.jpg" alt="">
                                            </div>
                                            <div class="ci-text">
                                                <h4>클래스명</h4>
                                                <div class="ci-metas">
                                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
                                                    <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                                                </div>
                                                <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                                            </div>
                                            <div class="ci-bottom">
                                                <div class="ci-author">
                                                    <img src="/img/classes/author/1.jpg" alt="">
                                                    <div class="author-text">
                                                        <h6>클래스명</h6>
                                                        <p>셰프이름</p>
                                                    </div>
                                                </div>
                                                <a href="" class="site-btn sb-gradient">예약하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="classes-item-warp">
                                        <div class="classes-item item_rate">
                                            <div class="ci-img">
                                                <img src="/img/classes/cook.jpg" alt="">
                                            </div>
                                            <div class="ci-text">
                                                <h4>클래스명</h4>
                                                <div class="ci-metas">
                                                    <div class="ci-meta"><i class="material-icons">event_available</i>Mon, Wed, Fri</div>
                                                    <div class="ci-meta"><i class="material-icons">alarm_on</i>06:30pm - 07:45pm</div>
                                                </div>
                                                <p>이번 클래스는 욤뇸뇸할 수 있는 메뉴를 만들어 볼까합니다. 진행을 원하시는 분들은 어서어서 예약해주세요!</p>
                                            </div>
                                            <div class="ci-bottom">
                                                <div class="ci-author">
                                                    <img src="/img/classes/author/1.jpg" alt="">
                                                    <div class="author-text">
                                                        <h6>클래스명</h6>
                                                        <p>셰프이름</p>
                                                    </div>
                                                </div>
                                                <a href="" class="site-btn sb-gradient">예약하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="site-pagination pt-3.5">
                                            <a href="#" class="active">1</a>
                                            <a href="#">2</a>
                                            <a href="#"><i class="material-icons">keyboard_arrow_right</i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
    </section>








<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>