<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"> 
<jsp:param value="안녕 옴뇸뇸!" name="pageTitle"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chefInsert.css" />

 <script>
        window.onload = function() {
            //비디오 불러오기 후 처리
            console.log("가니?");

            function video_readURL(input) {
                if (input.files && input.files[0]) {
                    var imgFile = $(input).val();
                    var fileForm = /(.*?)\.(mp4|mov|mpeg4|avi|wmv)$/i;
                    var maxSize = 64 * 1000 * 1000 * 1000;
                    var fileSize;

                    if (imgFile != "" && imgFile != null) {
                        fileSize = input.files[0].size;
                        if (!imgFile.match(fileForm)) {
                            alert("비디오 파일(mp4,mov,mpeg4,avi,wmv)만 업로드 가능");
                            $(input).val(null);
                            return;
                        } else if (fileSize > maxSize) {
                            alert("파일 사이즈는 64GB까지 가능");
                            $(input).val(null);
                            return;
                        }
                    }


                    var reader = new FileReader();

                    reader.onload = function(e) {
                        //                    	$('#image_section').show();
                        //                        $('.image_section_src').attr('src', e.target.result).show();
                        $('#video_section').attr('src', e.target.result).show();
                        let $vidoe_uploadbtn = $("#vidoe_uploadbtn");
                        $vidoe_uploadbtn.html("");
                        $vidoe_uploadbtn.addClass("uploading");
                        setTimeout(function() {
                            $vidoe_uploadbtn.removeClass('uploading');
                            $vidoe_uploadbtn.html("Upload Files");
                        }, 1200);
                    };

                    reader.readAsDataURL(input.files[0]);
                } else {
                    $('#video_section').hide();
                }
            }

            //비디오 불러오기
            $("#videoInput").change(function() {

                video_readURL(this);
            });

            //시작시 비다오
            $("#video_section").hide();


            //이미지 불러오기 후 처리
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var imgFile = $(input).val();
                    var fileForm = /(.*?)\.(jpg|jpeg|png)$/i;
                    var maxSize = 5 * 1024 * 1024;
                    var fileSize;

                    if (imgFile != "" && imgFile != null) {
                        fileSize = input.files[0].size;
                        if (!imgFile.match(fileForm)) {
                            alert("이미지 파일만 업로드 가능");
                            $(input).val(null);
                            return;
                        } else if (fileSize > maxSize) {
                            alert("파일 사이즈는 5MB까지 가능");
                            $(input).val(null);
                            return;
                        }
                    }


                    var reader = new FileReader();

                    reader.onload = function(e) {
                        $('#image_section').attr('src', e.target.result).show();
                        let $uploadbtn = $("#uploadbtn");
                        $uploadbtn.html("");
                        $uploadbtn.addClass("uploading");
                        setTimeout(function() {
                            $uploadbtn.removeClass('uploading');
                            $uploadbtn.html("Upload Files");
                        }, 1200);
                    };

                    reader.readAsDataURL(input.files[0]);
                } else {
                    $('#image_section').hide();
                }
            }

            //이미지 불러오기
            $("#imgInput").change(function() {

                readURL(this);
            });

            //시작시 이미지
            $("#image_section").hide();

        };

        //이미지 불러오기 버튼 처리
        function videoUpload(ref) {
            $("#videoInput").click();
        };

        function upload(ref) {
            $("#imgInput").click();
        };

        // 영상 업로드 버튼에 따른 뷰단 조정
        function view_change(e) {
            let id = $(e).attr('id');
            console.log(id);
            if (id == "video_btn") {
                $("#url_upload").css('display', 'none');
                $("#video_upload").css('display', 'block');
            } else {
                $("#url_upload").css('display', 'block');
                $("#video_upload").css('display', 'none');
            }
        }
    </script>

 <!-- 페이지 titile start -->
    <section class="event-details-section spad overflow-hidden">
        <div class="tm-section-2">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <h2 class="tm-section-title">셰프 신청</h2>
                        <p class="tm-color-white tm-section-subtitle">당신을 응원합니다.</p>
                    </div>
                </div>
            </div>
        </div>


        <div class="tm-section tm-position-relative">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none" class="tm-section-down-arrow">
                    <polygon fill="#4949e7" points="0,0  100,0  50,60"></polygon>
        </svg>

    </section>
    <!-- 페이지 titile end -->
    <!-- Event Details Section -->
    <section class="event-details-section spad overflow-hidden">
        <div class="container">
            <form action="">

                <hr>
                <h3 class="mall_isnert_title title_auto">주 종목 등록</h3>
                <p class="title_info">셰프님의 주 종목을 3가지까지만 등록해주세요.</p>
                <hr>
                <!-- 음식주종목 3가지 선택 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">주 종목</span>
                    </div>
                    <!-- <input class="form-control" name='basic' value="" placeholder="해시태그를 입력하세요." aria-label="Username" aria-describedby="basic-addon1" autofocus> -->
                    <input class="form-control" name="input-custom-dropdown" class="some_class_name" value="" aria-label="Username" aria-describedby="basic-addon1" autofocus>
                </div>

                <div class="row" style="margin-top:100px;">
                    <div class="col-lg-4">
                        <!-- 프로필 이미지 등록 -->
                        <h3 class="mall_isnert_title">프로필 등록</h3>

                        <hr>
                        <p style="font-size: 10px; color:red;">*규격은 200px*200px 입니다.</p>
                        <div class="chef_img">
                            <div id="uploadbtn" onclick="upload(this)">Upload Files</div>
                            <input type='file' id="imgInput" hidden/>
                            <img src="#" alt="" id="image_section">
                        </div>

                    </div>

                    <!-- 사이드부분 -->
                    <div class="col-lg-8 col-md-5 col-sm-8 ">
                        <h3 class="mall_isnert_title">셰프정보 등록</h3>
                        <hr>
                        <!-- 셰프 채널명 닉네임 -->
                        <p style="font-size: 10px; color:red; margin-left:5px; float: right; position:relative; top: 25px;">*채널명은 닉네임과 동일하게 진행됩니다.</p>
                        <span class="input input--yoshiko">
                                    <!-- 클래스명 input -->
                                    <input class="input__field input__field--yoshiko" type="text" id="input-class-name" value="백종원의 요리비책" readonly />
                                    <!-- 클래스명 라벨 -->
                                    <label class="input__label input__label--yoshiko" for="input-class-name">
                                        <span class="input__label-content input__label-content--yoshiko" data-content="채널명(닉네임)">채널명(닉네임)</span>
                        </label>
                        </span>

                        <!--  사업장 등록  -->
                        <p style="font-size: 10px; color:red; margin-left:5px; float: right; position:relative; top: 25px;">*운영하시는 사업장을 홍보해 드립니다. (업장명/주소)</p>
                        <span class="input input--yoshiko">
                                    <!-- 클래스명 input -->
                                    <input class="input__field input__field--yoshiko" type="text" id="input-class-name" />
                                    <!-- 클래스명 라벨 -->
                                    <label class="input__label input__label--yoshiko" for="input-class-name">
                                        <span class="input__label-content input__label-content--yoshiko" data-content="사업장 정보">사업장 정보</span>
                        </label>
                        </span>
                    </div>
                    <!-- snn 정보 등록  -->
                    <div class="col-lg-12">
                        <hr>
                        <h3 class="mall_isnert_title title_auto">SNN 등록</h3>
                        <p class="title_info">셰프님의 snn의 아이디를 등록해 주세요.</p>
                        <hr>
                    </div>
                    <div class="col-lg-6">
                        <span class="input input--yoshiko">
                            <!-- 클래스명 input -->
                            <input class="input__field input__field--yoshiko" type="text" id="input-class-name" />
                            <!-- 클래스명 라벨 -->
                            <label class="input__label input__label--yoshiko" for="input-class-name">
                                <span class="input__label-content input__label-content--yoshiko" data-content="페이스북">페이스북</span>
                        </label>
                        </span>
                    </div>
                    <div class="col-lg-6">
                        <span class="input input--yoshiko">
                            <!-- 클래스명 input -->
                            <input class="input__field input__field--yoshiko" type="text" id="input-class-name" />
                            <!-- 클래스명 라벨 -->
                            <label class="input__label input__label--yoshiko" for="input-class-name">
                                <span class="input__label-content input__label-content--yoshiko" data-content="인스타그램">인스타그램</span>
                        </label>
                        </span>
                    </div>
                </div>


                <hr>
                <h3 class="mall_isnert_title title_auto">어필영상 등록</h3>
                <p class="title_info">저희는 어필영상으로 신청 여부를 결정하고 있습니다. 자신있는 영상을 반드시 등록 부탁드립니다.</p>
                <hr>
                <input type="button" id="video_btn" onclick="view_change(this);" value="영상으로 업로드하기">
                <input type="button" id="url_btn" onclick="view_change(this);" value="URL로 업로드하기">
                <div class="row">
                    <div class="col-lg-12 m-auto">
                        <!-- 영상으로 업로드  -->
                        <div class="vidoe_upload" id="video_upload">
                            <div id="vidoe_uploadbtn" class="uploadbtn" onclick="videoUpload(this)">Upload Files</div>
                            <input name="uploadFile" type='file' id="videoInput" hidden/>
                            <!-- <img src="#" alt="" id="image_section"> -->
                            <video alt="" controls id="video_section">
                                <!-- <source class="image_section_src" src="#" type='video/webm; codecs="vp8.0, vorbis"'>
                                <source class="image_section_src" src="#" type='video/ogg; codecs="theora, vorbis"'> -->
                                <!-- <source class="image_section_src" src="#" type='video/mp4'> -->
                            </video>
                        </div>
                        <!-- url 업로드  -->
                        <span class="input input--yoshiko" style="display:none" id="url_upload">
                            <!-- 클래스명 input -->
                            <input class="input__field input__field--yoshiko" type="text" id="input-class-name" />
                            <!-- 클래스명 라벨 -->
                            <label class="input__label input__label--yoshiko" for="input-class-name">
                                <span class="input__label-content input__label-content--yoshiko" data-content="영상 링크">영상 링크</span>
                        </label>
                        </span>
                    </div>
                </div>
                <hr>
                <h3 class="mall_isnert_title title_auto">자기소개 등록</h3>
                <p class="title_info">셰프님의 간략한 자기 소개 부탁드립니다. </p>
                <hr>
                <textarea cols="118" rows="10"></textarea>
                <div class="sb-widget">
                    <!-- 셰프 신청버튼 -->
                    <button class="site-btn sb-gradient reservation_class"><a href="class_reservation.html">등록하기</a></button>
                </div>
            </form>
        </div>
    </section>
    <!-- Event Details Section end -->
 <script data-name="dropdown-tags">
        (function() {

            var input = document.querySelector('input[name="input-custom-dropdown"]'),
                // init Tagify script on the above inputs
                tagify = new Tagify(input, {
                    whitelist: ["한식", "중식", "일식", "양식", "밀식", "즉석식", "기타식", "건강식"],
                    maxTags: 10,
                    dropdown: {
                        maxItems: 20, // <- mixumum allowed rendered suggestions
                        classname: "tags-look", // <- custom classname for this dropdown, so it could be targeted
                        enabled: 0, // <- show suggestions on focus
                        closeOnSelect: false // <- do not hide the suggestions dropdown once an item has been selected
                    }
                })
        })()
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
