<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter_animal_test</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">  <!-- 부트스트랩 4.5 -->
    <link rel="stylesheet" type="text/css" href="/css/Entertainment/Enter_test.css">
</head>

<body class="container">
<!-- 시작 화면 -->
<article class="ani_start">
    <div class="mt-4 Enter_ani_test_title">너나들이</div>
    <img class="Enter_image mb-5" src="/img/Enter_animal_test/Enter_ani_test_title.jpg"></img>
    <h1 class="mt-5 text-center">반려견 유형 테스트</h1>
    <h5 class="mt-4" style="text-align: center; margin: 0px 0px 15px 0px">
        나의 반려견 유형은?
    </h5>
    <button
            type="button"
            class="btn btn-outline-secondary mt-5"
            style="height: 80px; font-size: large"
            onclick="Enter_ani_start();"
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
<article class="ani_question">
    <div class="mt-4 Enter_ani_test_title">반려견 유형 테스트</div>
    <h6
            id="EnteranimalQnum"
            class="mt-2"
            style="text-align: right; color: rgb(137, 137, 137)"
    >
        문제 번호
    </h6>
    <div class="progress mt-2">
        <div
                class="progress-bar bg-warning"
                role="progressbar"
                aria-label="Basic example"
                style="width: calc(100 / 12 * 1%)"
        ></div>
    </div>
    <h2 id="ani_title" class="text-center mt-10">문제</h2>
    <input id="type" type="hidden" value="EI" />
    <button
            id="Enter_ani_test_A"
            type="button"
            class="btn btn-light mt-5"
            style="height: 80px; line-height: 20px; border-radius: 12px"
    >
        Primary
    </button>
    <button
            id="Enter_ani_test_B"
            type="button"
            class="btn btn-light mt-5"
            style="height: 80px; line-height: 20px; border-radius: 12px"
    >
        Primary
    </button>
</article>

<!-- 결과 화면 -->
<article class="result">
    <div class="mt-4 Enter_ani_test_title">반려견 유형 테스트</div>
    <h1 id="Enter_animal_keyword" class="text-center mt-5">반려견 키워드</h1>
    <h2 id="animal" class="text-center mt-4">반려견 이름</h2>
    <img
            id="img"
            src=""
            class="rounded-circle mt-4"
            style="margin-bottom: 40px"
            alt="animal"
    />
    <div id="Enter_animal_result" class="mt-3" style="border: 1px solid #ddd">
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
            반려견 타이틀 설명
        </h3>
        <h3
                id="explain"
                class="mt-1"
                style="
            line-height: 30px;
            margin: 0px 350px 20px 350px;
            text-align: justify;
            font-size: medium;
          "
        >
            설명
        </h3>
        <!-- animal test 결과 내용 추후 수정 -->
        <div class="col-12 progressbar_all">
            <div class="progressbar">
                <svg class="progressbar__svg">
                    <circle
                            cx="80"
                            cy="80"
                            r="70"
                            class="progressbar__svg-circle circle-html shadow-html"
                    ></circle>
                </svg>
                <span id="progress_cir_1" class="progressbar__text shadow-html"
                >키워드1</span
                >
            </div>

            <div class="progressbar">
                <svg class="progressbar__svg">
                    <circle
                            cx="80"
                            cy="80"
                            r="70"
                            class="progressbar__svg-circle circle-css shadow-css"
                    ></circle>
                </svg>
                <span id="progress_cir_2" class="progressbar__text shadow-css"
                >키워드2</span
                >
            </div>
            <div class="progressbar">
                <svg class="progressbar__svg">
                    <circle
                            cx="80"
                            cy="80"
                            r="70"
                            class="progressbar__svg-circle circle-scss shadow-scss"
                    ></circle>
                </svg>
                <span id="progress_cir_3" class="progressbar__text shadow-scss"
                >키워드3</span
                >
            </div>
            <div class="progressbar">
                <svg class="progressbar__svg">
                    <circle
                            cx="80"
                            cy="80"
                            r="70"
                            class="progressbar__svg-circle circle-js shadow-node"
                    ></circle>
                </svg>
                <span id="progress_cir_4" class="progressbar__text shadow-node"
                >키워드4</span
                >
            </div>
        </div>
    </div>
    <!--<img id="Enter_ani_result_keyword"src="" class="mt-5" style="margin: 20px 350px 0px 350px;" alt="결과 키워드">-->
    </div>

    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <div class="mt-5 share addthis_inline_share_toolbox"></div>
    <button
            id="Enter_page"
            type="button"
            class="btn btn-light mt-5"
            style="height: 60px; margin-bottom: 30px"
            onclick="location.href='/Entertainment/Enter_point?stateCode=${stateCode}'";
    >
        포인트 적립하기!
    </button>
</article>

<!-- 타입별로 데이터 저장 -->
<input type="hidden" id="EI" value="0" />
<input type="hidden" id="SN" value="0" />
<input type="hidden" id="TF" value="0" />
<input type="hidden" id="JP" value="0" />


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> <!-- jquery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>  <!-- 스크립트 -->

<script>
    var Enter_aninum = 1;
    var Enter_ani_q = {
        1: {
            title: "Q1. <br/><br/>반려견과 함께 산책을 간다면?",
            type: "EI",
            Enter_ani_test_A: "다른 친구들을 찾아 반려견 동반 카페로 간다!",
            Enter_ani_test_B: "단둘이 동네 산책!",
            EnteranimalQnum: "1/12",
        },
        2: {
            title: "Q2. <br/><br/>산책 장소에서 처음 보는 반려견을 본다면 ?",
            type: "EI",
            Enter_ani_test_A: "처음 보는 반려견이지만 <br/>  이미 친구 완료!",
            Enter_ani_test_B: "거리를 두고 천천히 알아가야겠어.",
            EnteranimalQnum: "2/12",
        },
        3: {
            title:
                "Q3. <br/><br/>산책 도중 만난 사람이 <br/> 반려견을 귀여워 한다면 나는 ",
            type: "EI",
            Enter_ani_test_A: "맞장구를 치며, <br/> 반려견 자랑을 시작한다.",
            Enter_ani_test_B: "어색한 미소만 짓는다.",
            EnteranimalQnum: "3/12",
        },
        4: {
            title: "Q4. <br/><br/>친구가 반려견에 대해 물어본다면 나는",
            type: "SN",
            Enter_ani_test_A:
                "반려견의 인적사항과 성격, <br/> 특징에 대해 이야기해준다.",
            Enter_ani_test_B:
                "사진을 보여주면서 <br/> 반려견의 귀여움을 어필한다.",
            EnteranimalQnum: "4/12",
        },
        5: {
            title: "Q5. <br/><br/>반려견이 갑자기 사람이 된다면 나는",
            type: "SN",
            Enter_ani_test_A: "당황했지만, <br/> 일단 상황파악부터 하자.",
            Enter_ani_test_B:
                "드디어 반려견과 대화를 주고 받을 수 있는 건가??<br/>  대박 !!!",
            EnteranimalQnum: "5/12",
        },
        6: {
            title: "Q6. <br/><br/>간식 훈련 성공률이 80%라면",
            type: "SN",
            Enter_ani_test_A:
                "너무 잘했어!! <br/> 조금만 더 노력하면 이제 완전히 터득할 수 있을 것 같아.",
            Enter_ani_test_B:
                "80%나 성공하다니 !!! ㅠ<br/>  반려견이 너무 대견해 !!",
            EnteranimalQnum: "6/12",
        },
        7: {
            title: "Q7. <br/><br/>반려견이 갑자기 토라진다면 나는 ",
            type: "TF",
            Enter_ani_test_A: "왜 토라진 거지..? 방금 전 상황을 다시 생각해본다.",
            Enter_ani_test_B:
                "토라진 이유는 모르겠고, 일단 반려견 기분 먼저 풀어주자 !!",
            EnteranimalQnum: "7/12",
        },
        8: {
            title:
                "Q8. <br/><br/>친구가 힘들게 처음 번 돈으로<br/>  반려견 옷을 사줬다는 이야기를 들은 <br/> 나는",
            type: "TF",
            Enter_ani_test_A: "정말 귀엽겠다!<br/>  어떤 옷인지 궁금해!",
            Enter_ani_test_B:
                " 헉 힘들게 처음 번 돈으로 <br/> 반려견을 위한 선물을 준비하다니! <br/> 고생 많았어!!",
            EnteranimalQnum: "8/12",
        },
        9: {
            title: "Q9. <br/><br/>약속에 늦었을 때 나는",
            type: "TF",
            Enter_ani_test_A:
                "반려견과 산책을 하다가<br/>  예상치 못한 변수로 인해 <br/> 예정된 시간보다 늦게 도착했어. <br/> 미안해 ㅠ ",
            Enter_ani_test_B:
                "늦어서 정말 정말 미안해 ㅠㅠ <br/> 오래 기다렸지?<br/>  힘들었겠다 ㅠㅠ ",
            EnteranimalQnum: "9/12",
        },
        10: {
            title: "Q10. <br/><br/>친구의 반려견을 돌보게 된 나는",
            type: "JP",
            Enter_ani_test_A:
                "친구에게 반려견이 좋아하는 <br/> 간식이나 놀이 등을 물어보고<br/>  미리 준비한다.",
            Enter_ani_test_B: "너무 귀엽겠다 !! <br/> ㅠㅠ 파워 주접",
            EnteranimalQnum: "10/12",
        },
        11: {
            title: "Q11. <br/><br/>반려견과 여행을 간다면 나는",
            type: "JP",
            Enter_ani_test_A:
                "여행 계획을 짤 때<br/>  미리 반려견 입장이 가능한 곳으로 알아본다.",
            Enter_ani_test_B:
                "가는 곳마다 <br/> 반려견 입장이 가능한지 물어본다. ",
            EnteranimalQnum: "11/12",
        },
        12: {
            title:
                "Q12. <br/><br/>반려견과 산책을 하다 <br/> 발견한 갈림길이 있다면 나는",
            type: "JP",
            Enter_ani_test_A:
                "어디가 나오는 지 정확히 알지 못하니까<br/>  오늘은 원래 가던 길로 가자. ",
            Enter_ani_test_B: "여기로 나가면 어디가 나올까?? <br/> 한 번 가보자!",
            EnteranimalQnum: "12/12",
        },
    };
    var result = {
        ISTJ: {
            img: "/img/Enter_animal_test/Enter_ani_test_Bernese mountain dog.jpg",
            Enter_animal_keyword: "나의 반려견 유형은.. <br/>독립심 강한",
            animal: "버니즈마운틴 <br/> (Bernese mountain dog)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#버니즈마운틴과 닮은 나는 <br/> · 계획 짜는 걸 좋아하고, 즉흥적인 걸 별로 좋아하지 않아요. <br/> · 책임감이 강하고 원칙적으로 행동해요. <br/> · 휴일에는 집에서 쉬는 걸 좋아해요. <br/> · 사람 많은 곳, 시끄러운 곳을 별로 좋아하지 않아요. ",
            progress_cir_1: "계획",
            progress_cir_2: "성실",
            progress_cir_3: "책임",
            progress_cir_4: "배려",
        },
        ISTP: {
            img: "/img/Enter_animal_test/Enter_ani_test_basset hound.jpeg",
            animal: "바셋하운드 키워드 <br/> 바셋하운드 <br/> (basset hound)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#바셋하운드와 닮은 나는 <br/> · 남한테 관심이 없고, 관심 받는 것도 별로 좋아하지 않아요. <br/> · 에너지가 적어서 효율적인 일을 하는 것을 좋아해요. <br/> · 요점만 듣고, 요점만 이야기 하고 싶어 해요. <br/> · 호불호가 강하고, 틀에 박힌 걸 싫어해요. ",
            progress_cir_1: "효율",
            progress_cir_2: "해결",
            progress_cir_3: "융통",
            progress_cir_4: "생각",
        },
        ISFJ: {
            img: "/img/Enter_animal_test/Enter_ani_test_papillon.jpg",
            animal: "빠삐용 키워드 <br/> 빠삐용 <br/> (papillon)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#빠삐용와 닮은 나는 <br/> · 신중하고, 세심하며 꼼꼼한 면모를 보여요. <br/> · 차분하며 온정적이고 친근해요. <br/> · 책임감과 인내력 또한 강해요. <br/> · 순차적으로 계획을 세우고, 배려가 넘쳐요. <br/> · 관계를 중요시 여기고, 조화를 유지하기 위해 노력해요.",
            progress_cir_1: "성실",
            progress_cir_2: "생긱",
            progress_cir_3: "조용",
            progress_cir_4: "꼼꼼",
        },
        ISFP: {
            img: "/img/Enter_animal_test/Enter_ani_test_saint bernard.jpeg",
            animal:
                "세인트버나드 키워드 <br/> 세인트버나드 <br/> (saint bernard)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#세인트버나드와 닮은 나는 <br/> · 마음이 순하고 따뜻며, 정이 많아요. <br/> · 다른 사람의 부탁을 거절하기 어려워해요. <br/> · 생각은 잘 하는데 생각한 것을 실천하기까지가 어려워요. <br/> · 규칙, 관습, 틀에 묶여서 제약 받는 걸 좋아하지 않아요. ",
            progress_cir_1: "배려",
            progress_cir_2: "생각",
            progress_cir_3: "조용",
            progress_cir_4: "양보",
        },
        INTJ: {
            img: "/img/Enter_animal_test/Enter_ani_test_afghan hound.jpeg",
            animal: "아프간하운드 키워드 <br/> 아프간하운드 (afghan hound)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#아프간하운드와 닮은 나는 <br/> · 뭐든 확실한게 좋다고 생각해요. <br/> · 자기 주관이 뚜렷하고, 고집이 세다는 말을 자주 들어요. <br/> · 원칙을 중요시하고, 남들에게 별로 관심이 없어요. <br/> · 감정애 휘둘리는 걸 좋아하지 않아요.",
            progress_cir_1: "독립",
            progress_cir_2: "계획",
            progress_cir_3: "생각",
            progress_cir_4: "논리",
        },
        INTP: {
            img: "/img/Enter_animal_test/Enter_ani_test_alaskan malamute.jpg",
            animal:
                "알래스칸 맬러뮤트 키워드 <br/> 알래스칸 맬러뮤트 <br/> (alaskan malamute)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#알래스칸맬러뮤트와 닮은 나는 <br/> · 호기심이 많고, 아이디어가 많아요. <br/> · 끊임없이 새로운 지식에 대해 궁금해 해요. <br/> · 논리정연하게 말하고, 사적인 감정을 잘 드러내지 않아요. <br/> · 타인에게 피해주는 걸 싫어하고, 타인에게 별로 관심이 없어요. ",
            progress_cir_1: "분석",
            progress_cir_2: "독립",
            progress_cir_3: "호기심",
            progress_cir_4: "이상적",
        },
        INFJ: {
            img: "/img/Enter_animal_test/Enter_ani_test_greyhound.jpg",
            animal: "그레이하운드 키워드 <br/> 그레이하운드 <br> greyhound",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#그레이하운드와 닮은 나는 <br/> · 감수성이 풍부하고, 사차원이라는 소리를 자주 들어요. <br/> · 싫은 내색을 하는 것이 어려워요. <br/> · 근거없는 말을 별로 좋아하지 않고, 절대 믿지 않아요. <br/> · 혼자 뭐할 지 계획 세우는 걸 좋아해요. ",
            progress_cir_1: "차분",
            progress_cir_2: "배려",
            progress_cir_3: "공감",
            progress_cir_4: "고민",
        },
        INFP: {
            img: "/img/Enter_animal_test/Enter_ani_test_tibetan terrier.jpeg",
            animal:
                "티베탄 테리어 키워드 <br/> 티베탄 테리어 <br/> (tibetan terrier)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#티베탄 테리어와 닮은 나는 <br/> · 섬세하고, 예술을 좋아해요. <br/> · 시끌벅적한 분위기를 별로 좋아하지 않아요. <br/> · 뛰어난 공감능력으로 작품에 쉽게 감정이입이 가능해요. <br/> · 시, 소설 등 문학 작품을 좋아해요. ",
            progress_cir_1: "배려",
            progress_cir_2: "몽상가",
            progress_cir_3: "생각",
            progress_cir_4: "낭만주의",
        },
        ESTJ: {
            img: "/img/Enter_animal_test/Enter_ani_test_border collie.jpg",
            animal: "보더 콜리 키워드 <br/> 보더 콜리 <br/> (border collie)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#보더 콜리와 닮은 나는 <br/> · 단계적으로 계획을 세우고 이행하는 것을 좋아해요. <br/> · 매우 신속하게 논리적 결론을 내고, 겉과 속이 일치해요. <br/> · 싸우는 걸 좋아하지는 않지만, 싸워서 지는 건 더 싫어해요. <br/> · 고집이 세고, 감정 표현이 서툴러요. ",
            progress_cir_1: "계획",
            progress_cir_2: "책임",
            progress_cir_3: "논리",
            progress_cir_4: "현실",
        },
        ESTP: {
            img: "/img/Enter_animal_test/Enter_ani_test_jack russell terrier.jpg",
            animal:
                " 잭 러셀 테리어 키워드 <br/> 잭 러셀 테리어 <br/> (jack russell terrier)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#잭 러셀 테리어와 닮은 나는 <br/> · 즉흥적이고, 내기하는 걸 좋아해요. <br/> · 선입견이 없고, 개방적이에요. <br/> · 자기주장이 강하고, 사람들과 어울려 노는 걸 좋아해요. <br/> · 솔직하고, 적극적이고 열정적이에요. ",
            progress_cir_1: "융통",
            progress_cir_2: "즉흥",
            progress_cir_3: "직설적",
            progress_cir_4: "활동적",
        },
        ESFJ: {
            img: "/img/Enter_animal_test/Enter_ani_test_great dane.jpg",
            animal: "그레이트 데인 <br/> 그레이트 데인 <br/> (great dane)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#그레이트 데인과 닮은 나는 <br/> · 예의가 바르고 친절해요. <br/> · 친화력이 좋고, 주변 사람들에게 관심이 많아 잘 챙겨요. <br/> · 뛰어난 공감능력으로 리액션이 좋아요. <br/> ·  책임감이 강해 사소한 일도 성실하게 끝까지 해내려고 노력해요. ",
            progress_cir_1: "계획",
            progress_cir_2: "친절",
            progress_cir_3: "책임",
            progress_cir_4: "배려",
        },
        ESFP: {
            img: "/img/Enter_animal_test/Enter_ani_test_poodle.jpg",
            animal: "푸들 키워드 <br/> 푸들 <br/> (poodle)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#푸들과 닮은 나는 <br/> · 도전 정신이 강하고, 매우 열정적이에요. <br/> · 현재가 중요하고, 새로운 걸 시도하는 것을 좋아해요. <br/> · 하고 싶은 건 꼭 헤야 되고, 하기 싫은 건 미루는 편이에요. <br/> · 틀에 박힌 것을 좋아하지 않고, 계획을 따라 일을 진행하는 것을 힘들어해요. ",
            progress_cir_1: "긍정",
            progress_cir_2: "오지랖",
            progress_cir_3: "칭찬",
            progress_cir_4: "배려",
        },
        ENTJ: {
            img: "/img/Enter_animal_test/Enter_ani_test_german shepherd.jpg",
            animal:
                "저먼 셰퍼드 키워드 <br/> 저먼 셰퍼드 <br/> (german shepherd)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#저먼 셰퍼드과 닮은 나는 <br/> · 솔직하면서도 단호한 성격을 가지고 있어요. <br/> · 열성적이며, 지도력과 통솔력이 높아요. <br/> · 강한 리더십으로 대화를 이끌어가고 사교활동에 적극적이에요. <br/> · 지적인 자극을 주는 새로운 아이디에서 관심이 많아요. ",
            progress_cir_1: "개척",
            progress_cir_2: "리더십",
            progress_cir_3: "열정",
            progress_cir_4: "도전",
        },
        ENTP: {
            img: "/img/Enter_animal_test/Enter_ani_test_bull terrier.jpg",
            animal: "불 테리어 키워드 <br/> 불 테리어 <br/> (bull terrier)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#불 테리어와 닮은 나는 <br/> · 생각의 전환이 빠르고, 통통 튀는 아이디어가 많아요. <br/> · 독창적이며 다방면에 관심과 재능이 많아요. <br/> · 감정기복이 심하고, 종종 충동적인 의사결정을 내릴 때가 있어요. <br/> · 임기응변에 능하고 말보다는 행동이 앞설 때가 있아요. ",
            progress_cir_1: "도전",
            progress_cir_2: "호기심",
            progress_cir_3: "솔직",
            progress_cir_4: "아이디어",
        },
        ENFJ: {
            img: "/img/Enter_animal_test/Enter_ani_test_boxer.jpg",
            animal: "복서 키워드 <br/> 복서 <br/> (boxer)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#복서와 닮은 나는 <br/> · 리액션이 좋고, 자신보다 상댜를 먼저 생각하고 말과 행동을 해요. <br/> · 미래와 현실을 동시에 고려하여 계획 세우는 것을 좋아해요. <br/> · 추진력이 졸고, 열정적이에요. <br/> · 상상력이 풍부하고, 성장과 가능성을 중요하게 생각해요. ",
            progress_cir_1: "계획",
            progress_cir_2: "관계",
            progress_cir_3: "긍정",
            progress_cir_4: "배려",
        },
        ENFP: {
            img: "/img/Enter_animal_test/Enter_ani_test_golden retriever.jpg",
            animal:
                "골든리트리버 키워드<br/> 골든리트리버 <br/> (golden retriever)",
            explain_title: "나의 반려견 유형은?",
            explain:
                "#골든리트리버와 닮은 나는 <br/> · 따뜻하고, 활기가 넘치며 재능이 많아요. <br/> · 항상 새로운 가능성을 찾고 시도해요. <br/> · 문제 해결에 재빠르고 관심이 있어요. <br/> · 독립적인 성향을 가지고 있어요. <br/> · 안정적인 삶보다 창의적이며 자유로운 삶을 원해요. ",
            progress_cir_1: "열정",
            progress_cir_2: "칭찬",
            progress_cir_3: "자유",
            progress_cir_4: "융통",
        },
    };

    function Enter_ani_start() {
        $(".ani_start").hide();
        $(".ani_question").show();
        next();
    }
    $("#Enter_ani_test_A").click(function () {
        var type = $("#type").val();
        var preValue = $("#" + type).val();
        $("#" + type).val(parseInt(preValue) + 1);
        next();
    });
    $("#Enter_ani_test_B").click(function () {
        next();
    });
    function next() {
        if (Enter_aninum == 13) {
            $(".ani_question").hide();
            $(".result").show();

            var Enter_mbti_ani = "";
            $("#EI").val() < 2
                ? (Enter_mbti_ani += "I")
                : (Enter_mbti_ani += "E");
            $("#SN").val() < 2
                ? (Enter_mbti_ani += "N")
                : (Enter_mbti_ani += "S");
            $("#TF").val() < 2
                ? (Enter_mbti_ani += "F")
                : (Enter_mbti_ani += "T");
            $("#JP").val() < 2
                ? (Enter_mbti_ani += "P")
                : (Enter_mbti_ani += "J");
            alert("결과 확인하기");

            $("#img").attr("src", result[Enter_mbti_ani]["img"]);
            $("#Enter_animal_keyword").html(
                result[Enter_mbti_ani]["Enter_animal_keyword"]
            );
            $("#animal").html(result[Enter_mbti_ani]["animal"]);
            $("#explain_title").html(result[Enter_mbti_ani]["explain_title"]);
            $("#explain").html(result[Enter_mbti_ani]["explain"]);
            $("#Enter_ani_result_keyword").attr(
                "src",
                result[Enter_mbti_ani]["Enter_ani_result_keyword"]
            );

            $("#progress_cir_1").html(result[Enter_mbti_ani]["progress_cir_1"]);
            $("#progress_cir_2").html(result[Enter_mbti_ani]["progress_cir_2"]);
            $("#progress_cir_3").html(result[Enter_mbti_ani]["progress_cir_3"]);
            $("#progress_cir_4").html(result[Enter_mbti_ani]["progress_cir_4"]);
        } else {
            $(".progress-bar").attr(
                "style",
                "width: calc(100/12*" + Enter_aninum + "%)"
            );
            $("#ani_title").html(Enter_ani_q[Enter_aninum]["title"]);
            $("#EnteranimalQnum").html(
                Enter_ani_q[Enter_aninum]["EnteranimalQnum"]
            );
            $("#type").val(Enter_ani_q[Enter_aninum]["type"]);
            $("#Enter_ani_test_A").html(
                Enter_ani_q[Enter_aninum]["Enter_ani_test_A"]
            );
            $("#Enter_ani_test_B").html(
                Enter_ani_q[Enter_aninum]["Enter_ani_test_B"]
            );
            Enter_aninum++;
        }
    }
</script>

<!-- addthis code / sns 공유 기능 -->
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-62f6d80e58d7a901"></script>
</body>
</html>