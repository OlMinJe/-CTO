$(document).ready(function(){
    content_table_01();
});

/* content */
let table = document.getElementById('notice-table');
let table_head = document.getElementById('notice-table-head');
let table_tbody = document.getElementById('notice-table-body');

function content_table_01(){
    table_head.innerHTML =
        '<tr>'+
        '<th style="width: 10%;">No.</th>'+
        '<th style="width: 10%;">작성자</th>'+
        '<th style="width: auto;">제목</th>'+
        '<th style="width: 10%;">댓글수</th>'+
        '</tr>';
    for(let i = 0; i < 10; i++) { //해당 카테고리 seq 값 만큼 돌리는걸로 바꾸기
        table_tbody.innerHTML +=
            '<tr class="adivce-table">'+
            '<td class="diplay_no">' + '<span>' + (i+1) + '</span>' + '</td>'+
            '<td class="wirter">' + '<span>' + '글쓴이' + '</span>' +'</td>'+
            '<td class="title">' + '<span><a href="/notice/notice_view.jsp">' + i + '</a></span>' + '</td>'+
            '<td class="comment_count">' + '<span>' + '100' + '</span>' + '</td>'+
            '</tr>';
    }
}



