<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩설정 안해주면 한글 깨짐  -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chefList.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
<script>
function go_chefpage() {
	location.href = "${pageContext.request.contextPath}/chef/chefpage.do";
}


</script>

    <section class="page-top-section page-sp set-bg" data-setbg="img/page-top-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 m-auto text-white">
                    <h2>셰프별 검색</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
            </div>
        </div>
    </section>
    <!-- 1 -->
    <!-- Page top Section end -->
    <div class="container">
        <div class="event-filter-warp">
            <div class="row">
                <div class="col-xl-2">
                    <p>셰프별 검색</p>
                </div>
                <div class="col-xl-10">
                    <form class="event-filter-form">
                        <div class="ef-item">
                            <i class="material-icons">search</i>
                            <input type="text" placeholder="">
                        </div>
                        <button class="site-btn sb-gradient">셰프 검색</button>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <section class="sectionArea">


        <div class="container chef-List">
            <div class="row">
                <div class="col-lg-12 listbutton">
                    <button type="button" class="btn btn-outline-danger">인기순</button>
                    <button type="button" class="btn btn-outline-danger">가나다순</button>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <div class="image_overflow_hidden">
                        <img src="/img/1508_008.jpg" class="" alt="">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <h4>1종원</h4>

                            <span class="color-2">#한식</span>
                            <span class="color-2">#중식</span>
                        </div>
                        <div class="col-4 align-self-center">
                            <button type="button">채널</button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <div class="image_overflow_hidden">
                        <img src="/img/1508_008.jpg" class="" alt="">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <h4>1종원</h4>

                            <span class="color-2">#한식</span>
                            <span class="color-2">#중식</span>
                        </div>
                        <div class="col-4 align-self-center">
                            <button type="button">채널</button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <div class="image_overflow_hidden">
                        <img src="/img/1508_008.jpg" class="" alt="">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <h4>1종원</h4>

                            <span class="color-2">#한식</span>
                            <span class="color-2">#중식</span>
                        </div>
                        <div class="col-4 align-self-center">
                            <button type="button">채널</button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <div class="image_overflow_hidden">
                        <img src="/img/1508_008.jpg" class="" alt="">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <h4>1종원</h4>

                            <span class="color-2">#한식</span>
                            <span class="color-2">#중식</span>
                        </div>
                        <div class="col-4 align-self-center">
                            <button type="button">채널</button>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row" id="Ylist">
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <a href="${pageContext.request.contextPath }/recipe/recipe-details.do"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" class="chef-Thumbnail">
                    <p class="chef-Thumbnail-title">불맛나는 고기 짬뽕라면</p></a>
                    <div class="row">
                        <div class="col-8">
                            <img src="/img/1508_008.jpg" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;">
                            <span class="chef-min-name">1종원</span>
                        </div>
                        <div class="col-4 chef-view-count">
                            <span>조회수 250</span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <a href="${pageContext.request.contextPath }/recipe/recipe-details.do"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" class="chef-Thumbnail">
                    <p class="chef-Thumbnail-title">불맛나는 고기 짬뽕라면</p></a>
                    <div class="row">
                        <div class="col-8">
                            <img src="/img/1508_008.jpg" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;">
                            <span class="chef-min-name">1종원</span>
                        </div>
                        <div class="col-4 chef-view-count">
                            <span>조회수 250</span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <a href="${pageContext.request.contextPath }/recipe/recipe-details.do"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" class="chef-Thumbnail">
                    <p class="chef-Thumbnail-title">불맛나는 고기 짬뽕라면</p></a>
                    <div class="row">
                        <div class="col-8">
                            <img src="/img/1508_008.jpg" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;">
                            <span class="chef-min-name">1종원</span>
                        </div>
                        <div class="col-4 chef-view-count">
                            <span>조회수 250</span>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <a href="${pageContext.request.contextPath }/recipe/recipe-details.do"><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" class="chef-Thumbnail">
                    <p class="chef-Thumbnail-title">불맛나는 고기 짬뽕라면</p></a>
                    <div class="row">
                        <div class="col-8">
                            <img src="/img/1508_008.jpg" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;">
                            <span class="chef-min-name">1종원</span>
                        </div>
                        <div class="col-4 chef-view-count">
                            <span>조회수 250</span>
                        </div>
                    </div>
                  <!--   <p class="chef-Thumbnail-link" onclick="go_chefpage();"> &nbsp;&nbsp; 채널로 이동 &nbsp;&nbsp;</p> -->
                	<input type="button" class="chef-Thumbnail-link" onclick="go_chefpage();" value="채널로 이동">
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <div class="image_overflow_hidden">
                        <img src="/img/1508_008.jpg" class="" alt="">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <h4>1종원</h4>

                            <span class="color-2">#한식</span>
                            <span class="color-2">#중식</span>
                        </div>
                        <div class="col-4 align-self-center">
                            <button type="button">채널</button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <div class="image_overflow_hidden">
                        <img src="/img/1508_008.jpg" class="" alt="">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <h4>1종원</h4>

                            <span class="color-2">#한식</span>
                            <span class="color-2">#중식</span>
                        </div>
                        <div class="col-4 align-self-center">
                            <button type="button">채널</button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <div class="image_overflow_hidden">
                        <img src="/img/1508_008.jpg" class="" alt="">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <h4>1종원</h4>

                            <span class="color-2">#한식</span>
                            <span class="color-2">#중식</span>
                        </div>
                        <div class="col-4 align-self-center">
                            <button type="button">채널</button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-3 placeholder chef_list">
                    <div class="image_overflow_hidden">
                        <img src="/img/1508_008.jpg" class="" alt="">
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-6">
                            <h4>1종원</h4>

                            <span class="color-2">#한식</span>
                            <span class="color-2">#중식</span>
                        </div>
                        <div class="col-4 align-self-center">
                            <button type="button">채널</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end-->
        <script>
            $(() => {
                $("#Ylist").hide();
                $("section .row .chef_list").on("click", function(e) {
                    $(".image_overflow_hidden").css("box-shadow", "none");
                    $(this).find(".image_overflow_hidden").css("box-shadow", "#4949E7 0px 0px 0px 4.5px");
                    console.log($(this));
                    $("#Ylist").show();
                });
            });
        </script>
    </section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>