<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩설정 안해주면 한글 깨짐  -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include><!--  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/resources/css/mall_slider.css" />
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
  <!-- 레시피 영상  Section -->
    <section class="classes-details-section spad overflow-hidden">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="recipe-details">
                        <div class="classes-preview">
                            <h2>분식집st 떡 볶 이</h2>
                            <div id="youtubevideo">
                                <div class="recipe-video" id="testPTag"></div>
                            </div>
                            <div class="hashtag" id="hashtag">
                                <br>
                                <a href="#">#해시태그</a>
                                <a href="#">#해시태그</a>
                                <a href="#">#해시태그</a>
                                <a href="#">#해시태그</a>
                                <br>
                            </div>
                        </div>
                        <div class="row">
                            <!-- 셰프 정보 -->
                            <div class="col-lg-5">
                                <table>
                                    <th>
                                        <img src="/img/classes/author/3.jpg" class="chef-img" alt="">
                                    </th>
                                    <td>
                                        <h3 class="chef-name"><a href="">백종원</a></h3>
                                        <div class="cd-meta">
                                            <p><i class="material-icons">people_outline</i>조회수 | 250</p>
                                        </div>
                                    </td>
                                </table>
                            </div>
                            <div class="col-lg-6 text-left text-md-right">
                                <i class="material-icons">favorite_border</i>
                                <div class="cd-price">후기</div>
                                <div class="cd-price">문의</div>
                                <div class="cd-price">스크랩</div>
                            </div>
                        </div>
                        <div class="row">
                            <h3>재료</h3>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                        <!-- 셰프 설명글 -->
                        <p>대법관은 대법원장의 제청으로 국회의 동의를 얻어 대통령이 임명한다. 대통령은 제3항과 제4항의 사유를 지체없이 공포하여야 한다. 헌법개정안은 국회가 의결한 후 30일 이내에 국민투표에 붙여 국회의원선거권자 과반수의 투표와 투표자 과반수의 찬성을 얻어야 한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 새로운
                            회계연도가 개시될 때까지 예산안이 의결되지 못한 때에는 정부는 국회에서 예산안이 의결될 때까지 다음의 목적을 위한 경비는 전년도 예산에 준하여 집행할 수 있다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 위원은 정당에 가입하거나 정치에 관여할 수 없다.</p>
                        <!-- 재료 판매 -->
                        <div class="row">
                            <div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
                                <button class="goods-add-product-move goods-add-product-move-left __slide-go-left">왼쪽으로 슬라이드 이동</button>
                                <button class="goods-add-product-move goods-add-product-move-right __slide-go-right">오른쪽으로 슬라이드 이동</button>
                                <div class="goods-add-product-list-wrapper" style="height:320px">
                                    <ul class="goods-add-product-list __slide-mover">
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=4704" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1478079784170m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[자연누리] 훈제 오리</p>
                                                    <p class="goods-add-product-item-price">13,500원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=30118" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1540433763409m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 동물복지 닭 다리 400g(냉장)</p>
                                                    <p class="goods-add-product-item-price">5,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=30114" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1541647184791m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 동물복지 닭 가슴살 400g(냉장)</p>
                                                    <p class="goods-add-product-item-price">6,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=42329" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1571294440689m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[육심당] 닭다리파 꼬치</p>
                                                    <p class="goods-add-product-item-price">6,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=26847" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1530769558900m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[Better me] 냉동 닭가슴살 4종</p>
                                                    <p class="goods-add-product-item-price">1,700원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=5279" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1482384471867m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[우리땅오리] 무항생제 오리 가슴살 슬라이스</p>
                                                    <p class="goods-add-product-item-price">6,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=38114" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1569822327107m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[수지스] 그릴드 닭가슴살 550g</p>
                                                    <p class="goods-add-product-item-price">8,800원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=4216" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1472725065604m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[백년백계] 닭 윗날개 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">3,800원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=6971" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1498700267578m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[백년백계] 생닭 800g(냉장)</p>
                                                    <p class="goods-add-product-item-price">5,500원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=6940" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1498628103118m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[올계] 유기농 생닭 2종 (냉동)</p>
                                                    <p class="goods-add-product-item-price">12,500원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=48564" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1581304258574m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[체리부로] 골든치킨 봉</p>
                                                    <p class="goods-add-product-item-price">7,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=48563" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/158131001286m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[체리부로] 골든치킨 윙</p>
                                                    <p class="goods-add-product-item-price">7,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=10134" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/151116121751m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[올계] 유기농 닭꼬치 2종 (냉동)</p>
                                                    <p class="goods-add-product-item-price">8,500원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=38120" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1569822981465m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[수지스] 허브 닭가슴살 550g</p>
                                                    <p class="goods-add-product-item-price">9,600원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=38117" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1569822709182m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[수지스] 페퍼콘 닭가슴살 550g</p>
                                                    <p class="goods-add-product-item-price">9,600원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=43156" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1575865392127m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[자연실록] 옛날 통닭 통다리</p>
                                                    <p class="goods-add-product-item-price">4,800원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=4956" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1480590914250m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[백년백계] 닭 다리살(정육) 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">5,200원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=36430" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1557711152475m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 동물복지 IFF 닭고기 2종 (냉동)</p>
                                                    <p class="goods-add-product-item-price">8,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=26170" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1529998526237m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[코켄] 무항생제 닭고기 다짐육 2종 (냉동)</p>
                                                    <p class="goods-add-product-item-price">7,000원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=34584" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1550214814989m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[코켄] 무항생제 IQF 닭고기 3종 (냉동)</p>
                                                    <p class="goods-add-product-item-price">10,800원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=4215" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1472778568872m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[백년백계] 닭 볶음용 800g(냉장)</p>
                                                    <p class="goods-add-product-item-price">5,500원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=43155" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1575860376800m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[자연실록] 옛날 통닭</p>
                                                    <p class="goods-add-product-item-price">9,800원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=3364" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1470807151142m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[올계] 유기농 다짐 계육 (냉동)</p>
                                                    <p class="goods-add-product-item-price">11,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=47887" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1579066694298m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[하림] 버팔로 치킨 봉 스파이시</p>
                                                    <p class="goods-add-product-item-price">11,000원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=41911" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1569824181600m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[수지스] 닭가슴살 3종 (냉장)</p>
                                                    <p class="goods-add-product-item-price">1,800원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=30115" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1541647222536m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 동물복지 닭 안심살 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">6,200원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=1224" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1492750867470m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[파워닭] 닭가슴살 5종 (냉동)</p>
                                                    <p class="goods-add-product-item-price">1,700원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=4214" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1472727892379m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[백년백계] 닭 안심살 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">4,100원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=6227" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1494922817267m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[Better me] 오리지널 닭가슴살 (냉장)</p>
                                                    <p class="goods-add-product-item-price">9,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=48566" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1583839295610m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[우리땅오리] 무항생제 훈제오리 500g(냉동)</p>
                                                    <p class="goods-add-product-item-price">12,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=30117" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1540459754800m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 동물복지 닭 윗날개 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">5,200원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=42277" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/157076953059m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[델리치오] 매콤한 닭꼬치 구이</p>
                                                    <p class="goods-add-product-item-price">8,500원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=44534" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1579063624552m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 닭가슴살 큐브 스테이크 500g</p>
                                                    <p class="goods-add-product-item-price">7,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=42385" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1570776356708m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[델리치오] 파닭 꼬치구이</p>
                                                    <p class="goods-add-product-item-price">8,500원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=42327" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1571291159325m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[육심당] 목살 파 꼬치</p>
                                                    <p class="goods-add-product-item-price">9,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=25542" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/152835430372m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[우리땅오리] 무항생제 오리 다리살 슬라이스</p>
                                                    <p class="goods-add-product-item-price">6,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=30112" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1541645413323m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 동물복지 생 닭 800g(냉장)</p>
                                                    <p class="goods-add-product-item-price">7,100원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=45242" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1576586026700m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[올계] 유기농 치킨 커틀렛 300g</p>
                                                    <p class="goods-add-product-item-price">14,500원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=30113" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1541645010176m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 동물복지 닭 볶음용 800g(냉장)</p>
                                                    <p class="goods-add-product-item-price">6,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=3341" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1470807165569m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[올계] 유기농 닭고기 부분육 4종 (냉동)</p>
                                                    <p class="goods-add-product-item-price">8,200원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=4217" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1472721702859m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[백년백계] 닭 아랫날개 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">3,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=30119" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1540446689360m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 동물복지 닭 다리살 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">5,900원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=36869" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1558331449996m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[다향] 우리땅 토종닭 백숙용 1.05kg(냉장)</p>
                                                    <p class="goods-add-product-item-price">9,000원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=30116" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1541645278484m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[그리너스] 동물복지 닭 아랫날개 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">5,200원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=4957" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1480590552835m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[백년백계] 닭 가슴살 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">4,200원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=36870" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/155833226034m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[다향] 우리땅 토종닭 볶음탕용 1kg(냉장)</p>
                                                    <p class="goods-add-product-item-price">8,300원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=4218" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1472726096574m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[백년백계] 닭 다리 300g(냉장)</p>
                                                    <p class="goods-add-product-item-price">3,600원</p>
                                                </div>

                                            </div>
                                        </li>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=48565" target="_blank"><img src="//img-cf.kurly.com/shop/data/goods/1581310719658m0.jpg" class="goods-add-product-item-image" onerror="this.src='/shop/data/skin/designgj/img/common/noimg_100.gif'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name">[체리부로] 골든치킨 텐더스틱</p>
                                                    <p class="goods-add-product-item-price">7,400원</p>
                                                </div>

                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 댓글 -->
                    <h3 class="comment-title">댓글</h3>
                    <ul class="comment-list">
                        <li>
                            <img src="/img/classes/author/3.jpg" class="comment-pic" alt="">
                            <div class="comment-text">
                                <h3>Beverly Price </h3>
                                <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                                <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                                <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                            </div>
                            <ul class="comment-sub-list">
                                <li>
                                    <img src="/img/classes/author/2.jpg" class="comment-pic" alt="">
                                    <div class="comment-text">
                                        <h3>Jacqueline Watkins</h3>
                                        <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                                        <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                                        <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <img src="/img/classes/author/1.jpg" class="comment-pic" alt="">
                            <div class="comment-text">
                                <h3>Lori Gonzales</h3>
                                <div class="comment-date"><i class="material-icons">alarm_on</i>June 28, 2019 at 3:18 pm</div>
                                <p>Just practicing yoga for more than 3 months, I dropped from 64 kg to 58 kg. I have used many weight loss measures such as medication, diet, but the effects are slow and low. </p>
                                <a href="#" class="reply"><i class="material-icons">reply</i>Reply</a>
                            </div>
                        </li>
                    </ul>
                    <h3 class="comment-title">Leave a Reply</h3>
                    <form class="singup-form">
                        <div class="row">
                            <div class="col-md-6">
                                <input type="text" placeholder="First Name">
                            </div>
                            <div class="col-md-6">
                                <input type="text" placeholder="Last Name">
                            </div>
                            <div class="col-md-6">
                                <input type="text" placeholder="Your Email">
                            </div>
                            <div class="col-md-6">
                                <input type="text" placeholder="Phone Number">
                            </div>
                            <div class="col-md-12">
                                <textarea placeholder="Message"></textarea>
                                <a href="#" class="site-btn sb-gradient">Send message</a>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-lg-5 col-md-6 col-sm-9 sidebar">
                    <!-- 타임 스탬프 start -->
                    <div class="sb-widget">
                        <h2 class="sb-title">요리방법 </h2>
                        <div class="classes-info">
                            <p class="yt_time_stamp" onclick="hreflink(60);"><span>1</span>&nbsp;대파는 어슷 썰거나 반으로 갈라 길게 썰어 준비한다.</p>
                            <p class="yt_time_stamp" onclick="hreflink(120);"><span>2</span> &nbsp;양배추, 어묵은 먹기 좋은 크기로 썰어 준비한다.</p>
                            <p class="yt_time_stamp" onclick="hreflink(120);"><span>3</span>&nbsp;냄비에 물, 진간장, 황설탕, 고추장, 굵은고춧가루, 고운고춧가루, 대파, 양배추를 넣어 끓인다.</p>
                            <p class="yt_time_stamp" onclick="hreflink(120);"><span>4</span>&nbsp;떡볶이떡은 흐르는 물에 가볍게 세척한다.</p>
                            <p class="yt_time_stamp" onclick="hreflink(120);"><span>5</span>&nbsp;육수가 끓으면 삶은달걀, 떡을 넣고 함께 끓여준다.</p>
                            <p class="yt_time_stamp" onclick="hreflink(120);"><span>6</span>&nbsp;기호에 맞게 MSG를 넣는다.</p>
                            <p class="yt_time_stamp" onclick="hreflink(120);"><span>7</span>&nbsp;떡을 넣고 육수가 끓어오르면 어묵을 넣어준다.</p>
                            <p class="yt_time_stamp" onclick="hreflink(120);"><span>8</span>&nbsp;양념장이 걸쭉하게 졸아들 때까지 끓여 완성한다.</p>
                        </div>
                    </div>
                    <!-- 타임 스탬프 end -->
                    <div class="sb-widget">
            	        <h2 class="sb-title">연관영상</h2>
                        <div class="another-video-widget">
                            <table>
                                <tr>
                                    <!-- 유튜브 썸네일 추출 방식-->
                                   <th><a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="200" height="100"></a></th>
                                    <td>
                                        <li>불맛나는 고기짬뽕라면</li>
                                        <li>백종원</li>
                                        <li>추천수 500</li>
                                    </td>
                                </tr>
                                <tr>
                                    <th><a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="200" height="100"></a></th>
                                    <td>
                                        <li>불맛나는 고기짬뽕라면</li>
                                        <li>백종원</li>
                                        <li>추천수 500</li>
                                    </td>
                                </tr>
                                <tr>
                                    <th><a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="200" height="100"></a></th>
                                    <td>
                                        <li>불맛나는 고기짬뽕라면</li>
                                        <li>백종원</li>
                                        <li>추천수 500</li>
                                    </td>
                                </tr>
                                <tr>
                                    <th><a href=""><img src="https://img.youtube.com/vi/2sUjx8PE_vg/mqdefault.jpg" alt="" width="200" height="100"></a></th>
                                    <td>
                                        <li>불맛나는 고기짬뽕라면</li>
                                        <li>백종원</li>
                                        <li>추천수 500</li>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Classes Details Section end -->


		

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>