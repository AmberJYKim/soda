<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="냉장고 재료로 레시피 검색!" name="pageTitle" />
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe-search(Ingredients).css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
    
<section class="page-top-section page-sp set-bg" data-setbg="img/page-top-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 m-auto text-white">
                <h2>냉장고 재료로 레시피 검색</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
        </div>
    </div>
</section>
<script>
$(() => {
	console.log('jquery로드 완료');
	/* 메인 카테고리 선택에 따른 변경 */
	$(".main-ctg-menu p").on('click', function(){
	
		console.log($(this));
		console.log($(this).html());
		let mainCtg = {'mainCtg' : $(this).html()};
		console.log('mainCtg', mainCtg);

		
		
		$(".main-ctg-menu p").removeClass("active");
	 	$(this).addClass("active");
		
		
		
		$.ajax({
			url:"${pageContext.request.contextPath}/recipe/getSubCtg",
			method : "GET",
			data: mainCtg,
			success : data =>{
				console.log(data);
			},
			error : (x,s,e) =>{
				console.log(x,s,e);
			}
		});
		
		
	});
	
	
	
});
</script>
<section class="overflow-hidden spad">

	<div class="container col-md-12">
		<div class="container">
			<ul class="main-ctg-menu">
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
			<div class="bx container col-md-9">
				<div class="container">
					<ul class="sub-ctg-menu">
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
				<!-- 첫번쨰 재료줄 -->
				<div class="row">
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/과일/건포도.jpg"
							alt="" class="ingredimg">
						<p>#</p>
					</div>
					<div class="col-md-2 inner">
						<img src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/과일/딸기.jpg"
							alt="" class="ingredimg">
						<p>#</p>
					</div>
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/나물허브/돌나물.png"
							alt="" class="ingredimg">
						<p>#돌나물</p>
					</div>
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/버섯/건표고버섯.jfif"
							alt="" class="ingredimg">
						<p>#돌나물</p>
					</div>
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/열매채소/가지.jpg"
							alt="" class="ingredimg">
						<p>#돌나물</p>
					</div>
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/잎채소/갓.jfif"
							alt="" class="ingredimg">
						<p>#돌나물</p>
					</div>
				</div>
				<!-- 두번쨰 재료줄 -->
				<div class="row">
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/과일/건포도.jpg"
							alt="" class="ingredimg">
						<p>#돌나물</p>
					</div>
					<div class="col-md-2 inner">
						<img src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/과일/딸기.jpg"
							alt="" class="ingredimg active">
						<p>#돌나물</p>
					</div>
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/나물허브/돌나물.png"
							alt="" class="ingredimg">
						<p>#돌나물</p>
					</div>
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/버섯/건표고버섯.jfif"
							alt="" class="ingredimg active">
						<p>#돌나물</p>
					</div>
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/열매채소/가지.jpg"
							alt="" class="ingredimg">
						<p>#돌나물</p>
					</div>
					<div class="col-md-2 inner">
						<img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/레시피 재료 소스/채소과일/잎채소/갓.jfif"
							alt="" class="ingredimg">
						<p>#돌나물</p>
					</div>
				</div>

				<div class="row ing-paging text-center">
					<ul class="pagination justify-content-center col">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 선택한 재료 태그 수집 -->
			<div class="selected-container col-md-3">
				<div>
					<h5 class="giving-spaces">선택한 재료 태그 </h5>
				</div>
				<div class="selected-ingredients">
					<p># 콩나물</p>
					<p># 불고기</p>
					<p># 참나물</p>
					<p># 어묵</p>

				</div>
				<div class="col">
					<button type="submit" class="btnforseach">
						선택한 재료로 검색하기 <img
							src="/상세페이지/파이널 메인 견본/파이널 메인 견본/img/icons/search-2.png" alt="">
					</button>
				</div>
			</div>
		</div>
	</div>

</section>
<!-- ???  end -->
<section>
	<div>검색된 영상 리스트 보여주기</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
