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
	$().ready(function(){
		console.log('jquery로드 완료');
		mainCtgload();
		selectedDelfn();
		selectedTagDel();
		

		//커서아이콘주기
	});
	

	//태그 클릭 시 이미지의 클래스와 해당 태그 삭제이벤트
	function selectedTagDel(){
		$(document).on('click', '.selected-ingredients>p', function(){
			let tname = $(this).text();
			$('img[alt='+tname+']').removeClass("active");
			$(this).detach();
		});
	}
	
	function selectedDelfn(){
		/* 재료 이미지 선택에 따른 선택된 재료 태그란 추가 */
		$(document).on('click', 'div.ingline>div.inner', function(){
			console.log($(this));
			//이미 선택된 재료라면 다시 클릭 시 제거되도록 제공
			if(!$(this).children('img').hasClass("active")){
				//선택되지 않은 경우
				$(this).children('img').addClass("active");
				let tname = $(this).children('p').text();
				
				let tags = '<p class="'+tname+'"> <i class="fab fa-slack-hash" />'+tname+'<small><i class="fas fa-times"></i></small></p>';
				$(".selected-ingredients").append(tags);
			}
			else{
				//이미 선택된 경우
				$(this).children('img').removeClass("active");
				let tname = $(this).children('p').text();
				
				$(".selected-ingredients").children('p.'+tname).detach();
			}
		});
	}
	
	
	 
	function mainCtgload(){
		/* 메인 카테고리 선택에 따른 변경 */
		$(".main-ctg-menu p").on('click', function(){
			/* 이미 선택된 분류라면 아래의 코드 수행하지 않음 */
		 	if($(this).hasClass("active"))
				return; 
			
			console.log($(this));
			let mainCtg = {'mainCtg' : $(this).html()};
			
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
					 
					subCtgLoad();
				},
				error : (x,s,e) =>{
					console.log(x,s,e);
				}
			});
			
			
		});
	}; //메인 카테고리 교체 끝
	
	function subCtgLoad(){
		/* 서브 카테고리 클릭 이벤트 설정 & 재료 불러오기 */
		$(document).on('click', '.sub-ctg-menu li>p, .pagination>li', function(){
			let cPage = Number(1);
			let ingList;
			let forwardData;
			let subCtg = $(".sub-ctg-menu li>p.active").html();
			console.log(subCtg, '=============subCtg');
			$(".sub-ctg-menu p").removeClass("active");
			$(this).addClass("active");
			
			if($(this).hasClass('page-item')){
				cPage = cPage + Number($(this).children('a').attr("tabindex"));
				forwardData = {'subCtg' : subCtg, 'cPage' : cPage};
					
			} else if(!$(this).hasClass('page-item')){
				forwardData = {'subCtg' : $(this).html(), 'cPage' : cPage};
			}	
			//전달할객체셋에 넣기
			//페이징에서도 동일하게 사용하기
						
			$.ajax({
				url:"${pageContext.request.contextPath}/recipe/getIng",
				dataType: "json",
				method : "GET",
				data: forwardData,
				async:false,
				success : data =>{
					console.log(data,"success");
					ingList = data.ingList;
					let ingCnt = data.ingCnt;
					let cPage = data.cPage
					/* 재료 불러오기 및 교체작업*/
					$(".firstline").empty();
					$(".secondline").empty();
					$.each(ingList, function(index, item){
						if(index < 6){
							let ingredients =   '<div class="col-md-2 inner '+item.ingredientName+'">'+
												'<img src="${pageContext.request.contextPath }/resources/images/ingredient/'+item.engPrCategory+'/'+ item.engCdCategory +'/'+item.ingFilename+'" alt="'+item.ingredientName+'" name="'+item.ingredientName+'" class="ingredimg '+item.ingredientName+'">'+
												'<p>'+item.ingredientName+'</p>'+
												'</div>';
							$(".firstline").append(ingredients);
						}
						else if (index >=6){
							let ingredients =	'<div class="col-md-2 inner">'+
												'<img src="${pageContext.request.contextPath }/resources/images/ingredient/'+item.engPrCategory+'/'+ item.engCdCategory +'/'+item.ingFilename+'" alt="'+item.ingredientName+'" name="'+item.ingredientName+'" class="ingredimg '+item.ingredientName+'">'+
												'<p>'+item.ingredientName+'</p>'+
												'</div>';
							
							$(".secondline").append(ingredients);
						} 

					});
					
					//페이징 처리
					let totalPage = '<li class="page-item disabled"><a class="page-link"><small>..total : '+ingCnt+'</small></a></li>';
					let pagingPrevbtn = '<li class="page-item"><a class="page-link" tabindex="-1"> &lt 이전</a></li>';
					let pagingNextbtn = '<li class="page-item"><a class="page-link" tabindex="1"> 다음 &gt</a> </li>';
					let curPagebtn = '<li class="page-item disabled"><a class="page-link">'+cPage+'</a></li>'
					$(".pagination").empty()
					if(ingCnt == 1 && cPage == 1){
						//페이지바 추가
					//1페이지가 전제일 경우
						$(".pagination").append(totalPage);
					}else if(ingCnt > 2 && cPage != 1 && ingCnt != cPage){
					//이전 페이지와 다음 페이지가 모두 존재할 경우
						$(".pagination").append(pagingPrevbtn);
						$(".pagination").append(curPagebtn);
						$(".pagination").append(pagingNextbtn);
						$(".pagination").append(totalPage);
					}else if(ingCnt >= 2 && cPage == 1 ){
					//다음페이지가 있고 이전페이지가 없는경우
						$(".pagination").append(curPagebtn);
						$(".pagination").append(pagingNextbtn);
						$(".pagination").append(totalPage);
					}else if(ingCnt >= 2 && cPage == ingCnt){
					//이전 페이지만 존재하는 경우
						$(".pagination").append(pagingPrevbtn);
						$(".pagination").append(curPagebtn);
						$(".pagination").append(totalPage);	
					};	
				},
				error : (x,s,e) =>{
					console.log(x,s,e);
				}
			}); 
		
			let selectedinglist = $('.selected-ingredients>p').text();
		
			console.log('*****ajax밖');
			console.log('*****inglist', ingList);
			$.each(ingList, function(index, item){
				if(selectedinglist.includes(item.ingredientName)){
					$('img[alt='+item.ingredientName+']').addClass("active");
				}	
			});
		
		});
	} //서브카테고리 교체 끝

/* 	function paging(cPage, ingCnt){
		
	
}; */
	
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
