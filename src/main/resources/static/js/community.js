$(document).ready(function(){
    li_active_01();
});

/* 상위 메뉴 */
let active_normal = document.querySelector("#community_normal");
let active_editor = document.querySelector("#community_editor");

/* 하위 메뉴 - 커뮤니티 */
let normal = document.getElementById('sub-menu');
//let normal_li = document.querySelectorAll('.menu-box-02 li');

/* content */
let table = document.getElementById('community-table');
let editor_content = document.getElementById('editor_content');

/* 커뮤니티 하위 메뉴를 클릭했을 때의 css 이벤트 */
var div2 = document.getElementsByClassName("div2");
var clickMenu;
// 모바일 버전
function sub_menu() {
    // 반응형 하위 메뉴 - 화면 크기가 767px 이하일 경우
    if (matchMedia("screen and (max-width: 767px)").matches) {
        if (normal.style.display == "block") {
            normal.style.display = "none";
        } else {
            normal.style.display = "block";
        }
    } else { normal.style.display = "block"; }
}
// 웹 버전
/*function handleClick(event) {
    if (event.target.classList[1] === "active") {
        event.target.classList.remove("active");
    } else {
        for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("active");
        }
    }
}*/
function menuClick(clickMenus) {
    if(clickMenus.classList !== "active" ) {
        clickMenus.classList.add("active");
        console.log(clickMenus.classList);
    } else {
        console.log('그냥 지나감');
    }
}
function init() {
    for (var i = 0; i < div2.length; i++) {
        div2[i].addEventListener("click", function (){
            clickMenu = div2[i];
            for (var j = 0; j < div2.length; j++) {
                div2[j].classList.remove("active");
            }
        });
    }
    menuClick(clickMenu);
}
init();

/* community 탭을 클릭한 경우 */
function li_active_01() {
    // 초기에 출력되는 content 영역
    editor_content.style.display = "none";
    table.style.display = "table";
    //dataRedundancy();

    /* 상위 메뉴 class */
    active_normal.classList.add('active');
    active_editor.classList.remove('active');

    // 하위 메뉴 영역
 /*  for(let i = 0; i < normal_li.length; i++) {
       normal_li[i].addEventListener("click", function () {
            선택한 메뉴에 active 클래스 추가 및 이전 메뉴 active 클래스 삭제
            for(let j = 0; j < normal_li.length; j++) {
               if(normal_li[i].classList.contains('active') == true) {
                   normal_li[i].classList.remove('active');
               } else {
                   normal_li[i].classList.add('active');
               }

            }
            dataRedundancy();
       })
    }*/
    sub_menu();
}

/* 에디터 탭을 클릭했을 떄의 이벤트 */
active_editor.addEventListener("click", function () {
    /* 상위 메뉴 class */
    active_normal.classList.remove('active');
    active_editor.classList.add('active');
    /* 하위 메뉴 class */
    normal.style.display = "none";
    /* 데이터 중복 현상 해결*/
    //dataRedundancy();
    editor_content.style.display = "block";
    table.style.display = "none";
})