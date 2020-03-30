
    <!-- 나눔 고딕 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">

    <!-- Main Stylesheets -->
    <!-- 추가사항은 insert css 주석 밑에 있음 -->
    <link rel="stylesheet" href="css/class_insert.css" />

    <!-- 달력  -->
    <link href="css/datepicker.min.css" rel="stylesheet" type="text/css">

    <script src="js/datepicker.kr.js>"></script>

    <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
    <script src="js/class-insert.js"></script>


    <section class="event-details-section spad overflow-hidden">
        <div class="container">
            <form action="">
                <div class="row">
                    <div class="col-lg-7">
                        <!-- 이미지 등록 -->
                        <div class="oneday_class_img">
                            <div id="uploadbtn" onclick="upload(this)">Upload Files</div>
                            <input type='file' id="imgInput" hidden/>
                            <img src="#" alt="" id="image_section">
                        </div>
                        
                        <!-- 셰프 정보 -->
                        <div class="sb-widget">
                            <h2 class="sb-title">셰프소개</h2>
                            <div class="about-instructor-widget">
                                <img src="img/classes/author/1.jpg" alt="">
                                <h6>Yoga Trainer</h6>
                                <p>Yoga & Therapy Certificate of Uttarakhand University</p>
                            </div>
                        </div>

                        <!-- ck에디터 -->
                        <div class="event-details w-100">
                            <textarea name="editor1"></textarea>
                        </div>
                    </div>

                    <!-- 사이드부분 -->
                    <div class="col-lg-5 col-md-5 col-sm-8 sidebar">
                        <div class="sb-widget">
                            <div class="classes-info">
                                <!-- 클래스 명 입력란 -->
                                <span class="input input--yoshiko">
                                    <!-- 클래스명 input -->
                                    <input class="input__field input__field--yoshiko" type="text" id="input-class-name" />
                                    <!-- 클래스명 라벨 -->
                                    <label class="input__label input__label--yoshiko" for="input-class-name">
                                        <span class="input__label-content input__label-content--yoshiko" data-content="클래스명">클래스명</span>
                                    </label>
                                </span>

                                <!-- 셰프 채널명 입력란 -->
                                <span class="input input--yoshiko">
                                    <!-- 셰프 채널명 input(readonly) -->
                                    <input class="input__field input__field--yoshiko" type="text" id="input-class-channel" value="셰프채널명" readonly/>
                                    <!-- 셰프 채널명 라벨 -->
                                    <label class="input__label input__label--yoshiko" for="input-class-channel">
                                        <span class="input__label-content input__label-content--yoshiko" data-content="채널명">채널명</span>
                                    </label>
                                </span>
                                <!-- 클래스 비용 입력란 -->
                                <span class="input input--yoshiko">
                                    <!-- 클래스 비용 input -->
                                    <input class="input__field input__field--yoshiko" type="text" id="input-class-cost" />
                                    <!-- 클래스 비용 라벨 -->
                                    <label class="input__label input__label--yoshiko" for="input-class-cost">
                                        <span class="input__label-content input__label-content--yoshiko" data-content="클래스 비용">클래스 비용</span>
                                    </label>
                                </span>
                                
                                <!-- 클래스 소요시간 입력란 -->
                                <div class="row m-auto">
                                <div class="col-4 px-0 py-3 input">
                                    <h5 class="insert-title">클래스 소요시간</h5>
                                </div>
                                <!-- 시간 입력란 -->
                                    <span class="input input--yoshiko col px-1">
                                        <!-- 시간 input -->
                                        <input class="input__field input__field--yoshiko" type="number" id="input-class-time-h" min="0" autocomplete="off"/>
                                        <!-- 시간 라벨 -->
                                        <label class="input__label input__label--yoshiko" for="input-class-time-h">
                                            <span class="input__label-content input__label-content--yoshiko" data-content="시간">시간</span>
                                        </label>
                                    </span>
                                    <!-- 분 입력란 -->
                                    <span class="input input--yoshiko col pr-0">
                                        <!-- 분 input -->
                                        <input class="input__field input__field--yoshiko" type="number" id="input-class-time-m" min="0" max="59" autocomplete="off"/>
                                        <!-- 분 라벨 -->
                                        <label class="input__label input__label--yoshiko" for="input-class-time-m">
                                            <span class="input__label-content input__label-content--yoshiko" data-content="분">분</span>
                                        </label>
                                    </span>
                                </div>
                                <!-- 클래스 소요시간 입력란 end -->

                                <div class="row">
                                <!-- 정원 인원 입력란 -->
                                <span class="input input--yoshiko col">
                                    <!-- 정원 인원 input -->
                                    <input class="input__field input__field--yoshiko" type="number" id="input-class-max" min="0" max="100" autocomplete="off"/>
                                    <!-- 정원 인원 라벨 -->
                                    <label class="input__label input__label--yoshiko" for="input-class-max">
                                        <span class="input__label-content input__label-content--yoshiko" data-content="정원 인원">정원 인원</span>
                                    </label>
                                </span>
                                <!-- 최소 인원 입력란 -->
                                <span class="input input--yoshiko col">
                                    <!-- 최소 인원 input -->
                                    <input class="input__field input__field--yoshiko" type="number" id="input-class-min" min="0" max="100" autocomplete="off"/>
                                    <!-- 최소 인원 라벨 -->
                                        <label class="input__label input__label--yoshiko" for="input-class-min">
                                            <span class="input__label-content input__label-content--yoshiko" data-content="최소 인원">최소 인원</span>
                                        </label>
                                    </span>
                                </div>
                                <!-- 클래스 주소 입력란 -->
                                <span class="input input--yoshiko">
                                    <!-- 클래스 주소 input -->
                                    <input class="input__field input__field--yoshiko" type="text" id="input-class-adress" />
                                    <!-- 클래스 주소 라벨 -->
                                    <label class="input__label input__label--yoshiko" for="input-class-adress">
                                        <span class="input__label-content input__label-content--yoshiko" data-content="클래스 주소">클래스 주소</span>
                                    </label>
                                </span>

                                <h5 class="insert-title">클래스 날짜</h5>
                                <!-- 클래스 날짜 입력란 -->
                                <div class="row m-auto">
                                    <span class="input input--yoshiko col-9 p-0">
                                        <!-- 클래스 날짜 input -->
                                        <input class="input__field input__field--yoshiko datepicker-here" type="text" id="input-date" data-language='kr' data-timepicker="true" autocomplete="off"/>
                                    </span>

                                    <div class="col py-1 pr-0 input">
                                        <!-- 클래스 날ㅉ 버튼 -->
                                        <button class="site-btn sb-gradient px-3" style="min-width: 100%;" type="button" onclick="addClassTime();">추가</button>
                                    </div>
                                </div>
                                <!-- 클래스 날짜 리스트 div -->
                                <div id="input-date-list"></div>
                            </div>
                        </div>
                        <div class="sb-widget">
                            <!-- 클래스 등록 버튼 -->
                            <button class="site-btn sb-gradient reservation_class"><a href="class_reservation.html">등록하기</a></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Event Details Section end -->


    <script src="js/datepicker.min.js"></script>
    <!-- Include English language -->
    <script src="js/datepicker.kr.js"></script>
    <script src="js/classie.js"></script>
	<script>
		(function() {
			// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
			if (!String.prototype.trim) {
				(function() {
					// Make sure we trim BOM and NBSP
					var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
					String.prototype.trim = function() {
						return this.replace(rtrim, '');
					};
				})();
			}
			[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
				// in case the input is already filled..
				if( inputEl.value.trim() !== '' ) {
					classie.add( inputEl.parentNode, 'input--filled' );
				}
				// events:
				inputEl.addEventListener( 'focus', onInputFocus );
				inputEl.addEventListener( 'blur', onInputBlur );
			} );
			function onInputFocus( ev ) {
				classie.add( ev.target.parentNode, 'input--filled' );
			}
			function onInputBlur( ev ) {
				if( ev.target.value.trim() === '' ) {
					classie.remove( ev.target.parentNode, 'input--filled' );
				}
			}
		})();
	</script>

