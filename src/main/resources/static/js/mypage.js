$(document).ready(function(){
    $('#calendar').fullCalendar({
        header: {
            right: 'custom2 prevYear,prev,next,nextYear'
        },
        // 출석체크를 위한 버튼 생성
        customButtons: {
            custom2: {
                text: '출석체크하기',
                id: 'check',
                click: function() {
                    // ajax 통신으로 출석 정보 저장하기
                    // POST "/users/attendances" -> { status: "success", date:"2018-07-01"}
                    // 통신 성공시 버튼 바꾸고, property disabled 만들기

                    $.ajax({
                        url: '/users/attendances',
                        type: 'POST',
                        data : {userId: userId},
                        dataType: 'text',
                        success: function (date) {
                            $(".fc-custom2-button").prop('disabled', true);
                            $(".fc-custom2-button").html('출석완료');
                        }
                    });
                }
            }
        },
        // 달력 정보 가져오기
        eventSources: [
            {
                // ajax 통신으로 달력 정보 가져오기
                // GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}

                url: '/users/attendances',
                type: 'GET',
                dataType: "JSON",
                success: function (data) { },
                error: function() {
                    alert('there was an error while fetching events!');
                },
                color: 'purple',
                textColor: 'white'
            }
        ]
    });
});

/* 모바일 메뉴 */
if(matchMedia("screen and (max-width: 991px)").matches){
    function mobile_menu() {
        var menu = $('#menu_list_01').css('display');
        if( menu == 'none') {
            $('#menu_list_01').css('display','block');
            $('#menu_list_02').css('display','block');
        } else {
            $('#menu_list_01').css('display','none');
            $('#menu_list_02').css('display','none');
        }
    }
} else {
    function mobile_menu() {
        $('#menu_list_01').css('display','block');
        $('#menu_list_02').css('display','block');
    }

}



//새고할 때 고정 (작업 필요) https://snupi.tistory.com/195 */
/*
window.addEventListener('beforeunload', (event) => {
    // 표준에 따라 기본 동작 방지
    event.preventDefault();
    // Chrome에서는 returnValue 설정이 필요함
    event.returnValue = '';
});*/
