$('.file').click(function (e) {
    /* e.preventDefault(); */
    document.getElementById('com_photo').click();
});
function changeValue(a) {
    console.log(a.files[0].name);
    $(".file span").text(a.files[0].name);
}

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
sub_menu();
