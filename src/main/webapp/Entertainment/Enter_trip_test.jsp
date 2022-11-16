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
<article class="trip_start">
    <div class="mt-4 Enter_trip_test_title">너나들이</div>
    <img class="Enter_trip_image mb-5" src="/img/Enter_trip_test/Enter_trip_test_title.jpg"></img>
    <h1 class="mt-5 text-center">국내 여행지 테스트</h1>
    <h5 class="mt-4" style="text-align: center; margin: 0px 0px 15px 0px">
        나의 여행 스타일과 잘 맞는 국내 여행지는?
    </h5>
    <button
            type="button"
            class="btn btn-outline-secondary mt-5"
            style="height: 80px; font-size: large"
            onclick="Enter_trip_start();"
    >
        테스트 시작하기
    </button>
    <button
            type="button"
            class="btn btn-outline-secondary mt-5"
            style="height: 80px; font-size: large"
            onclick="location.href='Entertainment.jsp'"
    >
        다른 테스트 보러가기
    </button>
    <h5 class="mt-5" style="text-align: center">테스트 공유하기</h5>
    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <div class="mt-2 share addthis_inline_share_toolbox"></div>
</article>

<!-- 문제 화면 -->
<article class="trip_question">
    <div class="mt-4 Enter_trip_test_title">국내 여행지 테스트</div>
    <h6
            id="EntertripQnum"
            class="mt-2"
            style="text-align: right; color: rgb(137, 137, 137)"
    >
        문제 번호
    </h6>
    <div class="progress mt-2">
        <div
                class="progress-bar bg-success"
                role="progressbar"
                aria-label="Basic example"
                style="width: calc(100 / 12 * 1%)"
        ></div>
    </div>
    <h2 id="trip_title" class="text-center mt-10">문제</h2>
    <input id="type" type="hidden" value="EI" />
    <button
            id="Enter_trip_test_A"
            type="button"
            class="btn btn-light mt-5"
            style="height: 80px; line-height: 20px; border-radius: 12px"
    >
        Primary
    </button>
    <button
            id="Enter_trip_test_B"
            type="button"
            class="btn btn-light mt-5"
            style="height: 80px; line-height: 20px; border-radius: 12px"
    >
        Primary
    </button>
</article>

<!-- 결과 화면 -->
<article class="result">
    <div class="mt-4 Enter_trip_test_title">국내 여행지 테스트</div>
    <h1 id="Enter_trip_keyword" class="text-center mt-5">여행지 키워드</h1>
    <h2 id="Enter_trip" class="text-center mt-4">여행지</h2>
    <img
            id="img"
            src=""
            class="rounded-circle mt-4"
            style="margin-bottom: 40px"
            alt="Enter_trip"
    />
    <div id="Enter_trip_result" class="mt-3" style="border: 1px solid #ddd">
        <h3
                id="explain_title"
                class="mt-3"
                style="
            font-size: 1.3rem;
            text-align: justify;
            line-height: 30px;
            margin: 20px 350px 0px 350px;
          "
        >
            타이틀 설명
        </h3>
        <h3
                id="explain"
                class="mt-1 md-4"
                style="
            font-size: medium;
            text-align: justify;
            line-height: 30px;
            margin: 0px 350px 20px 350px;
          "
        >
            여행 스타일 설명
        </h3>
        <h3 id="explain_tourist" class="mt-1">여행지에 대한 설명(코스)</h3>
        <h3 id="explain_tourist_1" class="mb-md-3">여행지 소개</h3>
        <h3 id="explain_tourlist_recommend" class="md-1">코스 추천!</h3>
        <h3 id="explain_tourlist_recommend1" class="md-1">코스 추천1</h3>
        <h5 id="tourlist_recommend_explain1" class="md-1">추천 코스 소개1</h5>
        <h3 id="explain_tourlist_recommend2" class="md-1">코스 추천2</h3>
        <h5 id="tourlist_recommend_explain2" class="md-1">추천 코스 소개2</h5>
        <h3 id="explain_tourlist_recommend3" class="md-1">코스 추천3</h3>
        <h5 id="tourlist_recommend_explain3" class="md-1">추천 코스 소개3</h5>
        <!-- 내용 추후 추가 -->
    </div>
    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <div class="mt-5 share addthis_inline_share_toolbox"></div>
    <button
            id="Enter_page"
            type="button"
            class="btn btn-light mt-5"
            style="height: 60px; margin-bottom: 30px"
            onclick="location.href='/Entertainment/Enter_point?stateCode=${stateCode}'"
    >
        포인트 적립하기!
    </button>
</article>

<!-- 타입별로 데이터 저장 -->
<input type="hidden" id="EI" value="0" />
<input type="hidden" id="SN" value="0" />
<input type="hidden" id="TF" value="0" />
<input type="hidden" id="JP" value="0" />

<script
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"
></script>
<!-- jquery -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"
></script>
<!-- 스크립트 -->

<script>
    var Enter_tripnum = 1; // 문제 번호 변수
    var Enter_trip_q = {
        1: {
            title: "Q1. <br/><br/>이번 여행지는?",
            type: "EI",
            Enter_trip_test_A: "다양한 액티비티 활동을 즐길 수 있는 여행지 !",
            Enter_trip_test_B: "자연을 바라보면 휴양하는 여행지 !",
            EntertripQnum: "1/12",
        },
        2: {
            title: "Q2. <br/><br/>여행에서 포기할 수 없는 것은?",
            type: "EI",
            Enter_trip_test_A: "처음 경험하는 짜릿한 이색 체험",
            Enter_trip_test_B: "안락함을 주는 예쁜 숙소!",
            EntertripQnum: "2/12",
        },
        3: {
            title: "Q3. <br/><br/>여행 도중 다른 여행객이 말을 걸었다.",
            type: "EI",
            Enter_trip_test_A: "경청하고 아는 만큼 대답해주다가 Tmi 남발 ~",
            Enter_trip_test_B: "살짝 대답해주고 길어질 것 같으면 도망간다. ",
            EntertripQnum: "3/12",
        },
        4: {
            title: "Q4. <br/><br/>식당에서 나오는 노래를 들을 때,<br/> 나는 ",
            type: "SN",
            Enter_trip_test_A: "멜로디가 좋으니 일단 플레이리스트에 저장",
            Enter_trip_test_B:
                "노래를 듣다 보니 가사가 너무 좋다. 플레이리스트에 저장.",
            EntertripQnum: "4/12",
        },
        5: {
            title: "Q5. <br/><br/>드디어 여행가기 전날 ! ",
            type: "SN",
            Enter_trip_test_A:
                "들뜬 마음으로 숙소와 식당 예약 현황을 <br/>한 번 더 확인하고 취침!",
            Enter_trip_test_B:
                "여행 중 일어날 일들을 상상하다가<br/> 일어나지도 않을 걱정을 하다가 취침!",
            EntertripQnum: "5/12",
        },
        6: {
            title: "Q6. <br/><br/>패러글라이딩을 하기 전 나는 ",
            type: "SN",
            Enter_trip_test_A:
                "아 재밌겠다. 얼마나 높은 곳에서 뛰어 내리는 거지? ",
            Enter_trip_test_B:
                "도중에 갑자기 안전장치가 망가져서 떨어지게 된다면..? 이대로 북한으로 간다면..??!",
            EntertripQnum: "6/12",
        },
        7: {
            title:
                "Q7. <br/><br/>여행 계획을 세우는 도중 친구의 <br/> '생각해볼게' 대답에 대한 나의 생각은?",
            type: "TF",
            Enter_trip_test_A: "말 그대로 '좀 더 고민 해볼게'",
            Enter_trip_test_B: "에둘러 말한 '거절할게'",
            EntertripQnum: "7/12",
        },
        8: {
            title:
                "Q8. <br/><br/>열심히 찾아본 맛집이 <br/> 생각보다 별로였을 때",
            type: "TF",
            Enter_trip_test_A:
                "결과적으로는 맛있지 않았으니<br/> 찾아본 시간이 아깝다고 생각한다. ",
            Enter_trip_test_B:
                "나중에 또 안 가면 돼!! <br/>열심히 했다는게 중요하지!",
            EntertripQnum: "8/12",
        },
        9: {
            title:
                "Q9. <br/><br/>여행지 숙소에 대한 <br/> 친구와의 생각이 너무 다르다. ",
            type: "TF",
            Enter_trip_test_A:
                "내 생각을 전달하며 <br/>친구와 이야기하는 시간을 가진다. ",
            Enter_trip_test_B:
                "계속 다른 의견으로 대화하면 <br/>감정이 상할 수 있으니까 친구의 의견에 따른다.",
            EntertripQnum: "9/12",
        },
        10: {
            title: "Q10. <br/><br/>여행을 떠날 때 나는 ",
            type: "JP",
            Enter_trip_test_A: "여행지, 숙소부터 경비까지 계획은 필수 ! ",
            Enter_trip_test_B:
                "최소한의 계획은 세우지만 중간에 궁금한게 생기면 계획은 흐린눈..",
            EntertripQnum: "10/12",
        },
        11: {
            title:
                "Q11. <br/><br/>조식을 신청했는데 <br/> 늦잠을 자서 못 먹었을 때 나는 ",
            type: "JP",
            Enter_trip_test_A:
                "내일부터는 꼭 시간에 맞춰 일어나<br/>조식을 먹고 시작해야지!",
            Enter_trip_test_B: "역시 난 조식을 먹기에는<br/> 너무 힘들어..",
            EntertripQnum: "11/12",
        },
        12: {
            title:
                "Q12. <br/><br/>여행 중 너무 갖고 싶은 물건이 생겼을 때,<br/> 나는",
            type: "JP",
            Enter_trip_test_A:
                "물건을 구매하는 건 계획에 없는 소비이므로 참는다.",
            Enter_trip_test_B: "여행 경비고 뭐고 갖고 싶으므로 일단 산다.",
            EntertripQnum: "12/12",
        },
    };
    var result = {
        ISTJ: {
            img: "/img/Enter_trip_test/Enter_trip_test_gyeongju(ISTJ).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip:
                "신라의 역사와 문화를 <br/> 고스란히 담고 있는 유적 지구 ",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 계획적으로 움직이며, 꼼꼼하게 여행지에 대해 공부해가는 걸 좋아해요. <br/> · 장기 유럽 여행도 무리없이 소화 가능하며, 유적이 많은 여행지 역사 탐방을 즐겨요. <br/> · 스스로 여행 일정을 계획하고, 정리하는 스타일이에요. <br/> · 사람 많은 곳, 시끄러운 곳을 별로 좋아하지 않아요. ",
            explain_tourist: "경주 역사유적지구 <br/>",
            explain_tourist_1:
                "경주역사유적지구에는 조각, 탑, 사지, 궁궐지, 왕릉, 산성을 비롯해 신라 시대의 여러 뛰어난 불교 유적과 생활 유적이 집중적으로 분포되어 있어요. 2000년 12월 세계유산으로 등재된 경주역사유적지구는 신라의 역사와 문화를 한눈에 파악할 수 있을 만큼 다양한 유산이 산재해 있는 종합역사지구입니다.    <br/> 위치 : 경상북도 경주시 일대",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 월성지구 - ‘동양 최고(最古)의 천문대’ 첨성대 <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 신라 제27대 선덕여왕 때 건립된 것으로 추정되며 경주를 상징하는 랜드마크 중 하나로, 첨성대를 이루는 돌의 의미를 알아보는 건 어떨까요?  ",
            explain_tourlist_recommend2:
                " ● 황룡사지구 - '원효대사의 흔적을 찾을 수 있는 유서 깊은 신라시대의 명찰' 분황사 <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 우리 민족이 낳은 위대한 고승 원효와 자장이 거쳐간 사찰로 명성이 높은 분황사를 둘러보는 걸 추천드려요.",
            explain_tourlist_recommend3:
                "● 신라 왕을 비롯한 고분군 분포지역인 대릉원 지구",
            tourlist_recommend_explain3:
                " &nbsp; - 대릉원 지구의 신라 왕, 왕비, 귀족 등 높은 신분계층의 무덤과 당시의 생활상을 파악할 수 있는 귀중한 유물들을 알아보는 건 어떨까요?",
        },
        ISTP: {
            img: "/img/Enter_trip_test/Enter_trip_test_Ulleung-gun(ISTP).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "울릉도 북서쪽 3대 전망 명소",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 예기치 못한 상황동 무난히 해결하는 융통성 있는 여행자. <br/> · 현실적이지만 대담한 면모가 있어요. <br/> · 평소에는 내성적이지만, 여행지에서는 대담한 모습을 보이는 스타일에요. <br/> · 호불호가 강하고, 틀에 박힌 걸 싫어해요. ",
            explain_tourist: "울릉도 대풍감 <br/>",
            explain_tourist_1:
                "향나무의 원종이 이곳에 그대로 남아 있어 학술적 가치또한 높으며 향나무 마다 갖가지 아름다운 모양을 하고 있으며 괭이갈매기들의 서식지로도 유명하고, 1962년 12월 3일 천연기념물 제49호로 지정되었어요.    <br/> 위치 : 서면 태하리",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 확 트인 바다 전망 - “태하향목모노레일 <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 우리나라 10대 비경’으로 꼽힐 정도로 아름다운 대풍감의 절벽을 “태하향목모노레일”을 타고 보러 가보는 건 어떨까요?",
            explain_tourlist_recommend2:
                " ● 바람을 기다리는 언덕 - 대풍감 전망대 <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 없이 펼쳐져 있는 바다 위로 송곳봉과 코끼리바위를 보고, 자연이 보여줄 수 있는 최대한의 빛깔과 위대한 절경이 어우러져 대풍감 전망대에서 황홀함을 느껴보세요!",
            explain_tourlist_recommend3: "● 바다 바람을 느끼며 걷는 해안산책길",
            tourlist_recommend_explain3:
                " &nbsp; - 대풍감 전망대에서 내려올 때에는 모노레일 대신 해안 산책로를 통해 다양한 모양의 지층과 화산암으로 이뤄 독특한 지형을 보면서 자유를 느껴보는 건 어떨까요?",
        },
        ISFJ: {
            img: "/img/Enter_trip_test/Enter_trip_test_Jeonju(ISFJ).png",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "가장 한국적인 도시, <br/> 전주 한옥마을",
            explain_title: "#나의 여행 스타일은",
            explain:
                " · 계획적으로 움직이며 동행을 챙기는 스타일의 여행자. <br/> · 함께 가는 친구들의 의견을 모아서 일정을 섬세하게 정리하는 <br>&nbsp;스타일이에요. <br/> · 감성적이며 가성비 좋은 여행지를 좋아해요. <br/> · 적은 동선으로 여행하기 편한 여행지 선호해요.",
            explain_tourist: "전주 한옥마을은 <br/>",
            explain_tourist_1:
                " 전주한옥마을은 전주 풍남동 일대에 700여 채의 한옥이 군락을 이루고 있는 국내 최대 규모의 전통 한옥촌이며, 전국 유일의 도심 한옥군입니다. <br/> 위치 : 전주시 완산구 풍남동·교동일대",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 가장 품격 있는 전통 문화연수와 교육을 진행하는 공간 <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 전주 전통문화연수원에서 다양한 교육을 체험해보세요! <br/>  &emsp;(전주시 완산구 향교길 119-6)",
            explain_tourlist_recommend2:
                " ● 별별체험단과 함께하는<한옥마을 낭만체험 스탬프투어> <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 스탬프투어 성공 시 원하는 체험을 즉시 1만원 할인!",
            explain_tourlist_recommend3:
                "● 이야기꾼들의 재치만점 - 수복청 상설공연 단막창극",
            tourlist_recommend_explain3:
                " &nbsp; - 전주의 대표 문화유산인 경기전 속의 수복청에서 펼쳐지는 <br/> &emsp; 판소리 다섯바탕 中 춘향가, 홍보가, 심청가! '경기전 입장 시 <br/> &emsp;무료로 관람 가능'",
        },
        ISFP: {
            img: "/img/Enter_trip_test/Enter_trip_test_danyang(ISFP).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "하늘을 날아 단양을 보다,<br/> 패러글라이딩",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 새로운 것을 시도할 준비가 된 예술가 타입의 여행자. <br/> · 다만 종종 혼자만의 느긋한 시간 추구해요. <br/> · 조식이 맛있거나 일몰, 일출이 아름다운 숙소처럼 디테일을 중요시하는 스타일이에요. <br/> · 풍경을 구경하는 걸 좋아해요. ",
            explain_tourist: "단양 패글라이딜은 <br/> ",
            explain_tourist_1:
                " 국내 유일 단양 유일의 양방산은 대한민국 최고의 패러글라이더 장”으로, 동쪽은 소백산이 병풍처럼 펼쳐져있고, 비로봉, 연화봉, 천문대 등을 볼 수 있으며 서쪽으로는 충주호를 낀 금수산 줄기가 우람하게 늘여져 있다. <br/> 위치 : 충북 단양군 단양읍 별곡10길3 1층 양방산패러글라이딩",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● “단양 하늘을 나는 내 모습” - 동영상 촬영 <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 비행할 때 생각지 못한 자신의 모습과 하늘에서 바라본 단양의 멋진 풍경을 담은 추억을 동영상으로 남겨보세요!",
            explain_tourlist_recommend2:
                " ● “정제된 아름다움이 돋보이는 석팁” - 단양 향산리 삼층석탑  <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 패러글라이딩을 마치고, 1964년 보물 베405호로 지정된 남북국시대 통일신라의 일반형 석조 불탑의 단정한 모양의 소박하지만 아름다운 단양 향산리 삼층석탑을 만나보세요!",
            explain_tourlist_recommend3:
                "● “온달장군과 평강공주의 이야기를 담은 곳” - 온달관광지",
            tourlist_recommend_explain3:
                " &nbsp; - 고구려의 명장 온달장군과 평강공주의 전설을 테마로 한 온달전시관을 비롯하여 온달산성, 온달동굴 등 명승지를 모아놓은 관광지로 다른 곳에서 보기 어려운 볼거리인 중국풍의 이국적인 정원을 거닐어보는 건 어떨까요?",
        },
        INTJ: {
            img: "/img/Enter_trip_test/Enter_trip_test_sacheon(INTJ).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "낮에는 자연이 <br/> 밤에는 조명이 아름다운 곳",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 철두철미하게 미리 계획 세우는 걸 좋아해요. <br/> · 박물관, 미술관 등에서 깊고 넓은 지식을 쌓는데 즐거움을 <br/>&nbsp;느껴요. <br/> · 여행지를 검색한 후, 여행지의 역사부터 기후 그리고 이슈까지 파악하는 스타일이에요. <br/> · 감정에 휘둘리는 걸 좋아하지 않아요.",
            explain_tourist: "삼천포대교공원 <br/>",
            explain_tourist_1:
                " 1995년 2월 착공하여 2003년 4월에 완공하여 개통하였으며 사천시내를 지나 삼천포로 들어서면 시원한 바다 내음이 나를 반기는 것 같은 착각을 하게 만들 만큼 푸르고 맑은 바다가 있는데 그 위에 아기자기 섬들의 가교 역할을 하는 다리가 있는데 그곳이 바로 창선·삼천포 대교입니다.  <br/> 위치 : 경상남도 사천시 사천대로 17",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 최적화된 산책 & 드라이브 코스! <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 삼천포대교공원은 밤낮 상관없이 가족과 함께 드라이브는 물론 산책하기 좋은 곳이에요. ",
            explain_tourlist_recommend2:
                " ● 깨끗한 바다, 고운 모래가 있는 <남일대해수욕장> <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 삼천포대교공원에서 산책을 즐긴 후 코끼리바위가 잘 보이는 남일대해수욕장에서 맑고, 깨끗한 바다를 즐겨보는 걸 추천드려요!",
            explain_tourlist_recommend3: "● 숨어있는 아름다운 항구, 대방진 굴항",
            tourlist_recommend_explain3:
                " &nbsp; - 고려시대 말 남해안에 자주 침입했던 왜구를 막기 위해 설치한 군항 시설의 하나로 임진왜란 때에는 충무공 이순신 장군이 수군 기지로 이용하였다 하는 대방진 굴항의 아름다운 풍경과 역사를 느껴보아요!",
        },
        INTP: {
            img: "/img/Enter_trip_test/Enter_trip_test_damyang(INTP).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "대숲, 대통밥, 떡갈비의 3단 콤보 <br/> 담양 죽녹원",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 철학, 사색, 아이디어에 목마른 타입의 여행자. <br/> · 무언가 생각할 수 있게 하는 여행지에서의 사색을 즐겨요. <br/> · 가장 효율적인 이동 수단을 먼저 고민하는 스타일이에요. <br/> · 타인에게 피해주는 걸 싫어하고, 타인에게 별로 관심이 없어요. ",
            explain_tourist: "담양 죽농원은 <br/>",
            explain_tourist_1:
                " 죽녹원은 관방제림과 영산강의 시원인 담양천을 끼고 있는 향교를 지나면 바로 왼편에 보이는 약 16만㎡의 울창한 대숲입니다.  <br/> 위치 : 전라남도 담양군 담양읍 죽녹원로 119",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1: " ● 삼림욕보다 좋은 죽림욕  <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 죽녹원 입구에서 돌계단을 하나씩 하나씩 밟고 오르며 굳어있던 몸을 풀리고 대나무 사이로 불어오는 대바람이 일상에 지쳐있는 심신에 청량감을 불어 넣어주는 건 어떨까요? ",
            explain_tourlist_recommend2:
                " ● 고려초부터 전해진 마을의 큰 행사 – “죽취일(竹醉日)” <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 담양 지역에서는 비가 많이 오는 시기 음력 5월 13일을 죽취일(竹醉日)로 정해 마을 주변에 대나무를 심고 죽엽주를 마시는 마을의 큰행사의 역사를 알아보고 죽녹원을 둘러보는 건 어떨까요?",
            explain_tourlist_recommend3:
                "● 죽녹원 탐방은 후문 정자원림 구역까지!",
            tourlist_recommend_explain3:
                " &nbsp; - 조선중기 국문학사를 찬란하게 꽃피웠던 송강 정철을 비롯한 수많은 문인들이 정자문화를 배경으로 시조, 가사 등의 주옥같은 작품을 남긴 곳으로, 면양정, 식영정, 광풍각, 송강정, 명옥헌원림 등 우리나라를 대표하는 쟁쟁한 담양의 정자들을 실물 크기로 재현해 놓았으니 죽농원의 후문도 탐방해보세요!",
        },
        INFJ: {
            img: "/img/Enter_trip_test/Enter_trip_test_wanju(INFJ).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 어울리는 <br/> 국내 여행지는?",
            Enter_trip: "기암괴석과 수목이 <br/>한데 어우러져 산세가 수려한 곳",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 새로운 사람과 스스럼없이 어울리지만 사실 혼자만의 시간을 중요하게 생각해요. <br/> · 잔잔한 힐링이 필요한 여행을 좋아해요. <br/> · 숙소에서는 뭘 할지, 영화를 본다면 어떤 영화를 볼지 고민하는 스타일이에요. <br/> · 혼자 뭐할 지 계획 세우는 걸 좋아해요. ",
            explain_tourist: "대둔산 도립공원은 <br/>",
            explain_tourist_1:
                " 노령산맥 줄기가 김제의 만경평야를 향하다 독립된 산군을 이루며 절경을 이룬 곳이 대둔산입니다. 마천대에서 북쪽 능선을 따라 낙조대에 이르는 구간은 특히 장관으로 이 낙조대에서 바라보는 일출,일몰 광경이 일품입니다.  <br/> 위치 : 전라북도 완주군 운주면 611-71",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1: " ● 대둔산 도립공원이 처음이라면 <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - “주차장 - 마천대 - 용문골(4.2km, 3시간) 등산 코스” 추천! ",
            explain_tourlist_recommend2: " ● 대둔산 도립공원 케이블카 <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 등산이 힘들다면 대둔산 도립공원 케이블카를 이용하여 <br/>&nbsp;대둔산의 풍경과 금강구름다리 + 삼선계단을 구경해보세요!",
            explain_tourlist_recommend3:
                "● 진산의 태고사, 운주의 안심사, 벌곡의 신소운사",
            tourlist_recommend_explain3:
                " &nbsp; - 대둔산에 남아있는 유서 깊은 절인 <br/> &nbsp;<진산의 태고사, 운주의 안심사, 벌곡의 신소운사> 방문을 추천드려요!",
        },
        INFP: {
            img: "/img/Enter_trip_test/Enter_trip_test_Daewallyeong(INFP).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "한국의 알프스 - 대관령양떼목장",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 최악의 상황에도 긍정적으로 더 나은 상황을 만들고자 노력해요. <br/> · 높은 인내심으로 고난이도 여행지 소화도 무리 없어요. <br/> · 여행 전 갈까 말까 고민하지만, 결국 떠밀려서 가도 즐겁게 다녀오는 스타일이에요. <br/> · 시, 소설 등 문학 작품을 좋아해요. ",
            explain_tourist: "대관령 양떼 목장은<br/>",
            explain_tourist_1:
                " 농림부에서 지정한 동물복지와 산림보존에 특화된 산지생태축산 목장으로 어떻게 하면 양들이 건강하게 자랄 수 있는지 가장 잘 알고 항상 사람과 자연 그리고 동물이 함께하는 프로그램을 운영하고 있어요.  <br/> 위치 : 강원도 평창군 대관령면 대관령마루길 483-32",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 아름다운 야생화의 모습을 볼 수 있는 “습지산책로” <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - “오랜 세월 동안 생성된 습지에서 자생하는 야생 식물들을 관람할 수 있고, 계절마다 피고 지는 아름다운 야생화의 모습을 감상하 수 있는 습지산책로를 걸어보세요!",
            explain_tourlist_recommend2:
                " ● 초지에서 풀 뜯는 양떼 만나기 - “양 먹이주기 체험” <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 건초 먹이주기 체험을 통해서 귀여운 양떼를 직접 눈 앞에서 보며, 양들과 가까이 만날 수 있는 특별한 체험의 시간과 즐거운 추억을 만들어보는 건 어떨까요?",
            explain_tourlist_recommend3: "● 향기의 고향 평창 - “허브나라농원”",
            tourlist_recommend_explain3:
                " &nbsp; - 대관령 양떼 목장을 체험 후 색색의 허브와 꽃이 피는 팔레트 가든, 셰익스피어 가든, 꿀이 많아 벌과 나비가 좋아하는 밀원식물을 심은 나비 가든 등 특색이 뚜렷한 허브나라를 즐겨보아요!",
        },
        ESTJ: {
            img: "/img/Enter_trip_test/Enter_trip_test_Seoul(ESTJ).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 어울리는 <br/> 국내 여행지는?",
            Enter_trip: "도심 속 로맨틱 아일랜드 <br/> N 서울타워",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 호불호가 확실하며 깔끔하게 짜여지는 여행 스타일 선호해요. <br/> · 다양한 선택지가 준비된 여행을 좋아헤요. <br/> · 여행 계획이 틀어지려는 직감이 오면 화가 치밀어 오르는 스타일이에요. <br/> · 빠르고 정확한 결정을 내리는 것을 좋아헤요. ",
            explain_tourist: "서울 N 서울타워는 <br/>",
            explain_tourist_1:
                " 구름과 맞닿은 곳에서 남산의 자연과 21세기 첨단기술이 만들어낸 절묘한 조화, 여유로운 휴식과 다양한 문화가 함께하는 서울의 복합문화공간이에요.  <br/> 위치 : 서울특별시 용산구 남산공원길 105(용산동2가)",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● N서울타워에서 봄 기운을 가득 느껴보세요! - “봄N페스티벌” <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 한눈에 담기에 벅찬 아름다운 서울 도심의 봄향기를 맡으며, 서울 도심보다 온도가 2~3도 가량 낮아 서울에서 가장 오랫동안 벚꽃을 관람할 수 있어요. ",
            explain_tourlist_recommend2:
                " ● 남산 만남의 광장 - “남산 팔각정” <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 남산 정산에 세워져 있는 팔각정에서 서울시가가 눈아래 펼쳐지는 풍경을 만나보세요!",
            explain_tourlist_recommend3:
                "● 한옥이 보존되어 있는 마을 - “남산골한옥마을”",
            tourlist_recommend_explain3:
                " &nbsp; -  옛 가옥을 복원해 놓은 남산골한옥마을 안으로 들어서면 연못 청학지와, 그 곁에 있는 천우각 광장을 지나 돌계단을 오르면 서울 곳곳에 있던 한옥이 이전·복원되어 옛 사람들의 생활방식을 볼 수 있는 예스러운 공간을 볼 수 있어요.",
        },
        ESTP: {
            img: "/img/Enter_trip_test/Enter_trip_test_Jeju(ESTP).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 어울리는 <br/> 국내 여행지는?",
            Enter_trip: "동양 최대 규모의 동백 수목원 <br/> 카멜리아힐",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 먹고 놀기 휴식하기 등 동시에 다양한 니즈를 만족시킬 수 있는 여행지를 선호헤요. <br/> · 여행지에서 먹거나 사용한 아이템을 사업으로 구상하는 스타일이에요. <br/> · 자기주장이 강하고, 사람들과 어울려 노는 걸 좋아해요. <br/> · 솔직하고, 적극적이고 열정적이에요. ",
            explain_tourist: "제주도 카멜리아힐은 <br/>",
            explain_tourist_1:
                " 30년 열정과 사랑으로 제주의 자연을 담은, 동양에서 가장 큰 동백 수목원으로 제주자생식물 250여종을 비롯해 모양과 색깔, 향기가 각기 다른 다양한 꽃이 동백과 어우러져 계절마다 독특하고 아름다운 풍경을 만나볼 수 있어요. <br/> 위치 : 제주특별자치도 서귀포시 안덕면 병악로 166",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 자연을 만끽할 수 있는 장소 – 산방산 <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 산방산은 워낙 산 자체의 높이가 높고 해안에 접해있어서 구름이 산머리에 걸려 있거나 휘몰아치는 광경을 종종 목격할 수 있어요.",
            explain_tourlist_recommend2:
                " ● 시간이 보여주는 위대함 속으로 - “용머리해안”<br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 신방산 앞자락에 있는 바닷가로, 수천만년 동안 쌓이고 쌓여 이루어진 사암층 중 하나로 해안 절벽을 모진 파도가 때려서 만들어 놓은 해안 절경을 만나볼 수 있어요.",
            explain_tourlist_recommend3:
                "● 깨끗한 모래와 푸른 바다가 어우러져 아름다운 해변 - “사게해변”",
            tourlist_recommend_explain3:
                " &nbsp; - 산방산 바로 아래쪽에 자리한 해변으로 한적하고 조용한 것이 특징이에요. 사계해변에서 형제섬, 산방산과 한라산, 용머리해안까지 조망이 가능하고, 깨끗하고 모래와 푸른 바다가 어우러져 아름다운 풍경을 만나보세요!",
        },
        ESFJ: {
            img: "/img/Enter_trip_test/Enter_trip_test_Gangneung1(ESFJ).jpg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "몰입형 미디어아트 전시관<br/> 강릉 아르떼뮤지엄",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 동행을 세심하게 배려하는 타입의 여행자. <br/> · 예기치 못한 상황에 걱정이 많은 편이라, 코스 짜기 명확하고 쉬운 여행지를 선호해요. <br/> · 뛰어난 공감능력으로 리액션이 좋아요. <br/> ·   리액션이 좋아서 친구가 공유한 여행 내용을 모두 호응해주는 스타일이에요. ",
            explain_tourist: "여행지에 대한 설명(코스) ",
            explain_tourist_1:
                "  강릉 경포호 인근에서 선보이는 세 번째 몰입형 미디어아트 상설 전시관이에요. 관동팔경의 으뜸인 강릉에서 밸리(VALLEY)라는 테마로 백두대간의 중추인 강원도와 강릉의 지역적 특성을 반영한 미디어아트 전시를 만나보세요!  <br/> 위치 : 강원도 강릉시 난설헌로 131",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 고려시대 관리나 내빈을 대적하고 묵게 하던 시설 - “강릉 임영관 삼문” <br/>",
            tourlist_recommend_explain1:
                " &nbsp; -  고려 태조 19년(936년)에 세워진 목조건물로 그 무게 있고 두터워 보이는 아름다움과 섬세한 솜씨가 고려시대의 대표적인 건축물로 인정되어, 국보로 지정되었어요. 건축물의 유래를 찾아보세요!",
            explain_tourlist_recommend2:
                " ● 전통 건축의 아름다움을 보여주는 가옥 <br/> - “강릉 심상진가옥” <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 대문이 없는 “ㅁ”자 배치로 17세기에 건축된 것으로 추정되고 있으며, 해운정과 담 하나를 사이에 두고 있아요. 주위의 해운정과 함께 건축의 아름다운 경관을 만나보세요!",
            explain_tourlist_recommend3:
                "● 바리스타가 추천하는 3가지 커피를 동시에 맛볼 수 있는 <br/> - “테라로사 커피공장",
            tourlist_recommend_explain3:
                " &nbsp; - 한국 커피 전문가 1세대가 운영하는 카페 겸 커피공장으로 바리스타가 추천하는 3가지 커피를 동시에 맛볼 수 있는 ‘커피 테이스팅 코스’가 유명해요. 좀처럼 만나기 어렵고 값비싼 커피들을 부담없이 즐겨보세요!",
        },
        ESFP: {
            img: "/img/Enter_trip_test/Enter_trip_test_gangneung(ESFP).png",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "푸른 해송숲과 바다가 펼쳐진 최고의 휴양호텔",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 즉흥적인 즐거움을 추구하며 스포트 라이트를 즐기는 여행자. <br/> · 시끌벅적한 분위기에서 에너지가 상승해요. <br/> · 함께 가는 여행 메이트에게 맛집 링크를 공유하는 스타일이에요. <br/> · 틀에 박힌 것을 좋아하지 않고, 계획을 따라 일을 진행하는 것을 힘들어해요. ",
            explain_tourist: "강릉 세인트존스 호텔은 <br/>",
            explain_tourist_1:
                " 2018 평창 동계올림픽 정상을 맞이한 호텔로, 바다 위의 바다를 연상시키는 인피니티풀, 해송숲을 바라보며 힐링 할 수 있는 다양한 부대시설을 갖추고 있어요. <br/> 위치 : 강원도 강릉시 창해로 307",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 돔이 열리면 끝없는 수평선이 펼처진다! - “세인트존스-인피니티 풀” <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 사계절 언제나 수영을 즐길 수 있고, 돔 형태로 실내 공간과 실외공간이 있어 다양하게 물놀이를 즐길 수 있어요!",
            explain_tourlist_recommend2:
                " ● 가족 단위로 피서를 즐기기에 적합한 곳 - “영진해변” <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 바다 냄새가 물신 풍기는 작은 바닷가 마을로 조용하고 고요한 아름다움을 자랑하며 작고 단순한 해안선을 자랑해요. 영진항은 좋은 물고기들이 많이 잡히는 곳으로 유명해 배낚시를 도전해보는 건 어떨까요?",
            explain_tourlist_recommend3:
                "● 신사임당과 율곡이이의 생가 - “오죽헌”",
            tourlist_recommend_explain3:
                " &nbsp; - 조선시대의 대학자 율곡 이이와 관련하여 유명해진 강릉지역의 대표적인 유적지로, 조선 초기의 건축물로 건축사적인 면에서 중요성을 인정 받아 1963년 보물로 지정되었어요. ",
        },
        ENTJ: {
            img: "/img/Enter_trip_test/Enter_trip_test_dangjin(ENTJ).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "레트로 분위기가 물씬 풍기는 <br/> 추억의 놀이동산 ",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 동행 중에서 리더 격으로 여행을 이끌며, 효율적인 여행을 이끌어내요. <br/> · 넓은 범위의 여행지도 효율적을 여행하는 비범한 능력을 지니고 있어요. <br/> · 여행지에서 문제가 발생하면 빠르게 역할 분담을 잘 하는 스타일이에요. <br/> · 지적인 자극을 주는 새로운 아이디에서 관심이 많아요. ",
            explain_tourist: "삽교호 놀이동산은 <br/>",
            explain_tourist_1:
                " 아름다운 서해와 서대해교가 보이는 곳에 위치해 있으며, 야경까지 즐길 수 있는 곳으로 대관람차, 바이킹, 디스코, 회전목자 등의 부대시설을 갖추고 있는 소규모 놀이공원으로 아기자기 하고 레트로 분위기가 물씬 풍겨 인생샷을 남기기에도 좋은 곳이에요.  <br/> 위치 : 충청남도 당진시 신평면 삽교천3길 15",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 한국 최조의 사제인 성 김대건 안드레아 신부의 탄생지 - “솔뫼성지” <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - “솔뫼”는 충청도에서 제일 좋은 땅 “내포” 한가운데 자리하고 있으며, “소나무가 우거진 작은 동산”이라는 뜻을 가지고 있어요. 기념관에서 김대건 신부와 솔뫼성지에 대해 자세히 알아보는 건 어떨까요?",
            explain_tourlist_recommend2:
                " ● 해군과 해병의 역사와 문화를 체험할 수 있는 이색적인 공간 - “당진 항만관광공사”<br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 대양을 호령하던 우리의 자랑스런 군함이 명예로운 퇴역과 함께 삽교호 함상공원에 해군과 해병의 역사와 문화를 체험할 수 있는 이색적인 공간에서 해군·해병의 주제별 전시관, 항공기 등 바다에 대한 동경과 해군·해병의 친밀감을 느낄 수 있어요.",
            explain_tourlist_recommend3:
                "● 소와 함께하는 낙농 체험의 장 - “아그로랜드 태신 목장”",
            tourlist_recommend_explain3:
                " &nbsp; - 른 초원에서 느낄 수 있는 목가적인 풍경과 소와 함께하는 체험의 장을 제공하고, 체험실에서 소젖을 직접 짜 볼 수 있고, 푸른 초원에 나가 직접 소에게 풀에게 사료를 먹이고, 우유를 이용하여 아이스크림을 만들어 보는 등 다양한 낙농 체험을 해보세요!",
        },
        ENTP: {
            img: "/img/Enter_trip_test/Enter_trip_test_busan(ENTP).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip:
                "머리 위엔 모노레일, 발밑은 유리알 바다, <br/>달맞이길 달리는 해운대 블루라인파크 해변열차 ",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 느긋하고 관대한 타입의 여행자. <br/> · 위기 상황에서 판단을 잘하며 선입견없이 여행을 즐겨요. <br/> · 선택한 곳을 가야 하는 이유를 구구절절 설명하는 스타일이에요. <br/> · 임기응변에 능하고 말보다는 행동이 앞설 때가 있아요. ",
            explain_tourist: "해운대 블루라인파크 해변열차는 <br/>",
            explain_tourist_1:
                " 해운대와 송정 사이, 포구를 달리는 해변열차로 창문 너머 파도가 넘실대는 따뜻한 완행열차 안에 두 눈 가득 진짜 부산을 느낄 수 있어요.  <br/> 위치 : 부산광역시 해운대구 청사포로 116 청사포정거장 2F",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 해운대 블루라인파크 - 해변열차 <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 해운대에서 송정까지 이어지는 옛 동해남부선 철길은 한때 우리나라 기찻길 중에서도 차창 밖 바다풍경이 가장 예쁜 기차 노선 구간으로 알려져 있어요.해변열차를 타고 동해남부선 철길 풍경을 두 눈 가득 담아보세요. ",
            explain_tourlist_recommend2:
                " ● 해운대 블루라인파크 - 스카이캡슐 <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 미포정거장~달맞이터널500m 와 청사포정거장~다릿돌전망대600m 등 정거장마다 바다 전망을 느긋하게 즐기기에 제격인 스카이캡슐을 타고 부산의 풍경을 보는 건 어떨까요?",
            explain_tourlist_recommend3:
                "● 일출의 장관과 월출의 경이로움을 한자리에서 감상할 수 있는 곳 - “해월정”",
            tourlist_recommend_explain3:
                " &nbsp; - 달맞이길 중간에 위치한 해월정은 예부터 대한팔경의 하나이며 일출의 장관과 월출의 경이로움을 한자리에서 감상할 수 있어요. 해월정에서 매년 정월 대보름이면 와우산의 아름다운 전설로 많은 사람들이 이곳을 찾아와 소원을 빌어보세요!",
        },
        ENFJ: {
            img: "/img/Enter_trip_test/Enter_trip_test_sokcho(ENFJ).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip: "심신을 치유하는 공간 <br/> 속초 청초호 호수공원",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 사람을 좋아해 소통하는 여행을 추구해요. <br/> · 지역별 시장을 돌며 현지 분들과 친밀도 업하기도 최적화되어 있어요. <br/> · 추진력이 좋고, 열정적이에요. <br/> · 도라에몽 수준으로 여행 가방 안에 없는 준비물이 없는 스타일이에요. ",
            explain_tourist: "속초 청초호 호수공원은 <br/>",
            explain_tourist_1:
                " 호수를 바라보며 잘 조성된 공원은 테마별로 다양한 모습을 보여주며, 봄에는 튤립, 여름에는 마리나, 가을에는 국화, 겨울에는 설경으로 아름다운 호수로 공원 내에 위치한 ‘속초 엑스포타워’ 위로 올라가면 동해바다와 조도까지 볼 수 있어요.  <br/> 위치 : 강원도 속초시 청초호반로(교동,조양동)",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 굽이굽이 이어진 산봉우리를 따라 - “설악산 국립공원” <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 대청봉에 오르면 수려한 자연 경관을 품은 설악산 전경과 동해 바다를 조망할 수 있으며 특히 일출과 낙조가 일품으로 꼽혀요. 대청봉 이외도 소청봉, 화채봉, 중청봉 등 30여개의 산봉우리들이 웅장한 장관을 이루고 있는 설악산 국립공원에서 풍경을 감상해보세요. ",
            explain_tourlist_recommend2:
                " ● 동해의 햇살 받은 설악의 길목에 위치한 마을 - “속초 하도문 쌈채마을” <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 향토식당, 황토펜션 그리고 다양한 농촌체험 프로그램을 갖춘 ‘하도문 농촌 체험 종합 타운’을 운영하면서 볼거리, 먹거리 등 다양한 즐길거리들을 체험해보세요!",
            explain_tourlist_recommend3:
                "● 아름다운 자연의 조화와 싱싱하고 신선한 생선을 즐길 수 있는 - “대포항”",
            tourlist_recommend_explain3:
                " &nbsp; - 대규모 종합 관광어항 단지로 개발되어 많은 고급 생선들이 대포항을 거쳐가고 있어, 싱싱한 생선들을 쉽게 찾을 수 있어요. 대포항에서 신선한 해산물을 즐겨보세요!",
        },
        ENFP: {
            img: "/img/Enter_trip_test/Enter_trip_test_yangyang(ENFP).jpeg",
            Enter_trip_keyword: "나의 여행스타일과 <br/> 어울리는 국내 여행지는?",
            Enter_trip:
                "멋지게 파도를 가르며 미끄러져 내려오는 <br/> 서핑을 즐길 수 있는 곳",
            explain_title: "#나의 여행 스타일은",
            explain:
                "· 즉흥적인 즐거움을 추구하며 스포트 라이트를 즐기는 여행자. <br/> · 시끌벅적한 분위기에서 에너지가 상승해요. <br/> · 함께 가는 여행 메이트에게 맛집 링크를 공유하는 스타일이에요. <br/> · 틀에 박힌 것을 좋아하지 않고, 계획을 따라 일을 진행하는 것을 힘들어해요. ",
            explain_tourist: "양양 서피비치는 <br/>",
            explain_tourist_1:
                " 하조대해수욕장 북쪽에 조성한 1km의 서핑 전용 해변으로, 서핑만을 위한 해변으로는 국내 처음이에요. 이국적인 풍광에서 서핑과 함께 비치 파티, 캠핑을 동시에 경험할 수 있어요.  <br/> 위치 : 강원도 양양군 현북면 하조대하안길 119",
            explain_tourlist_recommend: "코스 추천!",
            explain_tourlist_recommend1:
                " ● 서퍼들이 꼽는 서핑 3대 성지 - “강원도 양양 서피비치” <br/>",
            tourlist_recommend_explain1:
                " &nbsp; - 해변을 따라 기암절벽과 노송이 어우진 그림과 같은 풍공은 물론, 암초 하나 없이 평단하게 펼쳐지는 백사장에는 늘 힘찬 파도가 밀려와 서핑에 제격으로 초보 서퍼도 서핑을 즐길 수 있어요!",
            explain_tourlist_recommend2:
                " ● 서핑하지 않아도 보낼 수 있는 힐링의 시간  <br/>",
            tourlist_recommend_explain2:
                "&nbsp; - 서피비치는 1km 구간의 해변에 서핑 전용 해변과 스위밍존, 빈백존, 해먹존, 칠링존 등 휴식할 수 있는 공간으로 구성되어 있어 해변의 다양한 편의시설을 이용하면서 즐겁게 시간을 보내는 건 어떨까요?",
            explain_tourlist_recommend3: "● 일몰 후 즐기는 서피비치",
            tourlist_recommend_explain3:
                " &nbsp; - 한낮에 서핑이 있었다면, 해가 지고 난 서피비치에는 차가운 음료수 혹은 맥주 한 잔의 여유로움을 즐기는 애프터 파티가 기다리고 있어요!",
        },
    };

    function Enter_trip_start() {
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
            $("#EI").val() < 2
                ? (Enter_mbti_trip += "I")
                : (Enter_mbti_trip += "E");
            $("#SN").val() < 2
                ? (Enter_mbti_trip += "N")
                : (Enter_mbti_trip += "S");
            $("#TF").val() < 2
                ? (Enter_mbti_trip += "F")
                : (Enter_mbti_trip += "T");
            $("#JP").val() < 2
                ? (Enter_mbti_trip += "P")
                : (Enter_mbti_trip += "J");
            alert("결과 확인하기");

            $("#img").attr("src", result[Enter_mbti_trip]["img"]);
            $("#Enter_trip").html(result[Enter_mbti_trip]["Enter_trip"]);
            $("#Enter_trip_keyword").html(
                result[Enter_mbti_trip]["Enter_trip_keyword"]
            );
            $("#explain_title").html(result[Enter_mbti_trip]["explain_title"]);
            $("#explain").html(result[Enter_mbti_trip]["explain"]);
            $("#explain_tourist").html(
                result[Enter_mbti_trip]["explain_tourist"]
            );
            $("#explain_tourist_1").html(
                result[Enter_mbti_trip]["explain_tourist_1"]
            );
            $("#explain_tourlist_recommend").html(
                result[Enter_mbti_trip]["explain_tourlist_recommend"]
            );
            $("#explain_tourlist_recommend1").html(
                result[Enter_mbti_trip]["explain_tourlist_recommend1"]
            );
            $("#tourlist_recommend_explain1").html(
                result[Enter_mbti_trip]["tourlist_recommend_explain1"]
            );
            $("#explain_tourlist_recommend2").html(
                result[Enter_mbti_trip]["explain_tourlist_recommend2"]
            );
            $("#tourlist_recommend_explain2").html(
                result[Enter_mbti_trip]["tourlist_recommend_explain2"]
            );
            $("#explain_tourlist_recommend3").html(
                result[Enter_mbti_trip]["explain_tourlist_recommend3"]
            );
            $("#tourlist_recommend_explain3").html(
                result[Enter_mbti_trip]["tourlist_recommend_explain3"]
            );
        } else {
            $(".progress-bar").attr(
                "style",
                "width: calc(100/12*" + Enter_tripnum + "%)"
            );
            $("#trip_title").html(Enter_trip_q[Enter_tripnum]["title"]);
            $("#EntertripQnum").html(
                Enter_trip_q[Enter_tripnum]["EntertripQnum"]
            );
            $("#type").val(Enter_trip_q[Enter_tripnum]["type"]);
            $("#Enter_trip_test_A").html(
                Enter_trip_q[Enter_tripnum]["Enter_trip_test_A"]
            );
            $("#Enter_trip_test_B").html(
                Enter_trip_q[Enter_tripnum]["Enter_trip_test_B"]
            );
            Enter_tripnum++;
        }
    }
</script>
<!-- addthis code / sns 공유 기능 -->
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-62f6d80e58d7a901"></script>
</body>
</html>