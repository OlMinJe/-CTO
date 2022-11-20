// // const form = document.querySelector(".detail_input");
// // const input = form.querySelector("input");
// // const output = document.querySelector(".detail_output");
//
// const form = document.querySelector(".detail_input");
// const input = form.querySelector("input");
// const output = document.querySelector(".detail_output");
//
// function outputList(text) {
//     //출력을 위해 output 함수를 생성
//     const li = document.createElement("li");
//     const span = document.createElement("span");
//     span.innerText = text; //현재입력된 값을 받아 span에 저장
//     li.appendChild(span); //li태그 안에 span태그 넣기
//     output.appendChild(li); //ul태그 안에 li태그 넣기
// }
//
// function submitHandler(event) {
//     event.preventDefault(); //submit하면 정보가 날라가고 새로고침한거로 된거기 때문에 그걸 막기위해 event.preventDefault 값을 써줌.
//     const currentValue = input.value; //input에서 온 value를 현재값으로 가져옴.
//     outputList(currentValue);
//     input.value = ""; //input 제출 후 공백란으로 남기기 위해 사용
// }
//
// function init() {
//     form.addEventListener("submit", submitHandler);
//     //input 에서 submit 되어 있을때,submitHandler함수가 실행되도록 이벤트 추가
// }
// init();


$(".w3-pagination a").click(function() {

    var selector = $(this);

    var current_index = $(".w3-pagination a").index(this);
    var current_class = selector.attr("class");

    if (current_index != 0 || current_index != 6) {

        $(".w3-pagination a").each(function(index) {

            if (index == 0 || index == 6) {
                return true;
            } else {
                if (index == current_index) {
                    $(this).addClass("w3-pale-red");
                } else {
                    $(this).removeClass("w3-pale-red");
                }
            }

        });

    }

});