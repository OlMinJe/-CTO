$(document).ready(function () {
    subSwiperBack();
    mainTableActive();
    saying();
    fixedIcon();
});

// 찐 todolist
function init(){
    const toDoForm = document.querySelector("#A17-todo");
    const toDoInput = document.querySelector("#A17-todo input");
    const toDoList = document.querySelector("#A17-todo-list");
    const TODO_KEY = "todos";
    let toDos = [];

    function saveToDos() {
        localStorage.setItem(TODO_KEY, JSON.stringify(toDos));
    }

    function deleteToDo(event) {
        const target = toDoList.querySelector(`li[id="${event.target.id}"]`);
        target.remove();
        toDos = toDos.filter((toDos) => toDos.id !== parseInt(target.id));
        saveToDos();
    }

    function doneFunc(event) {
        const tar = event.target.parentElement;
        for (const i in toDos) {
            if (toDos[i].id === parseInt(tar.id)) {
                if (toDos[i].is_done === true) {
                    event.target.classList.remove("A17-del");
                    toDos[i].is_done = false;
                } else {
                    event.target.classList.add("A17-del");
                    toDos[i].is_done = true;
                }
            }
        }
        saveToDos();
    }

    function paintToDo(newObj) {
        let isDone = "";
        if (newObj.is_done === true) {
            isDone = "A17-del";
        }
        const temp = document.createElement("b");
        temp.textContent = newObj.text;
        const newToDoSet = document.createElement("li");
        newToDoSet.id = newObj.id;
        newToDoSet.innerHTML = `
    <span class="${isDone} col-10">
      ${temp.innerHTML}
    </span>
    <button id=${newObj.id}>X</button>
  `;
        toDoList.appendChild(newToDoSet);
    }

    function submitFunc(event) {
        event.preventDefault();
        const newInput = toDoInput.value;
        const newObj = {
            text: newInput,
            id: Date.now(),
            is_done: false,
        };
        toDoInput.value = "";
        toDos.push(newObj);
        saveToDos();
        paintToDo(newObj);
    }

    toDoForm.addEventListener("submit", submitFunc);
    toDoList.addEventListener("click", (event) => {
        if (event.target.tagName === "SPAN") {
            doneFunc(event);
        } else if (event.target.tagName === "BUTTON") {
            deleteToDo(event);
        }
    });

    const savedToDos = localStorage.getItem(TODO_KEY);

    if (savedToDos !== null) {
        const parsedToDos = JSON.parse(savedToDos);
        toDos = parsedToDos;
        parsedToDos.forEach(paintToDo);
    }
}



function swiperEvent() {
// mainvisual 스와이퍼 이벤트
    let mainvisual_swiper = new Swiper(".mySwiper", {
        loop: true,
        loopAdditionalSlides: 1,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
        },
    });

// sub 스와이퍼 이벤트
    const sub_swiper = new Swiper('.sub_swiper_list .swiper-container', {
        loop: true,
        loopAdditionalSlides: 1,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        centeredSlides: true,
        slidesPerView: 1,
        slideToClickedSlide: true,
        effect: 'coverflow'
    });
}

// sub_swiper 배경 효과
function subSwiperBack() {
    //https://marshallku.com/web/tips/html5-canvas%EB%A1%9C-%EB%B0%A4%ED%95%98%EB%8A%98-%EA%B7%B8%EB%A6%AC%EA%B8%B0
    swiperEvent();
    const width = window.innerWidth,
        height = window.innerHeight * (0.8), /*(0.8)*/
        stars = createStars(width, height, 30),
        moon = {
            x: 0,
            y: height / 2,
            r: 45
        },
        canvas = document.getElementById("nigthSky"),
        ctx = canvas.getContext("2d");
    let counter = 0,
        time = 0;

    function random(max) {
        return Math.floor(Math.random() * max);
    }

    function createStars(width, height, spacing) {
        const stars = [];

        for (let x = 0; x < width; x += spacing) {
            for (let y = 0; y < height; y += spacing) {
                const star = {
                    x: x + random(spacing),
                    y: y + random(spacing),
                    r: Math.random() * 1.5
                };
                stars.push(star);
            }
        }
        return stars;
    }

    function fillCircle(ctx, x, y, r, fillStyle) {
        ctx.beginPath(),
            ctx.fillStyle = fillStyle,
            ctx.arc(x, y, r, 0, Math.PI * 2),
            ctx.fill();
    }

    function getOpacity(factor) {
        const opacityIncrement = 0.6 * Math.abs(Math.sin(factor)),
            opacity = 0.1 + opacityIncrement;
        return opacity;
    }

    function render() {
        const gradient = ctx.createLinearGradient(0, 0, 0, height);
        let newX = time / 10 - 45;
        gradient.addColorStop(0, "#00111e");
        gradient.addColorStop(1, "#0a2342");
        //배경 그래디언트
        ctx.fillStyle = gradient;
        ctx.fillRect(0, 0, width, height);
        stars.forEach(function (star, i) {
            const factor = counter * i,
                x = star.x,
                y = star.y,
                opacity = getOpacity(factor),
                randomColor = Math.floor((Math.random() * 360) + 1);

            fillCircle(ctx, x, y, star.r, `hsla(${randomColor}, 30%, 80%, ${opacity})`); //별 그리기
        });

        newX <= width + 90 // window 너비에 달 지름 추가
            ? (
                moon.x = newX,
                    moon.y = newX,
                    time += 5
            ) : time = 0,
            // 달에 애니메이션 추가

            fillCircle(ctx, moon.x, 90, moon.r, "#f5f3ce"); // 달 그리기

        counter++;
        requestAnimationFrame(render);
    }

    function newY(x) {
        return Math.pow(x - width / 2, 2) / 9000 + height / 2 + 1
    }

    canvas.width = width,
        canvas.height = height,
        render();
}

// 지도
var mapContainer = document.getElementById('map1'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.577491675481404, 126.9770077164053), // 지도의 중심좌표
        draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
function setDraggable(draggable) {
    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
    map.setDraggable(draggable);
}


// 지도1
var mapContainer = document.getElementById('map1'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.577491675481404, 126.9770077164053), // 지도의 중심좌표
        draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
function setDraggable(draggable) {
    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
    map.setDraggable(draggable);
}

// 지도2
var mapContainer = document.getElementById('map2'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.577491675481404, 126.9770077164053), // 지도의 중심좌표
        draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
function setDraggable(draggable) {
    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
    map.setDraggable(draggable);
}

// 커뮤니티+editor 이벤트
function mainTableActive() {
    let mainCommunity_li = document.querySelectorAll('.main_community_menu li');
    let mainCommunity_content = document.getElementById('main_community_table');
    let mainEditor_content = document.getElementById('main_editor_table');

    function mainCommunityLiActive() {
        mainCommunityTable();
        for (let i = 0; i < mainCommunity_li.length; i++) {
            mainCommunity_li[i].addEventListener("click", function () {
                while (mainCommunity_content.hasChildNodes()) {
                    mainCommunity_content.removeChild(mainCommunity_content.firstChild);
                }
                for (let j = 0; j < mainCommunity_li.length; j++) {
                    if (mainCommunity_li[j].classList.contains('active') == true) {
                        mainCommunity_li[j].classList.remove('active');
                    }
                }
                mainCommunity_li[i].classList.add('active');
                mainCommunityTable();
            })
        }
    }

    function mainCommunityTable() {
        for (let i = 0; i < 10; i++) { // 해당 카테고리 seq 값 만큼 돌리는걸로 바꾸기
            mainCommunity_content.innerHTML +=
                '<tr class="community-table">' +
                '<td class="title"><span><a href="/community/community_view.html">' + i + '</a></span></td>' +
                '<td class="comment_count"><span>' + '100' + '</span></td>' +
                '</tr>';
        }
    }

    function mainEditorTable() {
        // 얘는 최신 게시물 1개만 출력이라 for문 사용 노논
        for (let i = 0; i < 1; i++) {
            mainEditor_content.innerHTML +=
                '<span class="title"><a href="/community/community_view.html">제목</a></span>' +
                '<span class="content_img"><img src=""></span>' +
                '<span class="content_text">내용</span>';

        }
    }

    mainEditorTable();
    mainCommunityLiActive();
}

// 명언
function saying(){
    const words = ['인생은 가까이서 보면 비극이지만 멀리서 보면 희극이다 - 찰리채플린',
        '때로는 살아있는 것조차도 용기가 될 때가 있다 - 세네카',
        '서로를 용서하는 것이야 말로 가장 아름다운 사랑의 모습이다 - 존 셰필드',
        '자신을 화나게 했던 행동을 다른 이에게 행하지 말라 - 소크라테스',
        '행동의 가치는 그 행동을 끝까지 이루는 데 있다 - 칭기즈탄',
        '현명한 자라면 찾아낸 기회보다 더 많은 기회를 만들 것이다 - 프랜시스 베이컨',
        '성공은 열심히 노력하며 기다리는 사람에게 찾아온다 - 토마스 A. 에디슨',
        '한 인간의 가치는 그가 무엇을 받을 수 있느냐가 아니라 무엇을 주느냐로 판단된다 - 알버트 아인슈타인',
        '천재란 자신에게 주어진 일을 하는 재능 있는 사람일 뿐이다 - 토마스 A. 에디슨',
        '믿음이 부족하기 때문에 도전하길 두려워하는 바, 나는 스스로를 믿는다 - 무하마드 알리',
        '어디를 가든지 마음을 다해 가라 - 공자',
        '낮에 꿈꾸는 사람은 밤에만 꿈꾸는 사람에게는 찾아오지 않는 많은 것을 알고 있다 - 에드거 앨런 포',
        '어떤 일을 하기에 앞서 스스로 그 일에 대한 기대를 가져야 한다 - 마이클 조던',
        '그 어떤 것에서라도 내적인 도움과 위안을 찾을 수 있다면 그것을 잡아라 - 마하트마 간디',
        '미래의 가장 좋은 점은 한 번에 하루씩 온다는 것이다 - 에이브러햄 링컨',
        '미래는 여기 있다. 아직 널리 퍼지지 않았을 뿐이다 - 윌리엄 깁슨',
        '당신을 만나는 모든 사람이 당신과 헤어질 때는 더 나아지고 더 행복해질 수 있도록 하라 - 마더 테레사',
        '인간의 감정은 누군가를 만날 때와 헤어질 때 가장 순수하며 가장 빛난다 - 장 폴 리히터',
        '나는 삶을 변화시키는 아이디어를 항상 책에서 얻었다 - 벨 훅스',
        '모두를 사랑하되, 몇 사람만 믿으라. 누구에게도 잘못을 저지르지 말라 - 윌리엄 셰익스피어'
    ];
    const selected = words[Math.floor(Math.random() * words.length)];
    document.querySelector('.wiseSaying_con').innerHTML = selected;
}


// fixed 아이콘 hover 이벤트
function fixedIcon() {
    let fixed = document.getElementById("fixed");
    let fixed_comment = document.getElementById("fixed_comment");

    fixed.addEventListener("mouseover", function (event) {
        fixed_comment.style.display = "block";
    }, false);

    fixed.addEventListener("mouseout", function (event) {
        fixed_comment.style.display = "none";
    }, false);
}

//session 상태에 따른 로그인 화면 보이기 조절 중
if (sessionStorage != null) {

}