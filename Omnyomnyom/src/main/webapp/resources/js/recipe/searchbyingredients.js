$().ready(function(){
		console.log('jquery로드 완료');
		subCtgload();
		selectedDelfn();
		selectedTagDel();
		
		
		//페이지 로드 시 서브 카테고리 선택효과 주기
		$(".main-ctg-menu>li").children(":first").trigger('click');
		//커서아이콘주기
	});
	

	//태그 클릭 시 이미지의 클래스와 해당 태그 삭제이벤트
	function selectedTagDel(){
		$(document).on('click', '.selected-ingredients>p', function(){
			let tname = $(this).text();
			console.log(tname);
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
				let ingredientNo = $(this).children('img').data('ingredientno');
				
				console.log(ingredientNo);
				
				let tags = '<p class="'+tname+'" data-ingredientno="'+ingredientNo+'"> <i class="fab fa-slack-hash" />'+tname+'<small><i class="fas fa-times"></i></small></p>';
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
	
	
	 
	function subCtgload(){
		/* 메인 카테고리 선택에 따른 변경 */
		$(".main-ctg-menu p").on('click', function(){
			/* 이미 선택된 분류라면 아래의 코드 수행하지 않음 */
			
		 	if($(this).hasClass("active"))
				return; 
			
			console.log($(this));
			let mainCtg = {'mainCtg' : $(this).html()};
			
			$(".main-ctg-menu p").removeClass("active");
		 	$(this).addClass("active");
			
		 	console.log(mainCtg);
		 	
			$.ajax({
				url: contextPath+"/recipe/getSubCtg",
				dataType: "json",
				method : "GET",
				data: mainCtg,
				success : data =>{
					/* 서브 카테고리 교체작업 */
					let subCtgList = ' '; 
					$.each(data,function(index, item){
						subCtgList += '<li> <p>'+item+'</p> </li>';
						console.log(item);
					});
					$(".sub-ctg-menu").html(subCtgList);
					IngsLoad();
					$(".sub-ctg-menu>li").children("p:first").trigger('click');
				},
				error : (x,s,e) =>{
					console.log(x,s,e);
				}
			});
			
			
		});
	}; //서브 카테고리 교체 끝
	
	function IngsLoad(){
		/* 서브 카테고리 클릭 이벤트 설정 & 재료 불러오기 */
		$(document).on('click change', '.sub-ctg-menu li>p, .pagination>li', function(){
			
			let cPage; 
			let ingList;
			let forwardData;
			let subCtg = $(".sub-ctg-menu p.active").text();
			let	mainCtg = $(".main-ctg-menu p.active").text();
			
			if($(this).hasClass('page-item')){
				if( $("a.curPage").text() != undefined && $("a.curPage").text() != 0 && $("a.curPage").text() != null)  {
					cPage = Number($("a.curPage").text());
				} else{
					cPage = Number(1);
				}
				cPage = cPage + Number($(this).children('a').attr("tabindex"));
				forwardData = {'mainCtg' : mainCtg, 'subCtg' : subCtg, 'cPage' : cPage};
			} else if(!$(this).hasClass('page-item')){
				forwardData = {'mainCtg' : mainCtg, 'subCtg' : $(this).html(), 'cPage' : cPage};
				$(".sub-ctg-menu p").removeClass("active");
				$(this).addClass("active");
			}	
			//전달할객체셋에 넣기
			//페이징에서도 동일하게 사용하기
			$(".firstline").empty();
			$(".secondline").empty();	
			
			$.ajax({
				url: contextPath+"/recipe/getIng",
				dataType: "json",
				method : "GET",
				data: forwardData,
				async:false,
				success : data =>{
					console.log(data,"success");
		
					ingList = data.ingList;
					let ingCnt = data.ingCnt;
					cPage = data.cPage
					/* 재료 불러오기 및 교체작업*/
					$.each(ingList, function(index, item){
						if(index < 6){
							let ingredients =   '<div class="col-md-2 inner '+item.ingredientName+'">'+
												'<img src="'+contextPath+'/resources/images/ingredient/'+item.engPrCategory+'/'+ item.engCdCategory +'/'+item.ingFilename+'" alt="'+item.ingredientName+'" data-ingredientno="'+item.ingredientNo+'" class="ingredimg '+item.ingredientName+'">'+
												'<p>'+item.ingredientName+'</p>'+
												'</div>';
							console.log(item.ingredientNo);
							$(".firstline").append(ingredients);
						}
						else if (index >=6){
							let ingredients =	'<div class="col-md-2 inner">'+
												'<img src="'+contextPath+'/resources/images/ingredient/'+item.engPrCategory+'/'+ item.engCdCategory +'/'+item.ingFilename+'" alt="'+item.ingredientName+'" data-ingredientno="'+item.ingredientNo+'" class="ingredimg '+item.ingredientName+'">'+
												'<p>'+item.ingredientName+'</p>'+
												'</div>';
							
							$(".secondline").append(ingredients);
						} 
					});
					
					//페이징 처리
					console.log("페이징 시작");
					let totalPage = '<li class="page-item disabled"><a class="page-link"><small>..total : '+ingCnt+'</small></a></li>';
					let pagingPrevbtn = '<li class="page-item"><a class="page-link" tabindex="-1"> &lt 이전</a></li>';
					let pagingNextbtn = '<li class="page-item"><a class="page-link" tabindex="1"> 다음 &gt</a> </li>';
					let curPagebtn = '<li class="page-item disabled"><a class="page-link curPage">'+cPage+'</a></li>'
					$(".pagination").empty();
					//페이지바 추가
					if(ingCnt == 1 && cPage == 1){
					//1페이지가 전제일 경우
						$(".pagination").append(totalPage);
					}else if(ingCnt >= 2 && cPage != 1 && ingCnt != cPage){
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
					console.log("페이징 끝========================");
				},
				error : (x,s,e) =>{
					console.log(x,s,e);
				}
			}); 
		
			let selectedinglist = $('.selected-ingredients>p').text();
			//이미 선택된 재료에 존재하는 재료일 경우 active 클래스 추가 
			$.each(ingList, function(index, item){
				if(selectedinglist.includes(item.ingredientName)){
					$('img[alt='+item.ingredientName+']').addClass("active");
				}	
			});
		
		});
	} //서브카테고리 교체 끝

	
	//선택된 재료로 검색 , 버튼 클릭에 따른 이벤트 작동.
	function recipeSearchByIng(){
		console.log("버튼 클릭됨");
		let pTagList = $('.selected-ingredients').children('p');
		let ingNoArr = new Array();
		$.each(pTagList, function(index, item){
			ingNoArr[index] = $(item).data('ingredientno');
		});
		let forwardingData = {"ingNoArr" : ingNoArr};
		$.ajax({
			url: contextPath+"/recipe/recipeSerachByIng",
			dataType: "json",
			method : "GET",
			data: forwardingData,
			success : data =>{
			
				console.log(data);
				
				RList = data.recipeList;
				/* 검색된 영상 리스트  교체작업*/
				$("div.Ylist").empty();
				$.each(RList, function(index, item){
					let eachRecipe = '<div class="col-xs-6 col-sm-3 placeholder chef_list">' +
									'<a href="'+contextPath+'/recipe/recipe-details?recipeNo='+item.recipeNo+'"><img src="https://img.youtube.com/vi/'+item.videoLink+'/mqdefault.jpg" alt="" class="chef-Thumbnail">'+
									'<div class="forTitle"><p class="chef-Thumbnail-title">'+item.videoTitle+'</p><p><small>(포함된 재료:'+item.includeNo+'개)</small></p></div></a>' +
									'<div class="row"> <div class="col-8">'+
									'<img src="'+item.chefProfile+'" class="" alt="" style="width: 40px; height: 40px; border-radius: 50%;"> <span class="chef-min-name">'+item.chefNick+'</span></div>' +						
									'<div class="col-4 chef-view-count"> <span><small> 조회수 :'+item.viewCount+'</span> </small></div>'+
									'</div> </div>';
					
					
					$("div.Ylist").append(eachRecipe);
				});
				
			},
			error : (x,s,e) =>{
				console.log(x,s,e);
			}
		});
		
		
	}; 
	