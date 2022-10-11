$(function(){
    $("#find_id_btn").click(function(){
        location.href='/find_id_form.do';
    });
    $("#find_pw_btn").click(function(){
        location.href='/find_pw_form.do';
    });
})

/* session 상태확인 */
var userId = '<%=(String)session.getAttribute("userId")%>';
if(userId =="null"){
    console.log("세션 null상태");
} else {
    console.log(userId);
}

/* /boardDelete에서 오는 msg */
var msg = '${msg}'
if(msg == 'sessionFin') {
    alert("로그인이 풀렸으니 재로그인해주세요.")
}