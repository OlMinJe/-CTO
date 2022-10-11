<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jadoo_MBTI_test</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">  <!-- 부트스트랩 4.5 -->
    <link rel="stylesheet" type="text/css" href="/css/Entertainment/Enter_test.css">
    <script type="text/javascript" src="/js/includeHtml.js"></script>
</head>

<body class="container">   <!-- container 적절히 간격을 띄우는 -->
<article class="mb-4 Enter_start">
    <div class ="mb-5 Enter_jadoo_test_title">너나들이</div>
    <img class="Enter_image mb-5" src="/img/Enter_jadoo_test/Enter_jadoo_title_image.png"></img>
    <h1 class="mb-5 text-center">안녕자두야 MBTI 테스트</h1>  <!-- mt-5 -> 부트스트랩으로 h1 위쪽 간격 띄어주기 margin top -->
    <h5 class="mb-4" style="text-align: center; margin: 0px 0px 15px 0px;">내가 안녕 자두야 속 캐릭터라면?</h5>
    <button type="button" class="btn btn-outline-secondary mb-5" style="height: 80px; font-size: large;" onclick="Enter_start(); ">테스트 시작하기</button>
    <button type="button" class="btn btn-outline-secondary mb-5" style="height: 80px; font-size: large;" onclick="location.href='/Entertainment/Entertainment.jsp'">다른 테스트 보러가기</button>
    <h5 class="mt-5" style="text-align: center;">테스트 공유하기</h5>
    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <div class="mt-2 share addthis_inline_share_toolbox"></div>
</article>

<article class="col-12 mb-4 Enter_question">
    <div class ="mb-2 mt-4 Enter_jadoo_title">안녕자두야 MTBI</div>
    <h6 id="EnterjadooQnum" class="mb-2 " style="text-align: right; color: rgb(137, 137, 137);">문제 번호</h6>
    <div class="progress mb-2">
        <div class="progress-bar mb-10" role="progressbar" aria-label="Basic example" style="width: calc(100/12*1%)"></div>
    </div>
    <div class="col-12" id="Enter_title" class="mb-10" style="min-height:30px; margin-bottom:30px; padding: 50px 0px 50px 0px; text-align: center;">문제</div>
    <!--<h2 id="Enter_title" class="text-center mt-10">문제</h2>-->
    <input id="type" type="hidden" value="EI">
    <button id="Enter_mbti_A" type="button" class="btn btn-light mb-5" style="height: 80px; line-height: 20px;  border-radius: 12px;">Primary</button>
    <button id="Enter_mbti_B" type="button" class="btn btn-light mb-5" style="height: 80px; line-height: 20px;  border-radius: 12px;">Primary</button>

</article>

<article class="result mb-4">
    <div class ="mb-5 Enter_jadoo_title">안녕자두야 MTBI</div>
    <h1 id="Enter_jadoo_keyword" class="text-center mb-3">안녕 자두야 키워드</h1>
    <h2 id="Enter_mbti_jadoo_name" class="text-center mb-4">자두 캐릭터 이름</h2>
    <img id="Enter_mbti_img" class="rounded-circle mb-3" style="margin-bottom: 40px;" alt="jadoo">
    <div id="Enter_jadoo_result" class="mb-3" style="border: 1px solid #ddd;">
        <h3 id="explain_title" class="mb-1" style="font-size: 1.3rem; text-align: justify; line-height: 30px; margin: 20px 350px 0px 350px;">자두 캐릭터 타이틀 설명</h3>
        <h3 id="Enter_mbti_jadoo_explain" class="mb-20" style="font-size: medium; text-align: justify; line-height: 30px; margin: 20px 350px 20px 350px;">설명</h3>
        <!-- 추후 안녕 자두야 결과 추가 예정 -->
    </div>
    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <div class="mb-5 share addthis_inline_share_toolbox" style="margin-top: 20px;"></div>
    <button id="Enter_page" type="button" class="btn btn-light mb-5" style="height: 60px; margin-bottom: 30px;" onclick="location.href='/Entertainment/Entertainment.jsp'">다른 테스트 하러 가기!</button>

</article>

<!-- input에 점수를 저장, 화면에는 보이지 않도록 hidden , 값(둘 중 앞에 있는 정보)을 저장할 공간이 총 4개가 필요 -> 1. E/I  2. S/N  3. T/F  4. J/P -->
<input type="hidden" id="EI" value="0">
<input type="hidden" id="SN" value="0">
<input type="hidden" id="TF" value="0">
<input type="hidden" id="JP" value="0">
<!-- 위쪽에는 앞 정보. 즉, E/S/T/J에 대한 질문을 넣는다. 위쪽 버튼을 눌렀을 때만 해당하는 점수가 증가하도록 -->

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> <!-- jquery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>  <!-- 스크립트 -->
<script>
    // 현재 몇 번 문제에 있는지를 나타내는 변수
    var Enternum =1;
    var Enterq = {
        // 문제 번호를 키로 하는 객체 생성
        1:{"Enter_title": "Q1. <br/><br/>우리 반에 전학생이 왔다!!", "type": "EI", "Enter_mbti_A": "뭔가 나랑 잘 맞을 것 같은데???<br/> 일단 먼저 말 걸어보자!!", "Enter_mbti_B": "일단 인사만 하고, <br/>전학생이 나랑 맞는지 좀 지켜봐야겠어.","EnterjadooQnum":"1/12"},
        2:{"Enter_title": "Q2. <br/><br/>오랜만에 만난 절친, <br/>절친이 자신의 친구를 불러도 되냐고 한다.", "type": "EI", "Enter_mbti_A": "당연 가능 ! <br/>나와 절친이 될 수 있을지도 ~", "Enter_mbti_B": "절친이랑만 있는 것도 즐겁고, <br/>새로운 사람은 어색할 것 같아." ,"EnterjadooQnum":"2/12"},
        3:{"Enter_title": "Q3. <br/><br/>약속을 마치고 집에 돌아왔는데, <br/>다른 친구에게서 놀자는 연락이 왔다.", "type": "EI", "Enter_mbti_A": "어딘데??? <br/>당장 나간다 ", "Enter_mbti_B": "오늘은 이미 나갔다가 왔으니까  좀 쉬어야 돼. <br/>친구에게는 나중에 보자고 연락한다." ,"EnterjadooQnum":"3/12" },
        4:{"Enter_title": "Q4. <br/><br/>음악경연대회가 열린다는 소식을 들었다. ", "type": "SN", "Enter_mbti_A": "나도 밀리지는 않지만 <br/>쟁쟁한 후보가 많으니까 우수상을 노려보자!", "Enter_mbti_B": "나가면 나는 당연히 대상이지 !!!!" ,"EnterjadooQnum":"4/12"},
        5:{"Enter_title": "Q5. <br/><br/>좋아하는 사람과 데이트를 하게 됐다 !", "type": "SN", "Enter_mbti_A": " 대참사를 막기 위해 혹시 모르니까 <br/>밥 먹고 거울을 확인해야지 ! ", "Enter_mbti_B": "우리의 아이는 영어 유치원에 보내야지 !!" ,"EnterjadooQnum":"5/12"},
        6:{"Enter_title": "Q6. <br/><br/>변소괴담?? <br/>내 미래의 배우자를 알 수 있다고 ?", "type": "SN", "Enter_mbti_A": "괴담은 괴담일 뿐 ! <br/>믿지 않아 !", "Enter_mbti_B": "내 미래의 배우자가 너무너무 궁금해 !!! ㅠㅠ<br/> 한 번 해본다. ","EnterjadooQnum":"6/12"},
        7:{"Enter_title": "Q7. <br/><br/>밖에서 소리가 나길래 나가봤더니<br/> 상자에 고양이가 들어있었다. ", "type": "TF", "Enter_mbti_A": " 너무 귀엽지만 고양이를 키울 상황이 아니기 때문에<br/> 간식만 주고 데려가지 않는다. ", "Enter_mbti_B": " 데려가서 키우고 싶다.<br/> 그리고 너무 귀여워 !!! " ,"EnterjadooQnum":"7/12"},
        8:{"Enter_title": "Q8. <br/><br/>학원 때문에 힘들어하는 친구를 본 나는", "type": "TF", "Enter_mbti_A": "부모님께 학원에 가지 않아도 될만한 이유를 말씀드리자고 <br/> 친구에게 말한다.", "Enter_mbti_B": "친구가 힘들어하니까 <br/>내가 대신 학원에 가는건 어떨까?" ,"EnterjadooQnum":"8/12"},
        9:{"Enter_title": "Q9. <br/><br/>시험 점수로 속상해하는 친구에게 나는", "type": "TF", "Enter_mbti_A": "20점 맞은 내 시험지를 보여준다. ", "Enter_mbti_B": "친구에게 괜찮다며 위로해준다. " ,"EnterjadooQnum":"9/12"},
        10:{"Enter_title": "Q10. <br/><br/>드디어 기다리고 기다리던 여름 방학 !!!! <br/>일정을 세운다면 ? ", "type": "JP", "Enter_mbti_A": "8시에 일어나서 산책, 예습하기...<br/> 학원가서 열공!!!", "Enter_mbti_B": "어떻게 될지 모른다!!" ,"EnterjadooQnum":"10/12"},
        11:{"Enter_title": "Q11. <br/><br/>친구네 놀러간 당신 ! <br/>과제를 하러 집에 가려던 그때 밥을 먹고 가라고 한다면 ?", "type": "JP", "Enter_mbti_A": "같이 밥 먹고 싶지만 <br/>집에 가서 해야 될 과제가 있으니까 어쩔 수 없이 집으로 간다. ", "Enter_mbti_B": "배고프니까 일단 먹고 <br/>나중에 집에 가서 과제 하면 되지 ~" ,"EnterjadooQnum":"11/12"},
        12:{"Enter_title": "Q12. <br/><br/>다음 주까지 제출해야 되는 과제가 생겼다. ", "type": "JP", "Enter_mbti_A": "집에가면 자료조사 먼저 하고, <br/>주말에 과제 완성하고 수정해서 제출하면 되겠다!", "Enter_mbti_B": "다음 주가 되려면 시간이 좀 남았으니까 <br/>일단 지금은 놀고, 주말에 생각해보자 ~" ,"EnterjadooQnum":"12/12"}
    }

    // mbti 값 저장
    var result = {
        "ISTJ" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_teacher.png","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "자두 선생님 <br/> (ISTJ) ","explain_title":"#자두선생님과 닮은 나는","Enter_explain" : "· 계획 짜는 걸 좋아하고, 즉흥적인 걸 별로 좋아하지 않아요. <br/> · 책임감이 강하고 원칙적으로 행동해요. <br/> · 휴일에는 집에서 쉬는 걸 좋아해요. <br/> · 사람 많은 곳, 시끄러운 곳을 별로 좋아하지 않아요. "},
        "ISTP" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_taehee.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "태희  <br/> (ISTP)","explain_title":"#태희와 닮은 나는","Enter_explain" : "· 남한테 관심이 없고, 관심 받는 것도 별로 좋아하지 않아요. <br/> · 에너지가 적어서 효율적인 일을 하는 것을 좋아해요. <br/> · 요점만 듣고, 요점만 이야기 하고 싶어 해요. <br/> · 호불호가 강하고, 틀에 박힌 걸 싫어해요. "},
        "ISFJ" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_minji.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "민지  <br/> (ISFJ)","explain_title":"#민지와 닮은 나는","Enter_explain" : "· 신중하고, 세심하며 꼼꼼한 면모를 보여요. <br/> · 차분하며 온정적이고 친근해요. <br/> · 책임감과 인내력 또한 강해요. <br/> · 순차적으로 계획을 세우고, 배려가 넘쳐요. <br/> · 관계를 중요시 여기고, 조화를 유지하기 위해 노력해요."},
        "ISFP" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_jadoograndma.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는", "Enter_jadoo" : "자두 할머니  <br/> (ISFP)","explain_title":"#자두 할머니와 닮은 나는","Enter_explain" : "· 마음이 순하고 따뜻하며, 정이 많아요. <br/> · 다른 사람의 부탁을 거절하기 어려워해요. <br/> · 생각은 잘 하는데 생각한 것을 실천하기까지가 어려워요. <br/> · 규칙, 관습, 틀에 묶여서 제약 받는 걸 좋아하지 않아요. "},
        "INTJ" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_joyoung.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "조영  <br/> (INTJ)","explain_title":"#조영이와 닮은 나는","Enter_explain" : "· 뭐든 확실한게 좋다고 생각해요. <br/> · 자기 주관이 뚜렷하고, 고집이 세다는 말을 자주 들어요. <br/> · 원칙을 중요시하고, 남들에게 별로 관심이 없어요. <br/> · 감정애 휘둘리는 걸 좋아하지 않아요."},
        "INTP" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_dad.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "자두 아빠  <br/> (INTP) ","explain_title":"#자두 아빠와 닮은 나는","Enter_explain" : "· 호기심이 많고, 아이디어가 많아요. <br/> · 끊임없이 새로운 지식에 대해 궁금해 해요. <br/> · 논리정연하게 말하고, 사적인 감정을 잘 드러내지 않아요. <br/> · 타인에게 피해주는 걸 싫어하고, 타인에게 별로 관심이 없어요. "},
        "INFJ" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_sungi.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "순기  <br/> (INFJ)","explain_title":"#순기와 닮은 나는","Enter_explain" : "· 감수성이 풍부하고, 사차원이라는 소리를 자주 들어요. <br/> · 싫은 내색을 하는 것이 어려워요. <br/> · 근거없는 말을 별로 좋아하지 않고, 절대 믿지 않아요. <br/> · 혼자 뭐할 지 계획 세우는 걸 좋아해요. "},
        "INFP" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_seonghun.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "성훈  <br/> (INFP)","explain_title":"#성훈이와 닮은 나는","Enter_explain" : "· 섬세하고, 예술을 좋아해요. <br/> · 시끌벅적한 분위기를 별로 좋아하지 않아요. <br/> · 뛰어난 공감능력으로 작품에 쉽게 감정이입이 가능해요. <br/> · 시, 소설 등 문학 작품을 좋아해요. "},
        "ESTJ" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_mom.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "자두 엄마  <br/> (ESTJ)","explain_title":"#자두 엄마와 닮은 나는","Enter_explain" : "· 단계적으로 계획을 세우고 이행하는 것을 좋아해요. <br/> · 매우 신속하게 논리적 결론을 내고, 겉과 속이 일치해요. <br/> · 싸우는 걸 좋아하지는 않지만, 싸워서 지는 건 더 싫어해요. <br/> · 고집이 세고, 감정 표현이 서툴러요. "},
        "ESTP" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_uncle.png","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "자두 외삼촌  <br/> (ESTP)","explain_title":"#자두 외삼촌과 닮은 나는","Enter_explain" : "· 즉흥적이고, 내기하는 걸 좋아해요. <br/> · 선입견이 없고, 개방적이에요. <br/> · 자기주장이 강하고, 사람들과 어울려 노는 걸 좋아해요. <br/> · 솔직하고, 적극적이고 열정적이에요. "},
        "ESFJ" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_brother.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "자두 남동생  <br/> (ESFJ)","explain_title":"#자두 남동생과 닮은 나는","Enter_explain" : "· 예의가 바르고 친절해요. <br/> · 친화력이 좋고, 주변 사람들에게 관심이 많아 잘 챙겨요. <br/> · 뛰어난 공감능력으로 리액션이 좋아요. <br/> ·  책임감이 강해 사소한 일도 성실하게 끝까지 해내려고 노력해요. "},
        "ESFP" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_sister.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "자두 여동생  <br/> (ESFP)","explain_title":"#자두 여동생과 닮은 나는","Enter_explain" : "· 도전 정신이 강하고, 매우 열정적이에요. <br/> · 현재가 중요하고, 새로운 걸 시도하는 것을 좋아해요. <br/> · 하고 싶은 건 꼭 헤야 되고, 하기 싫은 건 미루는 편이에요. <br/> · 틀에 박힌 것을 좋아하지 않고, 계획을 따라 일을 진행하는 것을 힘들어해요. "},
        "ENTJ" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_eunhee.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "은희  <br/> (ENTJ)","explain_title":"#은희와 닮은 나는","Enter_explain" : "· 솔직하면서도 단호한 성격을 가지고 있어요. <br/> · 열성적이며, 지도력과 통솔력이 높아요. <br/> · 강한 리더십으로 대화를 이끌어가고 사교활동에 적극적이에요. <br/> · 지적인 자극을 주는 새로운 아이디에서 관심이 많아요. "},
        "ENTP" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_eunseok.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "윤석  <br/> (ENTP)","explain_title":"#윤석이와 닮은 나는","Enter_explain" : "· 생각의 전환이 빠르고, 통통 튀는 아이디어가 많아요. <br/> · 독창적이며 다방면에 관심과 재능이 많아요. <br/> · 감정기복이 심하고, 종종 충동적인 의사결정을 내릴 때가 있어요. <br/> · 임기응변에 능하고 말보다는 행동이 앞설 때가 있어요. "},
        "ENFJ" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_sundol.jpeg","Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "선돌  <br/> (ENFJ)","explain_title":"#선돌이와 닮은 나는","Enter_explain" : "· 리액션이 좋고, 자신보다 상댜를 먼저 생각하고 말과 행동을 해요. <br/> · 미래와 현실을 동시에 고려하여 계획 세우는 것을 좋아해요. <br/> · 추진력이 졸고, 열정적이에요. <br/> · 상상력이 풍부하고, 성장과 가능성을 중요하게 생각해요. "},
        "ENFP" : {"img": "/img/Enter_jadoo_test/Enter_mbti_jadoo_jadoo.png", "Enter_jadoo_keyword":"안녕 자두야에서 나는","Enter_jadoo" : "자두  <br/> (ENFP)","explain_title":"#자두와 닮은 나는","Enter_explain" : "· 따뜻하고, 활기가 넘치며 재능이 많아요. <br/> · 항상 새로운 가능성을 찾고 시도해요. <br/> · 문제 해결에 재빠르고 관심이 있어요. <br/> · 독립적인 성향을 가지고 있어요. <br/> · 안정적인 삶보다 창의적이며 자유로운 삶을 원해요. "}
    }

    // 테스트 시작하기를 누르면 동작하는 함수 생성 (Enter_start)
    function Enter_start() {
        $(".Enter_start").hide();

        // 테스트 시작하기를 눌렀을 때 문제가 보이도록 하는 제이쿼리 문
        $(".Enter_question").show();

        // 처음 시작 버튼을 눌렀을 때 시작 화면을 숨기고 문제 화면을 보여주면서 바로 첫 번째 문제가 나오도록 함
        Enter_next();
    }

    // Enter_mbti_A 버튼을 눌렀을 때만 여기에 있는 EI/SN/TF/JP 중에 값을 찾아서 점수를 올려주게 만들기
    $("#Enter_mbti_A").click(function(){
        var type = ($("#type").val());  // EI 값이 저장됨
        var Enter_mbti_preValue = $("#"+type).val();
        // parseInt(Enter_mbti_preValue)+1 이 값을 id가 EI의 새로운 값으로 교체
        $("#"+type).val(parseInt(Enter_mbti_preValue)+1);
        Enter_next();

    });

    // Enter_mbti_B 버튼을 눌렀을 때도 문제가 넘어가도록 하는 함수 생성, Enter_mbti_B를 클릭 할 때에는 점수 증가 필요 없음(Enter_mbti_A버튼으로 점수 증가 후 판별 -> 즉, 점수 저장은 안 되지만 Enter_next() 함수가 실행되어 다음 문제로 넘어감)
    $("#Enter_mbti_B").click(function(){
        Enter_next();
    });

    // 다음 문제로 넘어가는 함수
    function Enter_next() {
        if(Enternum == 13){
            $(".Enter_question").hide();
            $(".result").show();
            // mbti를 구하는 최종 로직
            var Enter_mbti_jadoo = "";
            ($("#EI").val() < 2) ? Enter_mbti_jadoo+="I" : Enter_mbti_jadoo+="E";
            ($("#SN").val() < 2) ? Enter_mbti_jadoo+="N" : Enter_mbti_jadoo+="S";
            ($("#TF").val() < 2) ? Enter_mbti_jadoo+="F" : Enter_mbti_jadoo+="T";
            ($("#JP").val() < 2) ? Enter_mbti_jadoo+="P" : Enter_mbti_jadoo+="J";
            // 최종 결과를 브라우저 알림창으로 표시
            alert("결과 확인하기");

            $("#Enter_mbti_img").attr("src", result[Enter_mbti_jadoo] ["img"]);
            $("#Enter_jadoo_keyword").html(result[Enter_mbti_jadoo]["Enter_jadoo_keyword"]);
            $("#Enter_mbti_jadoo_name").html(result[Enter_mbti_jadoo] ["Enter_jadoo"]);
            $("#explain_title").html(result[Enter_mbti_jadoo]["explain_title"]);
            $("#Enter_mbti_jadoo_explain").html(result[Enter_mbti_jadoo] ["Enter_explain"]);

        } else {
            $(".progress-bar").attr('style', 'width: calc(100/12*'+Enternum+'%)');  // 문제 번호에 해당하는만큼 문제 번호 계산
            $("#Enter_title").html(Enterq[Enternum]["Enter_title"]);
            $("#EnterjadooQnum").html(Enterq[Enternum]["EnterjadooQnum"]);
            $("#type").val(Enterq[Enternum]["type"]);
            $("#Enter_mbti_A").html(Enterq[Enternum]["Enter_mbti_A"]);
            $("#Enter_mbti_B").html(Enterq[Enternum]["Enter_mbti_B"]);
            Enternum++;
        }

    }
</script>

<!-- addthis code / sns 공유 기능 -->
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-62f6d80e58d7a901"></script>
</body>
</html>