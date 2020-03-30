<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="냉장고 재료로 레시피 검색!" name="pageTitle" />
</jsp:include>

<style>
.major li {
	border: black solid 1px;
}

.major, .sub {
	display: inline-block;
}

.selected-container {
	border-radius: 0 18px 18px 0;
	background-color: rgba(205, 92, 92, 0.2);
}

.category-container, .sub, .row {
	border: blueviolet;
	border-radius: 20px;
}

.sub-container {
	border: indianred solid 5px;
	border-radius: 20px;
}

.large-ctg-box {
	border: black solid 1px;
	display: inline-block;
}

.selected-ingredients {
	margin-top: 15px;
	height: 80%;
}

/* 메인 카테고리 관련 */
.main-ctg-menu {
	list-style: none;
	text-align: center;
	padding-top: 15px;
}

@media only screen and (min-width: 768px) and (max-width: 991px) , only screen
		and (min-width: 576px) and (max-width: 767px) , ( max-width : 576px) {
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

@media only screen and (min-width: 768px) and (max-width: 991px) , only screen
		and (min-width: 576px) and (max-width: 767px) , ( max-width : 576px) {
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

/* 이미지 태그 관련 */
.ingredimg {
	border-radius: 50%;
	width: 100px;
	height: 100px;
}

.ingredimg:hover {
	box-shadow: 0px 0px 0px 3px rgba(255, 123, 123, 0.465);
}

.ingredimg.active {
	box-shadow: 0px 0px 0px 3px indianred;
}

/* 재료각각영역텍스트 */
.inner {
	padding-top: 15px;
	text-align: center;
}

/* 선택된 재료 관련 */
.giving-spaces {
	margin-top: 10px;
	color: crimson;
}

.selected-ingredients>p {
	display: inline-block;
	padding: 3px;
}

.ing-paging {
	padding-top: 20px;
	padding-bottom: 20px;
}

.btnforseach {
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
</style>

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
