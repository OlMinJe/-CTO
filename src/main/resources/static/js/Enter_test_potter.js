var Enter_tripnum = 1; // 문제 번호 변수
var Enter_trip_q = {
    1: {
        "title": "Q1. <br/><br/>같은 기숙사 친구인 찰스가 곤경에 빠졌습니다. 당신은 어떻게 행동하실 건가요?",
        "type": "EI",
        "Enter_trip_test_A": "원인 제거를 위해 행동한다.",
        "Enter_trip_test_B": "곤경에 빠지게된 이유를 물어보고 같이 해결한다.",
        "EntertripQnum": "1/12"
    },
    2: {
        "title": "Q2. <br/><br/>당신이 좋아하는 색상은 무엇인가요?",
        "type": "EI",
        "Enter_trip_test_A": "초록색 또는 파란색",
        "Enter_trip_test_B": "붉은색 또는 황금색",
        "EntertripQnum": "2/12"
    },
    3: {
        "title": "Q3. <br/><br/>당신이 가장 자신있어 하는 것은?",
        "type": "EI",
        "Enter_trip_test_A": "용기와 친절",
        "Enter_trip_test_B": "야망과 창의성",
        "EntertripQnum": "3/12"
    },
    4: {
        "title": "Q4. <br/><br/>좋아하는 요소를 고르시오.",
        "type": "SN",
        "Enter_trip_test_A": "불 또는 공기",
        "Enter_trip_test_B": "물 또는 흙",
        "EntertripQnum": "4/12"
    },
    5: {
        "title": "Q5. <br/><br/>당신을 유혹하는 친구는 누구인가요?",
        "type": "SN",
        "Enter_trip_test_A": "나를 유혹할 수 있는 사람은 오로지 내 자신인걸",
        "Enter_trip_test_B": "시리우스 블랙",
        "EntertripQnum": "5/12"
    },
    6: {
        "title": "Q6. <br/><br/>듣고 싶은 수업은 무엇인가요?",
        "type": "SN",
        "Enter_trip_test_A": "마법약 수업",
        "Enter_trip_test_B": "점술 수업",
        "EntertripQnum": "6/12"
    },
    7: {
        "title": "Q7. <br/><br/>반려 동물이 당신에게 날아왔습니다!!<br/>이때 당신의 반려 동물의 종류는 무엇인가요?",
        "type": "TF",
        "Enter_trip_test_A": "부엉~부엉~부엉이~노래를 한다~",
        "Enter_trip_test_B": "벰! (뱀의 언어를 사용할 수 있는 해리포터님 존경스럽습니다.)",
        "EntertripQnum": "7/12"
    },
    8: {
        "title": "Q8. <br/><br/>퀴디치 선발 선수로 뽑힌 당신!<br/>포지션은 무엇일까요?",
        "type": "TF",
        "Enter_trip_test_A": "정렬적인 몰이꾼 또는 얍삽한 파수꾼",
        "Enter_trip_test_B": "강력한 추격꾼 또는 진짜 빠른 수색군",
        "EntertripQnum": "8/12"
    },
    9: {
        "title": "Q9. <br/><br/>현재 나이 11살로 입학하셨습니다.<br/>당신의 학년은?",
        "type": "TF",
        "Enter_trip_test_A": "6학년 - 난 천재야", /*양심챙겨*/
        "Enter_trip_test_B": "1학년 - 정석대로 간다.",
        "EntertripQnum": "9/12"
    },
    10: {
        "title": "Q10. <br/><br/>시험까지 일주일이 남았습니다!<br/>당신은 지금 무얼하고 계신가요?",
        "type": "JP",
        "Enter_trip_test_A": "시험에 대해 생각해본다.",
        "Enter_trip_test_B": "공부를 시작한다.",
        "EntertripQnum": "10/12"
    },
    11: {
        "title": "Q11. <br/><br/>당신의 핸드폰 기종은 무엇인가요?",
        "type": "JP",
        "Enter_trip_test_A": "아이폰 14 pro",
        "Enter_trip_test_B": "갤럭시 22 ultra",
        "EntertripQnum": "11/12"
    },
    12: {
        "title": "Q12. <br/><br/>주로 선호하는 교복 스타일은 어떤건가요?",
        "type": "JP",
        "Enter_trip_test_A": "단정한 교복",
        "Enter_trip_test_B": "편안한 교복",
        "EntertripQnum": "12/12"
    }
}
var result = {
    "ISTJ": {
        "img": "/img/Enter_HarryPotter_Test/result_slytherin.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "슬린데린",
        "explain_title": "재간꾼들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정을 신중하게 보내시길 바랍니다.",
    },
    "ISTP": {
        "img": "/img/Enter_HarryPotter_Test/result_ravenclaw.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "레번클로",
        "explain_title": "지혜롭고 사려 깊은 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정이 도움되길 바랍니다.",
    },
    "ISFJ": {
        "img": "/img/Enter_HarryPotter_Test/result_slytherin.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "슬린데린",
        "explain_title": "재간꾼들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정을 신중하게 보내시길 바랍니다.",
    },
    "ISFP": {
        "img": "/img/Enter_HarryPotter_Test/result_hufflepuff.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "후풀푸프",
        "explain_title": "진실하고 거짓이 없는 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정에 당신의 마음이 전파되기를 바랍니다.",
    },
    "INTJ": {
        "img": "/img/Enter_HarryPotter_Test/result_ravenclaw.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "레번클로",
        "explain_title": "지혜롭고 사려 깊은 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정이 도움되길 바랍니다.",
    },
    "INTP": {
        "img": "/img/Enter_HarryPotter_Test/result_ravenclaw.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "레번클로",
        "explain_title": "지혜롭고 사려 깊은 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정이 도움되길 바랍니다.",
    },
    "INFJ": {
        "img": "/img/Enter_HarryPotter_Test/result_ravenclaw.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "레번클로",
        "explain_title": "지혜롭고 사려 깊은 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정이 도움되길 바랍니다.",
    },
    "INFP": {
        "img": "/img/Enter_HarryPotter_Test/result_hufflepuff.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "후플푸프",
        "explain_title": "진실하고 거짓이 없는 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정에 당신의 마음이 전파되기를 바랍니다.",
    },
    "ESTJ": {
        "img": "/img/Enter_HarryPotter_Test/result_slytherin.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "슬린데린",
        "explain_title": "재간꾼들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정을 신중하게 보내시길 바랍니다.",
    },
    "ESTP": {
        "img": "/img/Enter_HarryPotter_Test/result_gryffindor.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "그린핀도르",
        "explain_title": "용감하고 대담한 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정을 응원합니다.",
    },
    "ESFJ": {
        "img": "/img/Enter_HarryPotter_Test/result_hufflepuff.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "후플푸프",
        "explain_title": "진실하고 거짓이 없는 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정에 당신의 마음이 전파되기를 바랍니다.",
    },
    "ESFP": {
        "img": "/img/Enter_HarryPotter_Test/result_gryffindor.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "그린핀도르 ",
        "explain_title": "용감하고 대담한 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정을 응원합니다.",
    },
    "ENTJ": {
        "img": "/img/Enter_HarryPotter_Test/result_slytherin.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "슬린데린",
        "explain_title": "재간꾼들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정을 신중하게 보내시길 바랍니다.",
    },
    "ENTP": {
        "img": "/img/Enter_HarryPotter_Test/result_gryffindor.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "그린핀도르",
        "explain_title": "용감하고 대담한 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정을 응원합니다.",
    },
    "ENFJ": {
        "img": "/img/Enter_HarryPotter_Test/result_hufflepuff.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "후플푸프",
        "explain_title": "진실하고 거짓이 없는 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정에 당신의 마음이 전파되기를 바랍니다.",
    },
    "ENFP": {
        "img": "/img/Enter_HarryPotter_Test/result_gryffindor.jpg",
        "Enter_trip_keyword": "당신의 기숙사는",
        "Enter_trip": "그린핀도르",
        "explain_title": "용감하고 대담한 자들을 위한 기숙사에 배정 받으셨습니다.",
        "explain": "앞으로의 여정을 응원합니다.",
    }
}

function Enter_start() {
    $(".trip_start").hide();
    $(".trip_question").show();
    next();
}

$("#Enter_trip_test_A").click(function () {
    var type = $("#type").val();
    var preValue = $("#" + type).val();
    $("#" + type).val(parseInt(preValue) + 1);
    next();
});
$("#Enter_trip_test_B").click(function () {
    next();
});

function next() {
    if (Enter_tripnum == 13) {
        $(".trip_question").hide();
        $(".result").show();

        var Enter_mbti_trip = "";
        ($("#EI").val() < 2) ? Enter_mbti_trip += "I" : Enter_mbti_trip += "E";
        ($("#SN").val() < 2) ? Enter_mbti_trip += "N" : Enter_mbti_trip += "S";
        ($("#TF").val() < 2) ? Enter_mbti_trip += "F" : Enter_mbti_trip += "T";
        ($("#JP").val() < 2) ? Enter_mbti_trip += "P" : Enter_mbti_trip += "J";
        alert("결과 확인하기");

        $("#img").attr("src", result[Enter_mbti_trip]["img"]);
        $("#Enter_trip").html(result[Enter_mbti_trip]["Enter_trip"]);
        $("#Enter_trip_keyword").html(result[Enter_mbti_trip]["Enter_trip_keyword"]);
        $("#explain_title").html(result[Enter_mbti_trip]["explain_title"]);
        $("#explain").html(result[Enter_mbti_trip]["explain"]);
        $("#explain_tourist").html(result[Enter_mbti_trip]["explain_tourist"]);

    } else {
        $(".progress-bar").attr('style', 'width: calc(100/12*' + Enter_tripnum + '%)');
        $("#trip_title").html(Enter_trip_q[Enter_tripnum]["title"]);
        $("#EntertripQnum").html(Enter_trip_q[Enter_tripnum]["EntertripQnum"]);
        $("#type").val(Enter_trip_q[Enter_tripnum]["type"]);
        $("#Enter_trip_test_A").html(Enter_trip_q[Enter_tripnum]["Enter_trip_test_A"]);
        $("#Enter_trip_test_B").html(Enter_trip_q[Enter_tripnum]["Enter_trip_test_B"]);
        Enter_tripnum++;
    }

}
