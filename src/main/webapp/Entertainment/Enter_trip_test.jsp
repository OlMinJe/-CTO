<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter_trip_test</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">  <!-- 부트스트랩 4.5 -->
    <link rel="stylesheet" type="text/css" href="/css/Entertainment/Enter_test.css">
</head>

<body class="container">
<!-- 시작 화면 -->
<article class="trip_start mb-4">
    <div class ="mb-5 Enter_trip_test_title">너나들이</div>
    <img class="Enter_trip_image mb-5" src="/img/Enter_trip_test/Enter_trip_test_title.jpg"></img>
    <h1 class="mb-4 text-center">국내 여행지 테스트</h1>
    <h5 class="mb-5" style="text-align: center; margin: 0px 0px 15px 0px;">나의 여행 스타일과 잘 맞는 국내 여행지는?</h5>
    <button type="button" class="btn btn-outline-secondary mb-5" style="height: 80px; font-size: large;" onclick="Enter_trip_start();">테스트 시작하기</button>
    <button type="button" class="btn btn-outline-secondary mb-5" style="height: 80px; font-size: large;" onclick="location.href='/Entertainment/Entertainment.jsp'">다른 테스트 보러가기</button>
    <h5 class="mb-2" style="text-align: center;">테스트 공유하기</h5>
    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <div class="mb-2 share addthis_inline_share_toolbox"></div>
</article>

<!-- 문제 화면 -->
<article class="col-12 mb-4 trip_question">
    <div class ="mb-2 mt-4 Enter_trip_test_title">국내 여행지 테스트</div>
    <h6 id="EntertripQnum" class="mb-2" style="text-align:right; color: rgb(137, 137, 137);">문제 번호</h6>
    <div class="progress mb-2">
        <div class="mb-10 progress-bar bg-success" role="progressbar" aria-label="Basic example" style="width: calc(100/12*1%)"></div>
    </div>
    <div class="col-12" id="trip_title" class="mb-10" style="min-height:30px; margin-bottom:30px; padding: 50px 0px 50px 0px; text-align: center;">문제</div>
    <!--<h2 id="trip_title" class="text-center mt-10">문제</h2>-->
    <input id="type" type="hidden" value="EI">
    <button id="Enter_trip_test_A" type="button" class="btn btn-light mt-5" style="height: 80px; line-height: 20px; border-radius: 12px;">Primary</button>
    <button id="Enter_trip_test_B" type="button" class="btn btn-light mt-5" style="height: 80px; line-height: 20px; border-radius: 12px;">Primary</button>

</article>

<!-- 결과 화면 -->
<article class="result mb-4">
    <div class ="mb-5 Enter_trip_test_title">국내 여행지 테스트</div>
    <h1 id="Enter_trip_keyword" class="text-center mb-4">여행지 키워드</h1>
    <h2 id="Enter_trip" class="text-center mb-4">여행지</h2>
    <img id="img" src="" class="rounded-circle mb-3" style="margin-bottom: 40px;" alt="Enter_trip">
    <div id="Enter_trip_result" class="mb-3" style="border: 1px solid #ddd;">
        <h3 id="explain_title" class="mb-1" style="font-size: 1.3rem; text-align: justify; line-height: 30px; margin: 20px 350px 0px 350px;">타이틀 설명</h3>
        <h3 id="explain" class="mb-1" style="font-size: medium; text-align: justify; line-height: 30px; margin: 0px 350px 20px 350px;">여행 스타일 설명</h3>
        <h3 id="explain_tourist" class="mb-5" style="font-size: 1.3rem; text-align: justify; line-height: 30px; margin: 0px 350px 20px 350px;">여행지에 대한 설명(코스)</h3> <!-- 내용 추후 추가 -->
    </div>
    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <div class="mb-5 share addthis_inline_share_toolbox"></div>
    <button id="Enter_page" type="button" class="btn btn-light mb-5" style="height: 60px; margin-bottom: 30px;" onclick="location.href='/Entertainment/Entertainment.jsp'">다른 테스트 하러 가기!</button>
</article>

<!-- 타입별로 데이터 저장 -->
<input type="hidden" id="EI" value="0">
<input type="hidden" id="SN" value="0">
<input type="hidden" id="TF" value="0">
<input type="hidden" id="JP" value="0">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> <!-- jquery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>  <!-- 스크립트 -->

<script>
    var Enter_tripnum = 1; // 문제 번호 변수
    var Enter_trip_q = {
        1: {"title": "Q1. <br/><br/>이번 여행지는?", "type" : "EI", "Enter_trip_test_A" : "다양한 액티비티 활동을 즐길 수 있는 여행지 !", "Enter_trip_test_B" : "자연을 바라보면 휴양하는 여행지 !","EntertripQnum":"1/12"},
        2: {"title": "Q2. <br/><br/>여행에서 포기할 수 없는 것은?", "type" : "EI", "Enter_trip_test_A" : "처음 경험하는 짜릿한 이색 체험", "Enter_trip_test_B" : "안락함을 주는 예쁜 숙소!","EntertripQnum":"2/12"},
        3: {"title": "Q3. <br/><br/>여행 도중 다른 여행객이 말을 걸었다.", "type" : "EI", "Enter_trip_test_A" : "경청하고 아는 만큼 대답해주다가 Tmi 남발 ~", "Enter_trip_test_B" : "살짝 대답해주고 길어질 것 같으면 도망간다. " , "EntertripQnum":"3/12"},
        4: {"title": "Q4. <br/><br/>식당에서 나오는 노래를 들을 때,<br/> 나는 ", "type" : "SN", "Enter_trip_test_A" : "멜로디가 좋으니 일단 플레이리스트에 저장", "Enter_trip_test_B" : "노래를 듣다 보니 가사가 너무 좋다. 플레이리스트에 저장.", "EntertripQnum":"4/12"},
        5: {"title": "Q5. <br/><br/>드디어 여행가기 전날 ! ", "type" : "SN", "Enter_trip_test_A" : "들뜬 마음으로 숙소와 식당 예약 현황을 <br/>한 번 더 확인하고 취침!", "Enter_trip_test_B" : "여행 중 일어날 일들을 상상하다가<br/> 일어나지도 않을 걱정을 하다가 취침!", "EntertripQnum":"5/12"},
        6: {"title": "Q6. <br/><br/>패러글라이딩을 하기 전 나는 ", "type" : "SN", "Enter_trip_test_A" : "아 재밌겠다. 얼마나 높은 곳에서 뛰어 내리는 거지? ", "Enter_trip_test_B" : "도중에 갑자기 안전장치가 망가져서 떨어지게 된다면..? 이대로 북한으로 간다면..??!", "EntertripQnum":"6/12"},
        7: {"title": "Q7. <br/><br/>여행 계획을 세우는 도중 친구의 <br/> '생각해볼게' 대답에 대한 나의 생각은?", "type" : "TF", "Enter_trip_test_A" : "말 그대로 '좀 더 고민 해볼게'", "Enter_trip_test_B" : "에둘러 말한 '거절할게'" , "EntertripQnum":"7/12"},
        8: {"title": "Q8. <br/><br/>열심히 찾아본 맛집이 <br/> 생각보다 별로였을 때", "type" : "TF", "Enter_trip_test_A" : "결과적으로는 맛있지 않았으니<br/> 찾아본 시간이 아깝다고 생각한다. ", "Enter_trip_test_B" : "나중에 또 안 가면 돼!! <br/>열심히 했다는게 중요하지!", "EntertripQnum":"8/12"},
        9: {"title": "Q9. <br/><br/>여행지 숙소에 대한 <br/> 친구와의 생각이 너무 다르다. ", "type" : "TF", "Enter_trip_test_A" : "내 생각을 전달하며 <br/>친구와 이야기하는 시간을 가진다. ", "Enter_trip_test_B" : "계속 다른 의견으로 대화하면 <br/>감정이 상할 수 있으니까 친구의 의견에 따른다.", "EntertripQnum":"9/12"},
        10: {"title": "Q10. <br/><br/>여행을 떠날 때 나는 ", "type" : "JP", "Enter_trip_test_A" : "여행지, 숙소부터 경비까지 계획은 필수 ! ", "Enter_trip_test_B" : "최소한의 계획은 세우지만 중간에 궁금한게 생기면 계획은 흐린눈..", "EntertripQnum":"10/12"},
        11: {"title": "Q11. <br/><br/>조식을 신청했는데 <br/> 늦잠을 자서 못 먹었을 때 나는 ", "type" : "JP", "Enter_trip_test_A" : "내일부터는 꼭 시간에 맞춰 일어나<br/>조식을 먹고 시작해야지!", "Enter_trip_test_B" : "역시 난 조식을 먹기에는<br/> 너무 힘들어..", "EntertripQnum":"11/12"},
        12: {"title": "Q12. <br/><br/>여행 중 너무 갖고 싶은 물건이 생겼을 때,<br/> 나는", "type" : "JP", "Enter_trip_test_A" : "물건을 구매하는 건 계획에 없는 소비이므로 참는다.", "Enter_trip_test_B" : "여행 경비고 뭐고 갖고 싶으므로 일단 산다.", "EntertripQnum":"12/12"}
    }
    var result = {
        "ISTJ" : {"img": "/img/Enter_trip_test/Enter_trip_test_gyeongju(ISTJ).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "경주 역사유적지구","explain_title":"#나의 여행 스타일은","explain" : "· 계획적으로 움직이며, 꼼꼼하게 여행지에 대해 공부해가는 걸 좋아헤요. <br/> · 장기 유럽 여행도 무리없이 소화 가능하며, 유적이 많은 여행지 역사 탐방을 즐겨요. <br/> · 스스로 여행 일정을 계획하고, 정리하는 스타일이에요. <br/> · 사람 많은 곳, 시끄러운 곳을 별로 좋아하지 않아요. ","explain_tourist" : " 여행지에 대한 설명(코스)"},
        "ISTP" : {"img": "/img/Enter_trip_test/Enter_trip_test_Ulleung-gun(ISTP).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "울릉군 대풍감","explain_title":"#나의 여행 스타일은","explain" : "· 예기치 못한 상황동 무난히 해결하는 융통성 있는 여행자. <br/> · 현실적이지만 대담한 면모가 있어요. <br/> · 평소에는 내성적이지만, 여행지에서는 대담한 모습을 보이는 스타일에요. <br/> · 호불호가 강하고, 틀에 박힌 걸 싫어해요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "ISFJ" : {"img": "/img/Enter_trip_test/Enter_trip_test_Jeonju(ISFJ).png","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "가장 한국적인 도시, <br/> 전주 한옥마을","explain_title":"#나의 여행 스타일은","explain" : " · 계획적으로 움직이며 동행을 챙기는 스타일의 여행자. <br/> · 함께 가는 친구들의 의견을 모아서 일정을 섬세하게 정리하는 스타일이에요. <br/> · 감성적이며 가성비 좋은 여행지를 좋아해요. <br/> · 적은 동선으로 여행하기 편한 여행지 선호해요.","explain_tourist" : " 여행지에 대한 설명(코스)"},
        "ISFP" : {"img": "/img/Enter_trip_test/Enter_trip_test_danyang(ISFP).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?", "Enter_trip" : "단양 패러글라이딩","explain_title":"#나의 여행 스타일은","explain" : "· 새로운 것을 시도할 준비가 된 예술가 타입의 여행자. <br/> · 다만 종종 혼자만의 느긋한 시간 추구해요. <br/> · 조식이 맛있거나 일몰, 일출이 아름다운 숙소처럼 디테일을 중요시하는 스타일이에요. <br/> · 풍경을 구경하는 걸 좋아해요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "INTJ" : {"img": "/img/Enter_trip_test/Enter_trip_test_sacheon(INTJ).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "삼천포대교공원","explain_title":"#나의 여행 스타일은","explain" : "· 철두철미하게 미리 계획 세우는 걸 좋아해요. <br/> · 박물관, 미술관 등에서 깊고 넓은 지식을 쌓는데 즐거움을 느껴요. <br/> · 여행지를 검색한 후, 여행지의 역사부터 기후 그리고 이슈까지 파악하는 스타일이에요. <br/> · 감정에 휘둘리는 걸 좋아하지 않아요.","explain_tourist" : " 여행지에 대한 설명(코스)"},
        "INTP" : {"img": "/img/Enter_trip_test/Enter_trip_test_damyang(INTP).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "담양 죽녹원","explain_title":"#나의 여행 스타일은","explain" : "· 철학, 사색, 아이디어에 목마른 타입의 여행자. <br/> · 무언가 생각할 수 있게 하는 여행지에서의 사색을 즐겨요. <br/> · 가장 효율적인 이동 수단을 먼저 고민하는 스타일이에요. <br/> · 타인에게 피해주는 걸 싫어하고, 타인에게 별로 관심이 없어요. ","explain_tourist" : " 여행지에 대한 설명(코스)"},
        "INFJ" : {"img": "/img/Enter_trip_test/Enter_trip_test_wanju(INFJ).jpeg","Enter_trip_keyword" : "나의 여행스타일과 어울리는 <br/> 국내 여행지는?","Enter_trip" : "대둔산 도립공원","explain_title":"#나의 여행 스타일은","explain" : "· 새로운 사람과 스스럼없이 어울리지만 사실 혼자만의 시간을 중요하게 생각해요. <br/> · 잔잔한 힐링이 필요한 여행을 좋아해요. <br/> · 숙소에서는 뭘 할지, 영화를 본다면 어떤 영화를 볼지 고민하는 스타일이에요. <br/> · 혼자 뭐할 지 계획 세우는 걸 좋아해요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "INFP" : {"img": "/img/Enter_trip_test/Enter_trip_test_Daewallyeong(INFP).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "대관령 양떼 목장","explain_title":"#나의 여행 스타일은","explain" : "· 최악의 상황에도 긍정적으로 더 나은 상황을 만들고자 노력해요. <br/> · 높은 인내심으로 고난이도 여행지 소화도 무리 없어요. <br/> · 여행 전 갈까 말까 고민하지만, 결국 떠밀려서 가도 즐겁게 다녀오는 스타일이에요. <br/> · 시, 소설 등 문학 작품을 좋아해요. ","explain_tourist" : " 여행지에 대한 설명(코스)"},
        "ESTJ" : {"img": "/img/Enter_trip_test/Enter_trip_test_Seoul(ESTJ).jpeg","Enter_trip_keyword" : "나의 여행스타일과 어울리는 <br/> 국내 여행지는?","Enter_trip" : "서울 N서울타워","explain_title":"#나의 여행 스타일은","explain" : "· 호불호가 확실하며 깔끔하게 짜여지는 여행 스타일 선호해요. <br/> · 다양한 선택지가 준비된 여행을 좋아헤요. <br/> · 여행 계획이 틀어지려는 직감이 오면 화가 치밀어 오르는 스타일이에요. <br/> · 빠르고 정확한 결정을 내리는 것을 좋아헤요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "ESTP" : {"img": "/img/Enter_trip_test/Enter_trip_test_Jeju(ESTP).jpeg","Enter_trip_keyword" : "나의 여행스타일과 어울리는 <br/> 국내 여행지는?","Enter_trip" : "제주도 카멜리아 힐","explain_title":"#나의 여행 스타일은","explain" : "· 먹고 놀기 휴식하기 등 동시에 다양한 니즈를 만족시킬 수 있는 여행지를 선호헤요. <br/> · 여행지에서 먹거나 사용한 아이템을 사업으로 구상하는 스타일이에요. <br/> · 자기주장이 강하고, 사람들과 어울려 노는 걸 좋아해요. <br/> · 솔직하고, 적극적이고 열정적이에요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "ESFJ" : {"img": "/img/Enter_trip_test/Enter_trip_test_Gangneung1(ESFJ).jpg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "몰입형 미디어아트 전시관<br/> 강릉 아르떼뮤지엄","explain_title":"#나의 여행 스타일은","explain" : "· 동행을 세심하게 배려하는 타입의 여행자. <br/> · 예기치 못한 상황에 걱정이 많은 편이라, 코스 짜기 명확하고 쉬운 여행지를 선호해요. <br/> · 뛰어난 공감능력으로 리액션이 좋아요. <br/> ·   리액션이 좋아서 친구가 공유한 여행 내용을 모두 호응해주는 스타일이에요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "ESFP" : {"img": "/img/Enter_trip_test/Enter_trip_test_gangneung(ESFP).png","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "강릉 세인트존스 ","explain_title":"#나의 여행 스타일은","explain" : "· 즉흥적인 즐거움을 추구하며 스포트 라이트를 즐기는 여행자. <br/> · 시끌벅적한 분위기에서 에너지가 상승해요. <br/> · 함께 가는 여행 메이트에게 맛집 링크를 공유하는 스타일이에요. <br/> · 틀에 박힌 것을 좋아하지 않고, 계획을 따라 일을 진행하는 것을 힘들어해요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "ENTJ" : {"img": "/img/Enter_trip_test/Enter_trip_test_dangjin(ENTJ).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "당진 삽교호 놀이동산","explain_title":"#나의 여행 스타일은","explain" : "· 동행 중에서 리더 격으로 여행을 이끌며, 효율적인 여행을 이끌어내요. <br/> · 넓은 범위의 여행지도 효율적을 여행하는 비범한 능력을 지니고 있어요. <br/> · 여행지에서 문제가 발생하면 빠르게 역할 분담을 잘 하는 스타일이에요. <br/> · 지적인 자극을 주는 새로운 아이디에서 관심이 많아요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "ENTP" : {"img": "/img/Enter_trip_test/Enter_trip_test_busan(ENTP).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "부산 해운대 블루라인 ","explain_title":"#나의 여행 스타일은","explain" : "· 느긋하고 관대한 타입의 여행자. <br/> · 위기 상황에서 판단을 잘하며 선입견없이 여행을 즐겨요. <br/> · 선택한 곳을 가야 하는 이유를 구구절절 설명하는 스타일이에요. <br/> · 임기응변에 능하고 말보다는 행동이 앞설 때가 있아요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "ENFJ" : {"img": "/img/Enter_trip_test/Enter_trip_test_sokcho(ENFJ).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?","Enter_trip" : "속초 청초호 호수공원","explain_title":"#나의 여행 스타일은","explain" : "· 사람을 좋아해 소통하는 여행을 추구해요. <br/> · 지역별 시장을 돌며 현지 분들과 친밀도 업하기도 최적화되어 있어요. <br/> · 추진력이 좋고, 열정적이에요. <br/> · 도라에몽 수준으로 여행 가방 안에 없는 준비물이 없는 스타일이에요. ","explain_tourist" : "여행지에 대한 설명(코스) "},
        "ENFP" : {"img": "/img/Enter_trip_test/Enter_trip_test_yangyang(ENFP).jpeg","Enter_trip_keyword" : "나의 여행스타일과 <br/> 어울리는 국내 여행지는?", "Enter_trip" : "강원도 양양 서피비치","explain_title":"#나의 여행 스타일은","explain" : "· 사람들과 어울리기를 좋아하는 인싸 타입의 여행자 <br/> · 액티비티를 선호하는 즉흥적인 스타일의 여행자로 에너자이저의 면모가 보여요. <br/> · 여행 중 일어날 새로운 변수를 기대하는 스타일이에요. <br/> · 안정적인 삶보다 창의적이며 자유로운 삶을 원해요. ","explain_tourist" : "여행지에 대한 설명(코스) "}

    }

    function Enter_trip_start() {
        $(".trip_start").hide();
        $(".trip_question").show();
        next();
    }
    $("#Enter_trip_test_A").click(function(){
        var type = $("#type").val();
        var preValue = $("#"+type).val();
        $("#"+type).val(parseInt(preValue)+1);
        next();
    });
    $("#Enter_trip_test_B").click(function(){
        next();
    });
    function next() {
        if (Enter_tripnum==13) {
            $(".trip_question").hide();
            $(".result").show();

            var Enter_mbti_trip = "";
            ($("#EI").val() < 2) ? Enter_mbti_trip+="I" : Enter_mbti_trip+="E";
            ($("#SN").val() < 2) ? Enter_mbti_trip+="N" : Enter_mbti_trip+="S";
            ($("#TF").val() < 2) ? Enter_mbti_trip+="F" : Enter_mbti_trip+="T";
            ($("#JP").val() < 2) ? Enter_mbti_trip+="P" : Enter_mbti_trip+="J";
            alert("결과 확인하기");

            $("#img").attr("src",result[Enter_mbti_trip]["img"]);
            $("#Enter_trip").html(result[Enter_mbti_trip]["Enter_trip"]);
            $("#Enter_trip_keyword").html(result[Enter_mbti_trip]["Enter_trip_keyword"]);
            $("#explain_title").html(result[Enter_mbti_trip]["explain_title"]);
            $("#explain").html(result[Enter_mbti_trip]["explain"]);
            $("#explain_tourist").html(result[Enter_mbti_trip]["explain_tourist"]);

        } else {
            $(".progress-bar").attr('style','width: calc(100/12*'+Enter_tripnum+'%)');
            $("#trip_title").html(Enter_trip_q[Enter_tripnum]["title"]);
            $("#EntertripQnum").html(Enter_trip_q[Enter_tripnum]["EntertripQnum"]);
            $("#type").val(Enter_trip_q[Enter_tripnum]["type"]);
            $("#Enter_trip_test_A").html(Enter_trip_q[Enter_tripnum]["Enter_trip_test_A"]);
            $("#Enter_trip_test_B").html(Enter_trip_q[Enter_tripnum]["Enter_trip_test_B"]);
            Enter_tripnum++;
        }

    }
</script>
<!-- addthis code / sns 공유 기능 -->
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-62f6d80e58d7a901"></script>
</body>
</html>