$('.file').click(function (e) {
    /* e.preventDefault(); */
    document.getElementById('file_01').click();
});
function changeValue(a) {
    console.log(a.files[0].name);
    $(".file span").text(a.files[0].name);
}

/* 상위 메뉴 */
let active_normal = document.querySelector("#community_normal");
let active_editor = document.querySelector("#community_editor");

/* 하위 메뉴 - 커뮤니티 */
let normal = document.getElementById('sub-menu');

/* content */
let table = document.getElementById('community-table');
let editor_content = document.getElementById('editor_content');

/* 커뮤니티 하위 메뉴를 클릭했을 때의 css 이벤트 */
let div2 = document.getElementsByClassName("div2");

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

function menuClick() {
    var sch = location.search;
    var params = new URLSearchParams(sch);

    for (var i = 0; i < div2.length; i++) {
        if(div2[i].classList[1] == "active"){
            div2[i].classList.remove("active");
        }
    }

    if(params.get('category') == 10){
        div2[0].classList.add("active");
    } else {
        for(var i = 1; i < div2.length; i++) {
            if(params.get('category') == i-1){
                div2[i].classList.add("active");
            }
        }
    }
}
menuClick();


/* community 탭을 클릭한 경우 */
function li_active_01() {
    // 초기에 출력되는 content 영역
    table.style.display = "table";
    editor_content.style.display = "none";

    /* 상위 메뉴 class */
    active_normal.classList.add('active');
    active_editor.classList.remove('active');
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


