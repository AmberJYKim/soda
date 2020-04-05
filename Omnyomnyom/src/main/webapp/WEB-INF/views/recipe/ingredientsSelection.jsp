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
<!-- <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet"> -->
    
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
		console.log($(this).attr('class'));
		/* 이미 선택된 분류라면 아래의 코드 수행하지 않음 */
	 	if($(this).hasClass("active"))
			return; 
		
		console.log($(this));
		console.log($(this).html());
		let mainCtg = {'mainCtg' : $(this).html()};
		console.log('mainCtg', mainCtg);

		
		
		$(".main-ctg-menu p").removeClass("active");
	 	$(this).addClass("active");
		
		
		
		$.ajax({
			url:"${pageContext.request.contextPath}/recipe/getSubCtg",
			dataType: "json",
			method : "GET",
			data: mainCtg,
			success : data =>{
				
				/* 서브 카테고리 교체작업 */
				let subCtgList = ' '; 
				$.each(data,function(index, item){
					
					if(index == 0){
						subCtgList += '<li> <p class="active">'+item+'</p> </li>';
					}else{
					subCtgList += '<li> <p>'+item+'</p> </li>';
					}
					
					console.log(item);
				});

				$(".sub-ctg-menu").html(subCtgList);
				 
				
				
			},
			error : (x,s,e) =>{
				console.log(x,s,e);
			}
		});
		
		
	});
	/* 파일패스용 전역변수  */
	
	/* 서브 카테고리 클릭 이벤트 설정 & 재료 불러오기 */
	$(document).on('click', '.sub-ctg-menu li>p', function(){
		console.log($(this));
		console.log($(this).html());
		let subCtg = {'subCtg' : $(this).html()};
		console.log('subCtg', subCtg);
		$(".sub-ctg-menu p").removeClass("active");
		$(this).addClass("active");
		
		
		//액티브있는거 검사해서, 서브에저장하고, 리무드,애드 클래스하고
		//전달할객체셋에 넣기
		//페이징에서도 동일하게 사용하기
		
		//전달할 cpage설정
		/* if($(this).hasClass("active")){
			cpage = 1;
		}else{
			cpgae = $(this).text();
		}
		 */
		
		$.ajax({
			url:"${pageContext.request.contextPath}/recipe/getIng",
			dataType: "json",
			method : "GET",
			data: subCtg,
			success : data =>{
				console.log(data,"success");
				let ingList = data.ingList;
				let ingCnt = data.ingData;
				/* 재료 불러오기 및 교체작업*/
				$(".firstline").empty();
				$(".secondline").empty();
				$.each(ingList,function(index, item){
					if(index < 6){
						let ingredients =   '<div class="col-md-2 inner">'+
											'<img src="${pageContext.request.contextPath }/resources/images/ingredient/'+item.engPrCategory+'/'+ item.engCdCategory +'/'+item.ingFilename+'" alt="ingredient img" class="ingredimg">'+
											'<p>'+item.ingredientName+'</p>'+
											'</div>';
						$(".firstline").append(ingredients);
					}
					else if (index >=6){
						let ingredients = '<div class="col-md-2 inner">'+
											'<img src="${pageContext.request.contextPath }/resources/images/ingredient/'+item.engPrCategory+'/'+ item.engCdCategory +'/'+item.ingFilename+'" alt="ingredient img" class="ingredimg">'+
											'<p>'+item.ingredientName+'</p>'+
											'</div>';
						
						$(".secondline").append(ingredients);
					} 
						//이미지 추가 후 선택된재료 검사하여 있는경우 add class active
						
						//페이지바 추가
				});
			},
			error : (x,s,e) =>{
				console.log(x,s,e);
			}
		}); 
	});

	/* 재료 이미지 선택에 따른 선택된 재료 태그란 추가 */
	$(document).on('click', 'div.ingline>div.inner', function(){
		console.log($(this));
		let tag = {'tag' : $(this).html()};
		console.log('tag', tag);
		
		//이미 선택된 재료라면 다시 클릭 시 제거되도록 제공
		if(!$(this).children('img').hasClass("active")){
			//선택되지 않은 경우
			console.log($(this));
			$(this).children('img').addClass("active");
			let tname = $(this).children('p').text();
			
			let tags = '<p class="'+tname+'" onclick="tagDel();"> <i class="fab fa-slack-hash" />'+tname+'<small><i class="fas fa-times"></i></small><p>';
			$(".selected-ingredients").append(tags);
		}
		else{
			//이미 선택된 경우
			$(this).children('img').removeClass("active");
			let tname = $(this).children('p').text();
			
			$(".selected-ingredients").children('p.'+tname).remove();
		}
	});
	
	//태그 클릭 시 삭제이벤트
	$(document).on('click', '.selected-ingredients>p', function(){
		let tname = $(this).text();
		
		//아아아 어떻게잡냐고오오오오,.................ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
		//console.log($(".div.ingline>div.inner").children('p.'+tname));
		console.log("tag선택 텍스트",$(this).text());
		
		$(this).remove;
		//$(".div.ingline>div.inner").children('p.'+tname).prev('img').removeClass('active');
		
	});

	//커서아이콘주기
	
	
});
</script>
<section class="overflow-hidden spad">

	<div class="container col-md-12">
		<div class="container">
			<ul class="main-ctg-menu">
			
				<li>
					<p class="active">인기재료</p>
				</li>
				<li>
					<p >채소/과일</p>
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
					</ul>
				</div>
				<!-- 첫번쨰 재료줄 -->
				<div class="row firstline ingline">
			
				</div>
				<!-- 두번쨰 재료줄 -->
				<div class="row secondline ingline">
			
				</div>
				<!-- 재료리스트 페이징 -->
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
				<!-- 선택된 재료 담는 div -->
				<div class="selected-ingredients">
			

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
