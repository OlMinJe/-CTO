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
let div2 = document.getElementsByClassName("div2");//$(".div2")
let clickMenu = [];
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
/*function menuClick(clickMenus) {
    if(clickMenus == undefined){
        console.log('그냥 지나감1');
    } else if(clickMenus.classList !== "active" ) {
        //clickMenus.classList.add("active");
        console.log(clickMenus.classList);
    } else {
        console.log('그냥 지나감2');
    }
}*/
function menuClick(category) {
    var categoryNum = category;
    clickMenu[0] = categoryNum;
    for (var i = 0; i < div2.length; i++) {
        div2[i].classList.remove("active");
        console.log('active 삭제됨');
    }
    if(div2[clickMenu[0]].classList == undefined){
        console.log('그냥 지나감1');
    } else {
        div2[clickMenu[0]].classList.add("active");
    }

    /*for (var i = 0; i < div2.length; i++) {
        div2[i].addEventListener("click", function (){
            clickMenu = div2[i];
            for (var j = 0; j < div2.length; j++) {
                div2[j].classList.remove("active");
                console.log('active 삭제됨');
            }
        });
    }
    console.log(clickMenu[0]);
    menuClick(clickMenu[0]);*/
}
/* community 탭을 클릭한 경우 */
function li_active_01() {
    // 초기에 출력되는 content 영역
    table.style.display = "table";
    editor_content.style.display = "none";
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

li_active_01();

/* 에디터 탭을 클릭했을 떄의 이벤트 */
function li_active_02(){
    /* 상위 메뉴 class */
    active_normal.classList.remove('active');
    active_editor.classList.add('active');
    /* 하위 메뉴 class */
    normal.style.display = "none";
    /* 데이터 중복 현상 해결*/
    //dataRedundancy();
    table.style.display = "none";
    editor_content.style.display = "block";
}
/*
active_editor.addEventListener("click", function () {
    /!* 상위 메뉴 class *!/
    active_normal.classList.remove('active');
    active_editor.classList.add('active');
    /!* 하위 메뉴 class *!/
    normal.style.display = "none";
    /!* 데이터 중복 현상 해결*!/
    //dataRedundancy();
    editor_content.style.display = "block";
    table.style.display = "none";
})*/
