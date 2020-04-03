<%@page import="com.google.api.services.youtube.model.MemberListResponse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩설정 안해주면 한글 깨짐  -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/recipeUpload.css"/>
<script src="${pageContext.request.contextPath }/resources/js/upload.js"></script>
<!-- 해시태그부분 소스 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/themes/prism.min.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/prism.min.js'></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/tagify.css">
<script src="${pageContext.request.contextPath }/resources/js/jq.multiinput.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/tagify.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jQuery.tagify.min.js"></script>	
	
<!-- 타임스탬프 -->
<link href="${pageContext.request.contextPath }/resources/css/jq.multiinput.min.css" rel="stylesheet">
	
 <!-- 에디터 부분 -->
 <!-- <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script> -->
	
<style contenteditable>
.tags-look .tagify__dropdown__item{
  display: inline-block;
  border-radius: 3px;
  padding: .3em .5em;
  border: 1px solid #CCC;
  background: #F3F3F3;
  margin: .2em;
  font-size: .85em;
  color: black;
  transition: 0s;
}
	
.tags-look .tagify__dropdown__item--active{
  color: black;
}
	
.tags-look .tagify__dropdown__item:hover{
  background: lightyellow;
  border-color: gold;
}
</style>	
<style>
ul#autoComplete{
	display:none;
	background-color: white;
    min-width: 100%;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    /* position: absolute; */
}

ul#autoComplete li{
	padding:0 10px;
	list-style:none;
	cursor:pointer;
}

ul#autoComplete li.sel{
	background:lightseagreen;
	color:white;
}

span.srchval{
	color:red;
}
</style>
<script>
$(function(){
	var input = document.querySelector('input[id="input-custom-dropdown"]'),
	// init Tagify script on the above inputs
	tagify = new Tagify(input, {
		whitelist: ["한식/찜", "중식/찜", "일식/찜", "A+", "A++", "ABAP", "ABC", "ABC ALGOL", "ABSET", "ABSYS", "ACC", "Accent", "Ace DASL", "ACL2", "Avicsoft", "ACT-III", "Action!", "ActionScript", "Ada", "Adenine", "Agda", "Agilent VEE", "Agora", "AIMMS", "Alef", "ALF", "ALGOL 58", "ALGOL 60", "ALGOL 68", "ALGOL W", "Alice", "Alma-0", "AmbientTalk", "Amiga E", "AMOS", "AMPL", "Apex (Salesforce.com)", "APL", "AppleScript", "Arc", "ARexx", "Argus", "AspectJ", "Assembly language", "ATS", "Ateji PX", "AutoHotkey", "Autocoder", "AutoIt", "AutoLISP / Visual LISP", "Averest", "AWK", "Axum", "Active Server Pages", "ASP.NET", "B", "Babbage", "Bash", "BASIC", "bc", "BCPL", "BeanShell", "Batch (Windows/Dos)", "Bertrand", "BETA", "Bigwig", "Bistro", "BitC", "BLISS", "Blockly", "BlooP", "Blue", "Boo", "Boomerang", "Bourne shell (including bash and ksh)", "BREW", "BPEL", "B", "C--", "C++ – ISO/IEC 14882", "C# – ISO/IEC 23270", "C/AL", "Caché ObjectScript", "C Shell", "Caml", "Cayenne", "CDuce", "Cecil", "Cesil", "Céu", "Ceylon", "CFEngine", "CFML", "Cg", "Ch", "Chapel", "Charity", "Charm", "Chef", "CHILL", "CHIP-8", "chomski", "ChucK", "CICS", "Cilk", "Citrine (programming language)", "CL (IBM)", "Claire", "Clarion", "Clean", "Clipper", "CLIPS", "CLIST", "Clojure", "CLU", "CMS-2", "COBOL – ISO/IEC 1989", "CobolScript – COBOL Scripting language", "Cobra", "CODE", "CoffeeScript", "ColdFusion", "COMAL", "Combined Programming Language (CPL)", "COMIT", "Common Intermediate Language (CIL)", "Common Lisp (also known as CL)", "COMPASS", "Component Pascal", "Constraint Handling Rules (CHR)", "COMTRAN", "Converge", "Cool", "Coq", "Coral 66", "Corn", "CorVision", "COWSEL", "CPL", "CPL", "Cryptol", "csh", "Csound", "CSP", "CUDA", "Curl", "Curry", "Cybil", "Cyclone", "Cython", "Java", "Javascript", "M2001", "M4", "M#", "Machine code", "MAD (Michigan Algorithm Decoder)", "MAD/I", "Magik", "Magma", "make", "Maple", "MAPPER now part of BIS", "MARK-IV now VISION:BUILDER", "Mary", "MASM Microsoft Assembly x86", "MATH-MATIC", "Mathematica", "MATLAB", "Maxima (see also Macsyma)", "Max (Max Msp – Graphical Programming Environment)", "Maya (MEL)", "MDL", "Mercury", "Mesa", "Metafont", "Microcode", "MicroScript", "MIIS", "Milk (programming language)", "MIMIC", "Mirah", "Miranda", "MIVA Script", "ML", "Model 204", "Modelica", "Modula", "Modula-2", "Modula-3", "Mohol", "MOO", "Mortran", "Mouse", "MPD", "Mathcad", "MSIL – deprecated name for CIL", "MSL", "MUMPS", "Mystic Programming L"],
		maxTags: 1,
		dropdown: {
			maxItems: 20,           // <- mixumum allowed rendered suggestions
			classname: "tags-look", // <- custom classname for this dropdown, so it could be targeted
			enabled: 0,             // <- show suggestions on focus
			closeOnSelect: false    // <- do not hide the suggestions dropdown once an item has been selected
		}
	});
	//enter누를시 자동 submit되는 것을 방지
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
	
	let $autoComplete = $("#autoComplete");

	$("#input-ingredient").keyup(function(e){
		let $sel = $(".sel");
		let $li = $("#autoComplete li");
		
		if(e.key == 'ArrowDown'){
			if($sel.length == 0){
				$li.first().addClass("sel");
			}else {
				$sel.removeClass("sel").next().addClass("sel");
			}
			
		}else if(e.key == 'ArrowUp'){
			if($sel.length == 0){
				$li.last().addClass("sel");
			}else {
				$sel.removeClass("sel").prev().addClass("sel");
			}
		}else if(e.key == 'Enter'){
			//요소 선택
			$(this).val($sel.text());
			$("#input-ing-number").val($sel.children("input").val());
			//검색어 목록 삭제
			$autoComplete.hide().children().remove();
			
		}else{
			let srchName = $(this).val().trim();
			console.log(srchName);
			<%--
			if(srchName.length == 0)
				return;
			--%>
			
			$.ajax({
				url:"<%=request.getContextPath()%>/recipe/"+ srchName + "/ajax",
				dataType : "json",
				success : function(data) {
								console.log(data);//'김' 입력시, "조기김, 돌김, 김가루..."
								if (data.length == 0) {
									$autoComplete.hide();
								} else {
	
									let html = "";
									$.each(data, function(idx, ingr) {
											html += "<li><span>" + 
													ingr.ingredientName.replace(srchName,"<span class='srchval'>" + srchName+ '</span>')+ 
													"</span><input type='number' value="+
													ingr.ingredientNo+
													" hidden/></li>";
									});
									$autoComplete.html(html).show();
	
									//마우스 입력 추가
									$autoComplete.children("li")
												 .click(function() {
														$("#input-ingredient").val($(this).text());
														$("#input-ing-number").val($(this).children("input").val());
														$autoComplete.hide().children().remove();
											   }).hover(function() {
														$(this).siblings().removeClass("sel");
														$(this).addClass("sel");
													  },function() {
														$(this).removeClass("sel");
											   });
	
								}
	
				},
				error : function(x, s, e) {
					console.log(x, s, e);
				}
			});
		}
	});
});
function view_change(e) {
    let id = $(e).attr('id');
    console.log(id);
    if (id == "video_btn") {
    	$("#recipeId").val('');
        $("#url_upload").css('display', 'none');
        $("#video_upload").css('display', 'block');
    } else {
    	$("#videoInput").val('');
    	$("#video_section").attr('src','').hide();
        $("#url_upload").css('display', 'block');
        $("#video_upload").css('display', 'none');
    }
};

function frmValidate(){
	if(!$("#chefId").val()){
		alert('로그인 먼제 해주세요.');
		location.href="/"
	}
	
	alert("검사 메소드가 완성되지 않았습니다.");
	return false;
};
</script>

	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
	
	<section class="page-top-section page-sp">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 m-auto text-white">
					<h2>레시피 등록하기</h2>
					<p>여러분이 자랑하고픈, 획기적인 아이디어와 손재주를 발휘해보세요.</p>
				</div>
			</div>
		</div>
	</section>
	 <!-- Page top Section end -->

	                                                                            
	<!-- 레시피 영상  Section --><!--  -->
	<section class="classes-details-section spad overflow-hidden">
		<div class="container">
			<form name="memberFrm" action="${pageContext.request.contextPath }/recipe/recipeUpload.do" method="post" onsubmit="return frmValidate();" enctype="multipart/form-data">
			<input name="chefId" value="${memberLoggedIn.memberId}" hidden/>
			<input name="chefNick" value="${memberLoggedIn.memberNick}" hidden/>
			<div class="row">
				<div class="col-lg-7">
					<div class="recipe-details">
						<div class="classes-preview">
							<div class="input-group mb-3">
                                <div class="input-group-prepend">
                                  <span class="input-group-text" id="basic-addon1">제목</span>
                                </div>
                                <input name="recipeName" type="text" class="form-control" placeholder="레시피제목을 입력하세요." aria-label="Username" aria-describedby="basic-addon1">
							  </div>
							<hr>
							<!-- 이미지 등록 -->
							<span class="warning">*영상은 URL업로드 혹은 fileUpload중 한가지만 선택할 수 있습니다.</span>
							<input type="button" id="video_btn" onclick="view_change(this);" value="영상으로 업로드하기">
                			<input type="button" id="url_btn" onclick="view_change(this);" value="URL로 업로드하기">
							<div class="oneday_class_img" id="video_upload">
								<div id="uploadbtn" class="uploadbtn" onclick="upload(this)">Upload Files</div>
								<input name="uploadFile" type='file' id="videoInput" hidden/>
								<video alt="" controls id="video_section">
									<!-- <source class="image_section_src" src="#" type='video/webm; codecs="vp8.0, vorbis"'>
									<source class="image_section_src" src="#" type='video/ogg; codecs="theora, vorbis"'> -->
									<!-- <source class="image_section_src" src="#" type='video/mp4'> -->
								</video>
							</div>
							
							<div class="input-group mb-3" id="url_upload" style="display: none;">
								<div class="input-group-prepend">
								  <span class="input-group-text" id="basic-addon1">URL</span>
								</div>
								<!-- <input class="form-control" name='basic' value="" placeholder="해시태그를 입력하세요." aria-label="Username" aria-describedby="basic-addon1" autofocus> -->
								<input class="form-control some_class_name" name="recipeId" id="recipeId" placeholder="해당 영상의 URL을 입력하세요."   aria-label="Username" aria-describedby="basic-addon1" >
							</div>
							<hr>
								<div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text" id="basic-addon1">음식 분류</span>
									</div>
									<!-- <input class="form-control" name='basic' value="" placeholder="해시태그를 입력하세요." aria-label="Username" aria-describedby="basic-addon1" autofocus> -->
									<input class="form-control" name="category" id="input-custom-dropdown" class="some_class_name" placeholder="해시태크를 입력하세요." value="" aria-label="Username" aria-describedby="basic-addon1">
								</div>
									<div class="input-group mb-3">
									<div class="input-group-prepend">
									  <span class="input-group-text" id="basic-addon1">음식 이름</span>
									</div>
									<!-- <input class="form-control" name='basic' value="" placeholder="해시태그를 입력하세요." aria-label="Username" aria-describedby="basic-addon1" autofocus> -->
									<input class="form-control" name="menuName" class="some_class_name" placeholder="음식의 이름을 입력하세요." value="" aria-label="Username" aria-describedby="basic-addon1" >
								</div>
							<hr>
								<!-- 재료입력 -->
								<h6 class="insert-title">재료를 입력하세요.</h6>
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
                                <div class="row m-auto">
                                <span class="input col-4 p-0">
                                    <input class="form-control" type="text" id="input-ingredient" autocomplete="off" placeholder="재료명을 입력하세요."/>
                                	<ul id="autoComplete"></ul>
								</span>
								<input type="number" id="input-ing-number" hidden/>
								<span class="input col-4 p-0">
                                    <input class="form-control" type="text" id="input-ing-mass" autocomplete="off" placeholder="계량을 입력하세요."/>
                                </span>
                                <div class="col py-1 pr-0 input">
                                <!-- <button class="site-btn sb-gradient px-3" style="min-width: 100%;" type="button" onclick="addClassTime();">추가</button> -->
									<i class="fa fa-lg fa-plus-circle" style="min-width: 100%;" onclick="addIngredient();" type="button"></i>
								</div>
                                </div>
                                <div id="input-date-list"></div>
								</div>
							</div>
						</div>	
						<hr>
						</div>
					</div>
				<!-- 댓글 -->
				<div class="updatetext">
					<h6>해당 영상의 부가 설명을 입력하세요.</h6>
				</div>
				<div class="row recipe-editor">
					<div class="col">

						<textarea name="recipeContent" style="width: 100%;"></textarea>

					</div>
				</div>
				<div class="mt-2">
					<input type="submit" class="" value="레시피 등록">
				</div>
			</div>
			
				<div class="col-lg-5 col-md-6 col-sm-9 sidebar">
				<!-- 타임 스탬프 start -->
					<div class="sb-widget">
						<h6 class="sb-title">요리방법을 작성해주세요. </h6>
						<div class="classes-info">
							<div class="container">
								<div class="row">
									<div class="col-xs-4">
									<div class="form-control" id="participants" name="participants"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 타임 스탬프 end -->

				</div>
			</div>
			</form>
		</div>
	</section>
	<!-- Classes Details Section end -->

		


<!-- <script crossorigin="anonymous" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->


	
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>