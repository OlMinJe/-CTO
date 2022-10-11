<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript" src="/js/includeHtml.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
	<link rel="stylesheet" type="text/css" href="/css/login/register.css">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!--js 파일 별도 연결 안됨(현 페이지에서 스크립트 옮기거나 수정하지 말 것)-->
	<script>
		/* 주소 검색 */
		function execPostCode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraRoadAddr !== ''){
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if(fullRoadAddr !== ''){
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					console.log(data.zonecode);
					console.log(fullRoadAddr);


					$("[name=addr1]").val(data.zonecode);
					$("[name=mb_addr]").val(fullRoadAddr);

					/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                    document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				}
			}).open();
		}

		$(function() {

			var email_auth_cd = '';

			$('#check_mail').click(function(){

				if($('#email_auth_key').val() != email_auth_cd){
					alert("인증번호가 일치하지 않습니다.");
					return false;
				} else if ($('#email_auth_key').val() == email_auth_cd){
					alert("이메일 인증에 성공했습니다.");
					return true;
				}

				fn_join();
			});

			$(".email_auth_btn").click(function(){
				var email = $('#mb_email').val();

				if(email == ''){
					alert("이메일을 입력해주세요.");
					return false;
				}

				$.ajax({
					type : "GET",
					url : "/emailAuth",
					data : {"email" : email},
					success: function(data){
						alert("인증번호가 발송되었습니다.");
						email_auth_cd = data;
					},
					error: function(data){
						alert("메일 발송에 실패했습니다.");
					}
				});
			});

		});

		/* 회원가입 유효성 체크 */
		function registerCheck() {
			if($.trim($('#mb_name').val()) == '') {
				alert("이름을 입력해주세요.");
				return false;
			}
			if($.trim($('#mb_id').val()) == '') {
				alert("아이디를 입력해주세요.");
				return false;
			}
			if($.trim($('#mb_pw').val()) == '') {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			if($.trim($('#mb_nick').val()) == '') {
				alert("닉네임을 입력해주세요.");
				return false;
			}

			if($.trim($('#mb_email').val()) == '') {
				alert("이메일을 입력해주세요.");
				return false;
			}
			if($.trim($('#email_auth_key').val()) == '') {
				alert("이메일 인증번호를 입력해주세요.");
				return false;
			}
			if($.trim($('#mb_addr').val()) == '') {
				alert("주소를 입력해주세요.");
				return false;
			}

			if(confirm("회원가입을 하시겠습니까?")){
				alert("회원가입이 완료되었습니다.");
				$("form").submit();
			}
		}

		/* 비밀번호 재차 확인 */
		$(function(){

			$('#pw_check').blur(function(){
				if($('#mb_pw').val() != $('#pw_check').val()){
					if($('#pw_check').val()!=''){
						alert("비밀번호가 일치하지 않습니다.");
						$('#pw_check').val('');
						$('#pw_check').focus();
					}
				}
			})
		});

		/* 아이디 중복 체크 : ajax 비동기처리 */
		function idCheck() {

			var mb_id = $("#mb_id").val();

			if(mb_id.search(/\s/) != -1) {
				alert("아이디에는 공백이 들어갈 수 없습니다.");
			} else {
				if(mb_id.trim().length != 0) {
					console.log(mb_id.trim().length);
					$.ajax({
						async : true,
						type : 'POST',
						data: mb_id,
						beforeSend: function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						url: "/idCheck",
						dataType: "json",
						contentType: "application/json; charset=UTF-8",
						success: function(count) {
							if(count > 0) {
								alert("해당 아이디는 이미 존재합니다.");
								$("#submit").attr("disabled", "disabled");
								window.location.reload();
							} else {
								alert("사용가능한 아이디입니다.");
								$("#submit").removeAttr("disabled");
							}
						},
						error: function(jqXHR, textStatus, errorThrown) {
							console.log(errorThrown + " " + textStatus);
							alert("아이디를 입력해주세요.");
						}
					});
				} else {
					alert("아이디를 입력해주세요.");
				}
			}
		}

		/* 닉네임 중복 체크 : ajax 비동기처리 */
		function nickCheck() {

			var mb_nick = $("#mb_nick").val();

			if(mb_nick.search(/\s/) != -1) {
				alert("닉네임에는 공백이 들어갈 수 없습니다.");
			} else {
				if(mb_nick.trim().length != 0) {
					console.log(mb_nick.trim().length);
					$.ajax({
						async : true,
						type : 'POST',
						data: mb_nick,
						beforeSend: function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						url: "/nickCheck",
						dataType: "json",
						contentType: "application/json; charset=UTF-8",
						success: function(count) {
							if(count > 0) {
								alert("해당 닉네임은 이미 존재합니다.");
								window.location.reload();
							} else {
								alert("사용가능한 닉네임입니다.");

							}
						},
						error: function(jqXHR, textStatus, errorThrown) {
							console.log(errorThrown + " " + textStatus);
							alert("닉네임을 입력해주세요.");
						}
					});
				} else {
					alert("닉네임을 입력해주세요.");
				}
			}
		}
	</script>
	<head>
	</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12">
	<div class="col-12 col-lg-10 register">
		<div class="title_01">회원가입</div>
		<div class="title_02">정보입력</div>
		<form action='<c:url value='/register'/>' method="post" enctype="multipart/form-data">
			<div class="col-12" style="margin-bottom: 50px;">
				<input type="file" class="col-12" name="file" id="mb_img" onchange="readURL(this);">
				<label class="input_file" for="mb_img">프로필 선택</label>
			</div>
			<ul class="col-12 col-sm-11 col-md-10 col-lg-9">
				<li>
					<div class="col-3 sub_title">닉네임</div>
					<input type="text" name="mb_nick" id="mb_nick" placeholder="닉네임">
					<button type="button" class="box_eft_02" onclick="nickCheck()">중복확인</button> <!--08.23.error!-->
				</li>
				<li>
					<div class="col-3 sub_title">아이디</div>
					<input type="text" name="mb_id" id="mb_id" placeholder="아이디">
					<button type="button" class="box_eft_02" onclick="idCheck()">중복확인</button>
				</li> <!--08.23.error!-->
				<li>
					<div class="col-3 sub_title">비밀번호</div>
					<input type="password" name="mb_pw" id="mb_pw" placeholder="비밀번호">
				</li>
				<li class="password">
					<div class="col-3 sub_title">비밀번호 확인</div>
					<input type="password" placeholder="비밀번호 확인" id="pw_check">
				</li>
				<li>
					<div class="col-3 sub_title">이름</div>
					<input type="text" name="mb_name" id="mb_name" placeholder="이름">
				</li>
				<li class="email_auth">
					<div class="col-3 sub_title">이메일</div>
					<div class="col-9" style="display: flex; flex-direction: column;">
						<section>
							<input type="text" placeholder="이메일" name="mb_email" id="mb_email" class="email">
							<button type="button" id="email_auth_btn" class="box_eft_02 email_auth_btn">인증번호 받기</button>
						</section>
						<section>
							<input type="text" placeholder="인증번호" id="email_auth_key">
							<button type="button" class="box_eft_02" id="check_mail">인증번호 확인</button>
						</section>
					</div>
				</li>
				<li class="address">
					<div class="col-3 sub_title">주소</div>
					<section>
						<input placeholder="우편번호" name="addr1" class="box_eft_00" id="addr1" type="text"
							   readonly="readonly">
						<button type="button" class="box_eft_02" onclick="execPostCode();">우편번호 찾기</button>
						<br>
						<input placeholder="도로명 주소" name="mb_addr" id="mb_addr" type="text" readonly="readonly"/><br>
						<input placeholder="상세주소" name="addr3" id="addr3" type="text"/><br>
					</section>
				</li>
				<li class="gender">
					<div class="col-3 sub_title">성별</div>
					<input type="radio" name="mb_sex" class="box_eft_01" id="select01" value="남성" checked><label
						for="select01" style="margin-right: 10px;">남성</label>
					<input type="radio" name="mb_sex" class="box_eft_01" id="select02" value="여성"><label for="select02">여성</label>
				</li>
				<li class="doctor">
					<div class="col-4 col-md-6 sub_title">의사 혹은 상담가 등의 전문가 인가요?</div>
					<div>
						<input type="radio" name="mb_doctor" class="box_eft_01" id="select03" value="일반인"
							   checked="checked"><label for="select03">아니오</label>
						<input type="radio" name="mb_doctor" class="box_eft_01" id="select04" value="전문가"><label
							for="select04">네</label>
					</div>
				</li>
			</ul>
		</form>
		<div class="col-12" style="text-align: center;">
			<button type="button" class="col-3 box_eft_02" id="submit" disabled="disabled" onclick="registerCheck()">
				회원가입
			</button>
		</div>
	</div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>


<%--
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

	<script type="text/javascript" src="/js/includeHtml.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
	<link rel="stylesheet" type="text/css" href="/css/login/register.css">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/register.js"></script>
	<title>회원가입</title>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
&lt;%&ndash;<div class="col-12">
	<div class="col-12 col-lg-10 register">
		<div class="title_01">회원가입</div>
		<div class="title_02">정보입력</div>
		<form action='<c:url value='/register'/>' method="post" enctype="multipart/form-data">
			<div class="col-12" style="margin-bottom: 50px;">
				<input type="file" class="col-12" name="file" id="mb_img">
				<label class="input_file" for="mb_img">프로필 선택</label>
			</div>
			<ul class="col-12 col-sm-11 col-md-10 col-lg-9">
				<li>
					<div class="col-3 sub_title">닉네임</div>
					<input type="text" name="mb_nick" id="mb_nick" placeholder="닉네임">
					<button type="button" class="box_eft_02" onclick="nickCheck()">중복확인</button> <!--10.01.error!--> &lt;%&ndash;파일 구조 문제 의심 중&ndash;%&gt;
				</li>
				<li>
					<div class="col-3 sub_title">아이디</div>
					<input type="text" name="mb_id" id="mb_id" placeholder="아이디">
					<button type="button" class="box_eft_02" onclick="idCheck()">중복확인</button> <!--10.01.error!-->
				</li>
				&lt;%&ndash;<div>아이디 <input type="text" name="mb_id" id="mb_id" placeholder="아이디를 입력하세요.">
					<button type="button" onclick="idCheck()">아이디 중복확인</button></div><br>&ndash;%&gt;
				<li>
					<div class="col-3 sub_title">비밀번호</div>
					<input type="password" name="mb_pw" id="mb_pw" placeholder="비밀번호">
				</li>
				<li class="password">
					<div class="col-3 sub_title">비밀번호 확인</div>
					<input type="password" placeholder="비밀번호 확인" id="pw_check">
				</li>
				<li>
					<div class="col-3 sub_title">이름</div>
					<input type="text" name="mb_name" id="mb_name" placeholder="이름">
				</li>
				<li class="email_auth">
					<div class="col-3 sub_title">이메일</div>
					<div class="col-9" style="display: flex; flex-direction: column;">
						<section>
							<input type="text" placeholder="이메일" name="mb_email" id="mb_email" class="email">
							<button type="button" id="email_auth_btn" class="box_eft_02 email_auth_btn">인증번호 받기</button>
						</section>
						<section>
							<input type="text" placeholder="인증번호" id="email_auth_key">
							<button type="button" class="box_eft_02" id="check_mail">인증번호 확인</button>
						</section>
					</div>
				</li>
				<li class="address">
					<div class="col-3 sub_title">주소</div>
					<section>
						<input placeholder="우편번호" name="addr1" class="box_eft_00" id="addr1" type="text"
							   readonly="readonly">
						<button type="button" class="box_eft_02" onclick="execPostCode();">우편번호 찾기</button>
						<br>
						<input placeholder="도로명 주소" name="mb_addr" id="mb_addr" type="text" readonly="readonly"/><br>
						<input placeholder="상세주소" name="addr3" id="addr3" type="text"/><br>
					</section>
				</li>
				<li class="gender">
					<div class="col-3 sub_title">성별</div>
					<input type="radio" name="mb_sex" class="box_eft_01" id="select01" value="남성" checked><label
						for="select01" style="margin-right: 10px;">남성</label>
					<input type="radio" name="mb_sex" class="box_eft_01" id="select02" value="여성"><label for="select02">여성</label>
				</li>
				<li class="doctor">
					<div class="col-4 col-md-6 sub_title">의사 혹은 상담가 등의 전문가 인가요?</div>
					<div>
						<input type="radio" name="mb_doctor" class="box_eft_01" id="select03" value="일반인"
							   checked="checked"><label for="select03">아니오</label>
						<input type="radio" name="mb_doctor" class="box_eft_01" id="select04" value="전문가"><label
							for="select04">네</label>
					</div>
				</li>
			</ul>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		<div class="col-12" style="text-align: center;">
			<button type="button" class="col-3 box_eft_02" id="submit" disabled="disabled" onclick="registerCheck()">
				회원가입
			</button>
		</div>

		<!--<button type="button" class="box_eft_02" onclick="location.href='/'">메인화면으로</button>-->
	</div>
</div>&ndash;%&gt;
<body>
<h2>[회원가입]</h2>
<form action='<c:url value='/register'/>' method="post" enctype="multipart/form-data">
	<div>프로필 사진 선택 <input type="file" name="file" id="mb_img"></div>
	<div>이름 <input type="text" name="mb_name" id="mb_name" placeholder="이름을 입력하세요."></div><br>
	<div>아이디 <input type="text" name="mb_id" id="mb_id" placeholder="아이디를 입력하세요.">
		<button type="button" onclick="idCheck()">아이디 중복확인</button></div><br>
	<div>비밀번호 <input type="password" name="mb_pw" id="mb_pw" placeholder="비밀번호를 입력하세요."></div><br>
	<div>비밀번호 확인 <input type="password" placeholder="비밀번호 확인" id="pw_check"></div><br>


	<div>닉네임 <input type="text" name="mb_nick" id="mb_nick" placeholder="닉네임을 입력하세요."></div><br>

	<div class="email_auth">이메일
		<input type="text" placeholder="이메일" name="mb_email" id="mb_email" class="email">
		<button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
	</div>
	<input type="text" placeholder="인증번호 입력" id="email_auth_key">
	<button type="button" id="check_mail" > 확인</button>
	</div>

	<div>
		<p>주소</p>
		<input style="width: 20%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
		<button type="button" onclick="execPostCode();">우편번호 찾기</button><br>
		<input style="top: 5px;" placeholder="도로명 주소" name="mb_addr" id="mb_addr" type="text" readonly="readonly" /><br>
		<input placeholder="상세주소" name="addr3" id="addr3" type="text"  /><br>
	</div><br>

	<div>
		당신의 성별을 알려주세요.
		<input type="radio" name="mb_sex" value="남성">남성
		<input type="radio" name="mb_sex" value="여성">여성
	</div><br>
	<div>
		의사 혹은 상담가 등의 전문가 인가요?
		<input type="radio" name="mb_doctor" value="일반인" checked="checked">아니오
		<input type="radio" name="mb_doctor" value="전문가">예
	</div>


	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<button type="button" id="submit" disabled="disabled" onclick="registerCheck()">가입완료</button>
<button type="button" onclick="location.href='/'">처음으로</button>
</body>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>
--%>



<%--
<body>
<h2>[회원가입]</h2>
<form action='<c:url value='/register'/>' method="post" enctype="multipart/form-data">
	<div>프로필 사진선택<input type="file" name="file" id="mb_img"></div>
	<div>이름 <input type="text" name="mb_name" id="mb_name" placeholder="이름을 입력하세요."></div><br>
	<div>아이디 <input type="text" name="mb_id" id="mb_id" placeholder="아이디를 입력하세요.">
		<button type="button" onclick="idCheck()">아이디 중복확인</button></div><br>
	<div>비밀번호 <input type="password" name="mb_pw" id="mb_pw" placeholder="비밀번호를 입력하세요."><br>
	<input type="password" placeholder="비밀번호  확인" id="password_ck"></div>

	<div>닉네임 <input type="text" name="mb_nick" id="mb_nick" placeholder="닉네임을 입력하세요."></div>
	<button type="button" onclick="nickCheck()">닉네임 중복확인</button></div><br>
	<br>
	<!-- <div>이메일 <input type="text" name="mb_email" id="mb_email" placeholder="이메일을 입력하세요."></div><br> -->

	<div class="email_auth">이메일
		<input type="text" placeholder="이메일" name="mb_email" id="mb_email" class="email">
		<button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
	</div>
	<input type="text" placeholder="인증번호 입력" id="email_auth_key">
	<button type="button" id="check_mail" > 확인</button>
	</div>
	<div class="form-group"> 주소
		<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
		<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
	</div>
	<div class="form-group">
		<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="mb_addr" id="mb_addr" type="text" readonly="readonly" />
	</div>
	<div class="form-group">
		<input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
	</div>
	<div>
		당신의 성별을 알려주세요.
		<input type="radio" name="mb_sex" value="남성">남성
		<input type="radio" name="mb_sex" value="여성">여성
	</div><br>
	<div>
		의사 혹은 상담가 등의 전문가 인가요?
		<input type="radio" name="mb_doctor" value="일반인" checked="checked">아니오
		<input type="radio" name="mb_doctor" value="전문가">예
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<button type="button" id="submit" disabled="disabled" onclick="registerCheck()">가입완료</button>
<button type="button" onclick="location.href='/'">처음으로</button>
</body>--%>




