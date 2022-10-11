/* 주소 검색 */
function execPostCode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if (fullRoadAddr !== '') {
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

$(function () {

    var email_auth_cd = '';

    $('#check_mail').click(function () {

        if ($('#email_auth_key').val() != email_auth_cd) {
            alert("인증번호가 일치하지 않습니다.");
            return false;
        } else if ($('#email_auth_key').val() == '') {
            alert("이메일 인증번호를 작성하세요.");
            return false;
        } else if ($('#email_auth_key').val() == email_auth_cd) {
            alert("이메일 인증에 성공했습니다.");
            return true;
        }
        fn_join();
    });

    $(".email_auth_btn").click(function () {
        var email = $('#mb_email').val();

        if (email == '') {
            alert("이메일을 입력해주세요.");
            return false;
        }

        $.ajax({
            type: "GET",
            url: "/emailAuth",
            data: {"email": email},
            success: function (data) {
                alert("인증번호가 발송되었습니다.");
                email_auth_cd = data;
            },
            error: function (data) {
                alert("메일 발송에 실패했습니다.");
            }
        });
    });

});

/* 회원가입 유효성 체크 */
function registerCheck() {
    if ($.trim($('#mb_name').val()) == '') {
        alert("이름을 입력해주세요.");
        return false;
    }
    if ($.trim($('#mb_id').val()) == '') {
        alert("아이디를 입력해주세요.");
        return false;
    }
    if ($.trim($('#mb_pw').val()) == '') {
        alert("비밀번호를 입력해주세요.");
        return false;
    }
    if ($.trim($('#mb_nick').val()) == '') {
        alert("닉네임을 입력해주세요.");
        return false;
    }

    if ($.trim($('#mb_email').val()) == '') {
        alert("이메일을 입력해주세요.");
        return false;
    }
    if ($.trim($('#email_auth_key').val()) == '') {
        alert("이메일 인증번호를 입력해주세요.");
        return false;
    }
    if ($.trim($('#mb_addr').val()) == '') {
        alert("주소를 입력해주세요.");
        return false;
    }

    if (confirm("회원가입을 하시겠습니까?")) {
        alert("회원가입이 완료되었습니다. 감사합니다.");
        $("form").submit();
    }
}

/* 비밀번호 재차 확인 */
$(function () {

    $('#pw_check').blur(function () {
        if ($('#mb_pw').val() != $('#pw_check').val()) {
            if ($('#pw_check').val() != '') {
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

    if (mb_id.search(/\s/) != -1) {
        alert("아이디에는 공백이 들어갈 수 없습니다.");
    } else {
        if (mb_id.trim().length != 0) {
            console.log(mb_id.trim().length);
            $.ajax({
                async: true,
                type: 'POST',
                data: mb_id,
                url: "/idCheck",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function (count) {
                    if (count > 0) {
                        alert("해당 아이디는 이미 존재합니다.");
                        $("#submit").attr("disabled", "disabled");
                        window.location.reload();
                    } else {
                        alert("사용가능한 아이디입니다.");
                        $("#submit").removeAttr("disabled");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown + " " + textStatus);
                    alert("아이디를 입력해주세요.(error)");
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

    if (mb_nick.search(/\s/) != -1) {
        alert("닉네임에는 공백이 들어갈 수 없습니다.");
    } else {
        if (mb_nick.trim().length != 0) {
            console.log(mb_nick.trim().length);
            $.ajax({
                async: true,
                type: 'POST',
                data: mb_nick,
                url: "/nickCheck",
                dataType: "json",
                contentType: "application/json",
                success: function (count) {
                    if (count > 0) {
                        alert("해당 닉네임은 이미 존재합니다.");
                        window.location.reload();
                    } else {
                        alert("사용 가능한 닉네임입니다.");

                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown + " " + textStatus);
                    alert("닉네임을 입력해주세요."); //error 알림창이 뜨는 오류발생
                }
            });
        } else {
            alert("닉네임을 입력해주세요.");
        }
    }
}
