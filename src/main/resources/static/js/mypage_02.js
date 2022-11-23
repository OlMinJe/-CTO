$(document).ready(function(){
    mypage_02();
});

function mypage_02(){
    var e = document.getElementById('community_table');

    for(var i = 0; i < 1; i++){ /* 저장된 seq의 값만큼 돌아가도록 변경하기*/
        e.innerHTML += '<tr>'+
                         '<td class="diplay_no">' + (i+1) + '</td>'+
                         '<td class="category">' + '일상' + '</td>'+
                         '<td class="table_title">' + '플레이리스트 추천' + '</td>'+
                         '<td class="comment">' + 3 + '</td>'+
                         '<td class="writer">' + 'Y' + '</td>'+
                         '<td class="comment_use">' + 'N' + '</td>'+
                     '</tr>';
        e.innerHTML += '<tr>'+
            '<td class="diplay_no">' + (i+2) + '</td>'+
            '<td class="category">' + '취미' + '</td>'+
            '<td class="table_title">' + '다들 취미가 뭐야' + '</td>'+
            '<td class="comment">' + 5 + '</td>'+
            '<td class="writer">' + 'Y' + '</td>'+
            '<td class="comment_use">' + 'Y' + '</td>'+
            '</tr>';
        e.innerHTML += '<tr>'+
            '<td class="diplay_no">' + (i+3) + '</td>'+
            '<td class="category">' + '일상' + '</td>'+
            '<td class="table_title">' + '친해지고 싶어요!' + '</td>'+
            '<td class="comment">' + 2 + '</td>'+
            '<td class="writer">' + 'Y' + '</td>'+
            '<td class="comment_use">' + 'Y' + '</td>'+
            '</tr>';
        e.innerHTML += '<tr>'+
            '<td class="diplay_no">' + (i+4) + '</td>'+
            '<td class="category">' + '취업/진로' + '</td>'+
            '<td class="table_title">' + '취준생인데 사회에 나가기 두려워' + '</td>'+
            '<td class="comment">' + 7 + '</td>'+
            '<td class="writer">' + 'Y' + '</td>'+
            '<td class="comment_use">' + 'N' + '</td>'+
            '</tr>';
        e.innerHTML += '<tr>'+
            '<td class="diplay_no">' + (i+5) + '</td>'+
            '<td class="category">' + '음식' + '</td>'+
            '<td class="table_title">' + '야식 골라줘' + '</td>'+
            '<td class="comment">' + 1 + '</td>'+
            '<td class="writer">' + 'Y' + '</td>'+
            '<td class="comment_use">' + 'N' + '</td>'+
            '</tr>';
        /*document.querySelector('.community_table .diplay_no').innerHTML = '<span>' + (i+1) + '</span>';
        document.querySelector('.community_table .category').innerHTML = '<span>' + i + '</span>';
        document.querySelector('.community_table .table_title').innerHTML = '<span>' + i + '</span>';
        document.querySelector('.community_table .comment').innerHTML = '<span>' + i + '</span>';
        document.querySelector('.community_table .writer').innerHTML = '<span>' + 'Y' + '</span>';
        document.querySelector('.community_table .comment_use').innerHTML = '<span>' + 'N' + '</span>';*/
    }
}

/* 필터 기간 value값 today */
document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
document.getElementById('endDate').value = new Date().toISOString().substring(0, 10);


/* 카테고리 필터 */
const filter01 = document.querySelectorAll('.filter01'); //체크버튼
const filter02 = document.querySelectorAll('.filter02'); //체크버튼
const filter03 = document.querySelectorAll('.filter03'); //체크버튼
const filterAll_01 = document.querySelector('.filter01.all'); //'all' 체크버튼
const filterAll_02 = document.querySelector('.filter02.All'); //'all' 체크버튼
const filterAll_03 = document.querySelector('.filter03.All'); //'all' 체크버튼

function filter_checked(obj){ //체크하기
    obj.parentNode.querySelector('input').checked = true;
}
function filter_unChecked(obj){ //체크해제
    obj.parentNode.querySelector('input').checked = false;
}

function filter_unChecked_01(obj){ //체크해제
    obj.parentNode.querySelector('input').checked = false;
    if ((obj.outerHTML == '<label class="filter01 normal">일반</label>') || (filter01.length - 2)) {
        if(document.getElementsByClassName('filter_all')[0].checked == false){
            document.querySelector('.inner_normal').innerHTML = '';
            if(document.getElementsByClassName('filter_normal')[0].checked == true){
                document.querySelector('.inner_normal').innerHTML = '<div class="col-12 filter_sub_title"><div></div></div>' +
                    '<li><input type="checkbox" value="" checked><label class="filter02">일상</label></li>\n' +
                    '<li><input type="checkbox" value="" checked><label class="filter02">취미</label></li>\n' +
                    '<li><input type="checkbox" value="" checked><label class="filter02">유머</label></li>\n' +
                    '<li><input type="checkbox" value="" checked><label class="filter02">음식</label></li>\n' +
                    '<li><input type="checkbox" value="" checked><label class="filter02">정보</label></li>\n' +
                    '<li><input type="checkbox" value="" checked><label class="filter02">취업/진로</label></li>\n' +
                    '<li><input type="checkbox" value="" checked><label class="filter02">기타</label></li>';
            }
        }
    }
}

function filter_checked_01(obj) { //체크하기
    obj.parentNode.querySelector('input').checked = true;
    if (obj.outerHTML == '<label class="filter01 normal">일반</label>' || (filter01.length - 2)) {
        if(document.getElementsByClassName('filter_all')[0].checked == true || document.getElementsByClassName('filter_editor')[0].checked == true){
            document.querySelector('.inner_normal').innerHTML = '';
        } else{
        document.querySelector('.inner_normal').innerHTML = '<div class="col-12 filter_sub_title"></div>' +
            '<li><input type="checkbox" value="" checked><label class="filter02">일상</label></li>\n' +
            '<li><input type="checkbox" value="" checked><label class="filter02">취미</label></li>\n' +
            '<li><input type="checkbox" value="" checked><label class="filter02">유머</label></li>\n' +
            '<li><input type="checkbox" value="" checked><label class="filter02">음식</label></li>\n' +
            '<li><input type="checkbox" value="" checked><label class="filter02">정보</label></li>\n' +
            '<li><input type="checkbox" value="" checked><label class="filter02">취업/진로</label></li>\n' +
            '<li><input type="checkbox" value="" checked><label class="filter02">기타</label></li>';
        }
    }
}


function resetBtn(){
    $("input:checkbox").prop("checked", true);
    if(document.getElementsByClassName('filter_normal')[0].checked == true){
        document.querySelector('.inner_normal').innerHTML = '';
    }
}

filter01.forEach(function(el){
    el.addEventListener('click', function(e){
        if(e.target != filterAll_01){
            if(e.target.parentNode.querySelector('input').checked !== true){
                filter_checked_01(e.target);
                const checked = document.querySelectorAll('.filter_wrap input:checked');
                if(filter01.length -1 == checked.length){ //모두 체크되어있다면 all도 체크
                    filter_checked_01(filterAll_01);
                }
            }else{
                filter_unChecked_01(e.target);
                filter_unChecked_01(filterAll_01); //한개라도 체크 안되면 all버튼 체크 해제
            }
        }
        else{
            if(e.target.parentNode.querySelector('input').checked !== true){
                filter01.forEach(function(obj){
                    filter_checked_01(obj); //모두체크
                })
            }else{
                filter01.forEach(function(obj){
                    filter_unChecked_01(obj); //모두해제
                })
            }
        }
    })
})

filter02.forEach(function(el){
    el.addEventListener('click', function(e){
        if(e.target != filterAll_02){
            if(e.target.parentNode.querySelector('input').checked !== true){
                filter_checked(e.target);
                const checked = document.querySelectorAll('.filter_wrap input:checked');
                if(filter02.length -1 == checked.length){ //모두 체크되어있다면 all도 체크
                    filter_unChecked(filterAll_02);
                }
            }else{
                filter_unChecked(e.target);
                filter_unChecked(filterAll_02); //한개라도 체크 안되면 all버튼 체크 해제
            }
        }
        else{
            if(e.target.parentNode.querySelector('input').checked !== true){
                filter02.forEach(function(obj){
                    filter_checked(obj); //모두체크
                })
            }else{
                filter02.forEach(function(obj){
                    filter_unChecked(obj); //모두해제
                })
            }
        }
    })
})

filter03.forEach(function(el){
    el.addEventListener('click', function(e){
        if(e.target != filterAll_03){
            if(e.target.parentNode.querySelector('input').checked !== true){
                filter_checked(e.target);
                const checked = document.querySelectorAll('.filter_wrap input:checked');
                if(filter02.length -1 == checked.length){ //모두 체크되어있다면 all도 체크
                    filter_unChecked(filterAll_03);
                }
            }else{
                filter_unChecked(e.target);
                filter_unChecked(filterAll_03); //한개라도 체크 안되면 all버튼 체크 해제
            }
        }
        else{
            if(e.target.parentNode.querySelector('input').checked !== true){
                filter03.forEach(function(obj){
                    filter_checked(obj); //모두체크
                })
            }else{
                filter03.forEach(function(obj){
                    filter_unChecked(obj); //모두해제
                })
            }
        }
    })
})