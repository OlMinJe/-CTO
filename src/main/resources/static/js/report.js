let div1 = document.getElementsByClassName("div1");

function menuClick() {
    var sch = location.search;
    var params = new URLSearchParams(sch);

    if (params.get('category') == 0 || params.get('category') == 1 || params.get('category') == 2 || params.get('category') == 3 || params.get('category') == 4) {
        for (var j = 0; j < div2.length; j++) {
            div2[j].classList.remove("active");
        }
        liActive02();

        // 반응형 하위 메뉴 - 화면 크기가 767px 이하일 경우
        if (matchMedia("screen and (max-width: 767px)").matches) {
            mb_click();
        }

        for (var b = 0; b < div2.length; b++) {
            if (params.get('category') == b + 5) {
                div2[b].classList.add("active");
            }
        }
    }
}

menuClick();