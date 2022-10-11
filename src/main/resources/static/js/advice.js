$(document).ready(function() {
    liActive01();
});

/* 상위 메뉴 */
let active_normal = document.querySelector("#active_normal");
let active_woman = document.querySelector("#active_woman");

/* 하위 메뉴 */
let normal = document.getElementById('sub-menu-01');
let normal_li = document.querySelectorAll('.menu-box-01 > li');

let woman = document.getElementById('sub-menu-02');
let woman_li = document.querySelectorAll('.menu-box-02 > li');

/* content */
let title_index = document.getElementById('advice-table');

/* 데이터 중복 출력 현상 임의로 막아둠 */
function dataRedundancy() {
    while (title_index.hasChildNodes()) {
        title_index.removeChild(title_index.firstChild);
    }
}

/* '일반 고민' 탭을 클릭한 경우 */
function liActive01() {
    // 초기에 출력되는 content 영역
    dataRedundancy();
    contentTable01();
    // 상위 메뉴
    active_normal.classList.add('active');
    active_woman.classList.remove('active');
    // 하위 메뉴
    woman.style.display = "none";
    for (let i = 0; i < normal_li.length; i++) {
        normal_li[i].addEventListener("click", function () {
            // 선택한 메뉴에 active 클래스 추가 및 이전 메뉴 active 클래스 삭제
            for (let j = 0; j < normal_li.length; j++) {
                if (normal_li[j].classList.contains('active') == true) {
                    normal_li[j].classList.remove('active');
                }
            }
            normal_li[i].classList.add('active');
            dataRedundancy();
            // 메뉴를 바꿨을 때 해당하는 게시글 출력
            contentTable01();
        })
    }
    // 반응 하위 메뉴 - 화면 크기가 767px 이하일 경우
    if (matchMedia("screen and (max-width: 767px)").matches) {
        if (normal.style.display == "none") {
            normal.style.display = "flex";
        } else {
            normal.style.display = "none";
        }
    } else {
        normal.style.display = "flex";
    }
}

/* '여성 고민' 탭을 선택한 경우 */
function liActive02() {
    // 초기에 출력되는 content 영역
    dataRedundancy();
    contentTable02();
    active_normal.classList.remove('active');
    active_woman.classList.add('active');
    // 하위 메뉴
    normal.style.display = "none";
    for(let i = 0; i < woman_li.length; i++) {
        woman_li[i].addEventListener("click", function () {
            // 선택한 메뉴에 active 클래스 추가 및 이전 메뉴 active 클래스 삭제
            for(let j = 0; j < woman_li.length; j++) {
                if(woman_li[j].classList.contains('active') == true) {
                    woman_li[j].classList.remove('active');
                }
            }
            woman_li[i].classList.add('active');
            dataRedundancy();
            // 바뀐 메뉴에 해당하는 게시글 출력
            contentTable02();
        })
    }
    if (matchMedia("screen and (max-width: 767px)").matches) {
        if (woman.style.display == "none") {
            woman.style.display = "flex";
        } else {
            woman.style.display = "none";
        }
    } else {
        woman.style.display = "flex";
    }
}

/* 일반 고민 - 테이블에 값 넣기 */
function contentTable01() {
    // TODO: 메뉴 값 text() 함수로 불러올 때 띄어쓰기 때문에 오류 생길 수 있음

    // 조건1: 상위 메뉴 '일반 고민'을 선택한 경우 사용
    // 예시: 값은 '일반고민'
    // 선택된 메뉴가 DB에 저장된 메뉴 중에 해당하면 그에 알맞는 게시글 출력
    var normalMenu = $('.menu-wrap #active_normal.box_eft_01.active').text();

    // 조건2: 하위 메뉴를 선택한 경우
    // 예시: 선택한 값이 '대인관계/가족' 이면 값도 '대인관계/가족'
    var normalSubMenu = $('.menu-con #sub-menu-01 .box_eft_01.active').text();

    // 분기문으로 seq 값 만큼 html 넣어주기 - 10으로 임의 설정
    // 글 번호, 작성자, 글제목, 댓글수 순서로 배치함
    for(let i = 0; i < 10; i++) {
        title_index.innerHTML +=
            '<tr class="adivce-table">'+
            '<td class="diplay_no"><span>' + (i+1) + '</span></td>'+
            '<td class="wirter"><span>' + '글쓴이' + '</span></td>'+
            '<td class="title"><span><a href="/advice/advice_view.jsp">' + i + '</a></span></td>'+
            '<td class="comment_count"><span>' + '100' + '</span></td>'+
            '</tr>';
    }
}

/* 여성 고민 - 테이블에 값 넣기 */
function contentTable02() {
    // TODO: 메뉴 값 text() 함수로 불러올 때 띄어쓰기 때문에 오류 생길 수 있음

    // 조건1: 상위 메뉴 '여성 고민'을 선택한 경우 사용
    // 예시: 값은 '여성고민'
    // 선택된 메뉴가 DB에 저장된 메뉴 중에 해당하면 그에 알맞는 게시글 출력
    var womanMenu = $('.menu-wrap #active_woman.box_eft_01.active').text();

    // 조건2: 하위 메뉴를 선택한 경우
    // 예시: 선택한 값이 '대인관계/가족' 이면 값도 '대인관계/가족'
    var womanSubMenu = $('.menu-con #sub-menu-02 .box_eft_01.active').text();

    // 분기문으로 seq 값 만큼 html 넣어주기 - 10으로 임의 설정
    // 글 번호, 작성자, 글제목, 댓글수 순서로 배치함
    for(let i = 0; i < 10; i++) {
        title_index.innerHTML +=
            '<tr class="adivce-table">'+
            '<td class="diplay_no"><span>' + (i+1) + '</span></td>'+
            '<td class="wirter"><span>' + '글쓴이' + '</span></td>'+
            '<td class="title"><span><a href="/advice/advice_view.jsp">' + i + '</a></span></td>'+
            '<td class="comment_count"><span>' + '100' + '</span></td>'+
            '</tr>';
    }
}
