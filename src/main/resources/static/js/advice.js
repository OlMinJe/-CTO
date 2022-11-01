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
/*    for (let i = 0; i < normal_li.length; i++) {
        normal_li[i].addEventListener("click", function () {
            // 선택한 메뉴에 active 클래스 추가 및 이전 메뉴 active 클래스 삭제
            for (let j = 0; j < normal_li.length; j++) {
                if (normal_li[j].classList.contains('active') == true) {
                    normal_li[j].classList.remove('active');
                }
            }
            normal_li[i].classList.add('active');
        })
    }*/
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
/*    for(let i = 0; i < woman_li.length; i++) {
        woman_li[i].addEventListener("click", function () {
            // 선택한 메뉴에 active 클래스 추가 및 이전 메뉴 active 클래스 삭제
            for(let j = 0; j < woman_li.length; j++) {
                if(woman_li[j].classList.contains('active') == true) {
                    woman_li[j].classList.remove('active');
                }
            }
            woman_li[i].classList.add('active');
        })
    }*/
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


/* 하위 메뉴 */
function menuClick() {
    var sch = location.search;
    var params = new URLSearchParams(sch);

    for (var i = 0; i < div2.length; i++) {
        if(div2[i].classList[1] == "active"){
            console.log('active 삭제됨');
            div2[i].classList.remove("active");
        }
    }

    console.log(params.get('category'));

    for(var i = 0; i < div2.length; i++) {
        if (params.get('category') == i) {
            div2[i].classList.add("active");
        }
    }
}
menuClick();
