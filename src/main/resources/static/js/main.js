$(document).ready(function(){
    subSwiperBack();
    mainTableActive();
    fixedIcon();
});

let inputBox = document.getElementById('inputField');  // 할 일 입력창
let addToDo = document.getElementById('addToDo');      // 버튼
let toDoList = document.getElementById('toDoList');    // 할 일 리스트창

addToDo.addEventListener('click', function(){    // 버튼에 클릭 이벤트가 발생하면
    var list = document.createElement('li');     // html 'li' 태그 만들기
    if (!inputBox.value)            // 할 일 입력창에 내용이 입력되지 않으면 alert 발생
        alert('내용을 입력해 주세요!');
    else
    {
        list.innerText = inputBox.value;  // <li>입력된 할 일</li>
        toDoList.appendChild(list);       // 할 일 리스트창에 자식으로 붙이기
        inputBox.value= "";               // 할 일 입력창 초기화
    }

    list.addEventListener('click', function(){      // 만들어진 list에 클릭 이벤트가 발생하면 줄 긋기
        list.style.textDecoration = "line-through";
    })
    list.addEventListener('dblclick', function(){   // list에 더블클릭 이벤트가 발생하면 할 일 리스트창에서 지우기
        toDoList.removeChild(list);
    })
})

function swiperEvent(){
// mainvisual 스와이퍼 이벤트
    let mainvisual_swiper = new Swiper(".mySwiper", {
        loop: true,
        loopAdditionalSlides: 1,
        autoplay:{
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
        autoplay:{
            delay: 3000,
            disableOnInteraction: false,
        },
        centeredSlides: true,
        slidesPerView: 1,
        slideToClickedSlide: true,
        effect: 'coverflow'
    });
}

// 지도
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
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


// sub_swiper 배경 효과
function subSwiperBack(){
    //https://marshallku.com/web/tips/html5-canvas%EB%A1%9C-%EB%B0%A4%ED%95%98%EB%8A%98-%EA%B7%B8%EB%A6%AC%EA%B8%B0
    swiperEvent();
    const width = window.innerWidth,
        height = window.innerHeight*(0.8), /*(0.8)*/
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
                randomColor = Math.floor((Math.random()*360)+1);

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


// 커뮤니티+editor 이벤트
function mainTableActive(){
    let mainCommunity_li = document.querySelectorAll('.main_community_menu li');
    let mainCommunity_content = document.getElementById('main_community_table');
    let mainEditor_content = document.getElementById('main_editor_table');

    function mainCommunityLiActive(){
        mainCommunityTable();
        for(let i = 0; i < mainCommunity_li.length; i++) {
            mainCommunity_li[i].addEventListener("click", function () {
                while (mainCommunity_content.hasChildNodes()) {
                    mainCommunity_content.removeChild(mainCommunity_content.firstChild);
                }
                for(let j = 0; j < mainCommunity_li.length; j++){
                    if(mainCommunity_li[j].classList.contains('active') == true){
                        mainCommunity_li[j].classList.remove('active');
                    }
                }
                mainCommunity_li[i].classList.add('active');
                mainCommunityTable();
            })
        }
    }

    function mainCommunityTable(){
        for(let i = 0; i < 10; i++) { // 해당 카테고리 seq 값 만큼 돌리는걸로 바꾸기
            mainCommunity_content.innerHTML +=
                '<tr class="community-table">'+
                '<td class="title"><span><a href="/community/community_view.html">' + i + '</a></span></td>'+
                '<td class="comment_count"><span>' + '100' + '</span></td>'+
                '</tr>';
        }
    }

    function mainEditorTable(){
        for(let i = 0; i < 10; i++) {
            mainEditor_content.innerHTML +=
                '<tr class="community-table">'+
                '<td class="title"><span><a href="/community/community_view.html">' + i + '</a></span></td>'+
                '<td class="comment_count"><span>' + '100' + '</span></td>'+
                '</tr>';
        }
    }

    mainEditorTable();
    mainCommunityLiActive();
}

// fixed 아이콘 hover 이벤트
function fixedIcon(){
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
if (sessionStorage != null){
    
}