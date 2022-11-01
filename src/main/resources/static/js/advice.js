/* 상위 메뉴 */
let active_normal = document.querySelector("#active_normal");
let active_woman = document.querySelector("#active_woman");

/* 하위 메뉴 */
let normal = document.getElementById('sub-menu-01');
let woman = document.getElementById('sub-menu-02');

/* 커뮤니티 하위 메뉴를 클릭했을 때의 css 이벤트 */
let div1 = document.getElementsByClassName("div1");
let div2 = document.getElementsByClassName("div2");

/* '일반 고민' 탭을 클릭한 경우 */
function liActive01() {
    // 상위 메뉴
    active_normal.classList.add('active');
    active_woman.classList.remove('active');
    // 하위 메뉴
    woman.style.display = "none";
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
    active_normal.classList.remove('active');
    active_woman.classList.add('active');
    // 하위 메뉴
    normal.style.display = "none";
    // 반응형 하위 메뉴 - 화면 크기가 767px 이하일 경우
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

function menuClick() {
    var sch = location.search;
    var params = new URLSearchParams(sch);

    console.log(div1)
    console.log(div2);
    console.log(params.get('category'));

    if(params.get('category')==0 || params.get('category')==1 || params.get('category')==2 || params.get('category')==3 || params.get('category')==4){
        for (var i = 0; i < div1.length; i++) {
            div1[i].classList.remove("active");
            console.log('active1 삭제됨');
        }
        liActive01();
        console.log('liActive01');
    } else {
        for (var j = 0; j < div2.length; j++) {
            div2[i].classList.remove("active");
            console.log('active2 삭제됨');
        }
        liActive02();
        console.log('liActive02');
    }

    if((params.get('category') == 0) || (params.get('category') == 1) || (params.get('category') == 2) || (params.get('category') == 3) || (params.get('category')==4)) {
        for(var a = 0; a < div1.length; a++) {
            if (params.get('category') == a) {
                div1[a].classList.add("active");
                console.log("active1 추가됨");
            }
        }
    } else {
        for(var b= 0; b < div2.length ; b++) {
            if(params.get('category') == b+5) {
                div2[b].classList.add("active");
                console.log("active2 추가됨");
            }
        }
    }
}
menuClick();