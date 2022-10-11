$(document).ready(function(){
    li_active_01();
});

/* 상위 메뉴 */
let active_normal = document.querySelector("#community_normal");
let active_editor = document.querySelector("#community_editor");

/* 하위 메뉴 - 커뮤니티 */
let normal = document.getElementById('sub-menu');
let normal_li = document.querySelectorAll('.menu-box-01 li');

/* content */
let table = document.getElementById('community-table');
let table_head = document.getElementById('community-table-head');
let table_tbody = document.getElementById('community-table-body');
let editor_content = document.getElementById('editor_content');

/* 데이터 중복 출력 현상 임의로 막아둠 */
function dataRedundancy() {
    while (table_tbody.hasChildNodes()) {
        table_tbody.removeChild(table_tbody.firstChild);
    }
}
/* 커뮤니티 하위 메뉴를 클릭했을 때의 css 이벤트 */
function sub_menu() {
    dataRedundancy();
    // 상위 메뉴 active 클래스 추가 -> 해당 클래스를 사용하여 css 효과 부여
    active_normal.classList.add('active');
    active_editor.classList.remove('active');
    // 반응형 하위 메뉴 - 화면 크기가 767px 이하일 경우
    if (matchMedia("screen and (max-width: 767px)").matches) {
        if (normal.style.display == "block") {
            normal.style.display = "none";
        } else {
            normal.style.display = "block";
        }
    } else { normal.style.display = "block"; }
    // 바뀐 메뉴에 해당하는 게시글 출력
    content_table_01();
}

/* community 탭을 클릭한 경우 */
function li_active_01() {
    // 초기에 출력되는 content 영역
    editor_content.style.display = "none";
    table.style.display = "table";
    dataRedundancy();
    content_table_01();

    /* 상위 메뉴 class */
    active_normal.classList.add('active');
    active_editor.classList.remove('active');

    // 하위 메뉴 영역
    for(let i = 0; i < normal_li.length; i++) {
        normal_li[i].addEventListener("click", function () {
            // 선택한 메뉴에 active 클래스 추가 및 이전 메뉴 active 클래스 삭제
            for(let j = 0; j < normal_li.length; j++) {
                if(normal_li[j].classList.contains('active') == true) {
                    normal_li[j].classList.remove('active');
                }
            }
            normal_li[i].classList.add('active');
            dataRedundancy();
            // 바뀐 메뉴에 해당하는 게시글 출력
            content_table_01();
        })
    }
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
    dataRedundancy();
    /* editor 탭을 클릭한 경우 - content */
    //editor_content.removeChild(editor_content.firstChild);
    editor_content.style.display = "block";
    table.style.display = "none";
    //table_head.removeChild(table_head.firstChild);
})

/* 테이블에 값 넣기 */
function content_table_01() {
    table_head.innerHTML =
        '<tr>'+
        '<th style="width: 10%;">No.</th>'+
        '<th style="width: 10%;">작성자</th>'+
        '<th style="width: auto;">제목</th>'+
        '<th style="width: 10%;">댓글수</th>'+
        '</tr>';

    // 조건1: 선택된 상위 메뉴의 값이 커뮤니티 or 상담일 때
    // 예시: 커뮤니티를 선택한 경우 값이 '커뮤니티'임
    // 선택된 메뉴가 DB에 저장된 메뉴 중에 해당하면 그에 알맞는 게시글 출력
    var topMenu = $('.menu-wrap .box_eft_01.active').text();

    // 조건2: 선택된 하위 메뉴의 값
    // 예시: 커뮤니티의 '정보'를 선택한 경우 값이 '정보'
    var subMenu = $('.menu-con .box_eft_01.active').text();

    // 분기문으로 seq 값 만큼 html 넣어주기 - 10으로 임의 설정
    // 글 번호, 작성자, 글제목, 댓글수 순서로 배치함
    for(let i = 0; i < 10; i++) {
        table_tbody.innerHTML +=
            '<tr class="adivce-table">'+
            '<td class="diplay_no"><span>' + (i+1) + '</span></td>'+
            '<td class="wirter"><span>' + '글쓴이' + '</span></td>'+
            '<td class="title"><span><a href="/community/community_view.jsp">' + i + '</a></span></td>'+
            '<td class="comment_count"><span>' + '100' + '</span></td>'+
            '</tr>';
    }
}






