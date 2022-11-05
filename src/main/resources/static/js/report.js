let div1 = document.getElementsByClassName("div1");

function menuClick() {
    var sch = location.search;
    var params = new URLSearchParams(sch);

    if (params.get('category') == 0 || params.get('category') == 1 || params.get('category') == 2 || params.get('category') == 3 || params.get('category') == 4) {
        for (var i = 0; i < div1.length; i++) {
            div1[i].classList.remove("active");
        }

        for(var a = 0; a < div1.length; a++) {
            if (params.get('category') == a) {
                div1[a].classList.add("active");
            }
        }
    }
}

menuClick();