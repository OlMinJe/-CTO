/* 상위 메뉴 */
let active_normal = document.querySelector("#active_normal");
let active_woman = document.querySelector("#active_woman");

/* 하위 메뉴 */
let normal = document.getElementById('sub-menu-01');
let woman = document.getElementById('sub-menu-02');

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

    for (var i = 0; i < div2.length; i++) {
        if(div2[i].classList[1] == "active"){
            console.log('active 삭제됨');
            div2[i].classList.remove("active");
        }
    }

    if(params.get('category')==0 || params.get('category')==1 || params.get('category')==2 || params.get('category')==3 || params.get('category')==4){
        liActive01();
    } else {
        liActive02();
    }

    console.log(params.get('category'));

    for(var i = 0; i < div2.length; i++) {
        if (params.get('category') == i) {
            div2[i].classList.add("active");
        }
    }
}
menuClick();
