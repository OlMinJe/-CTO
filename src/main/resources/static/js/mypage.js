/*
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        header: {
            right: 'custom2 prevYear,prev,next,nextYear'
        },
        customButtons: {
            custom2: {
                text: '출석 체크',
                click: function() {
                    var dateStr = prompt('Enter a date in YYYY-MM-DD format');
                    var date = new Date(dateStr + 'T00:00:00'); // will be in local time

                    if (!isNaN(date.valueOf())) { // valid?
                        calendar.addEvent({
                            title: 'New event',
                            start: date,
                            allDay: true
                        });
                        alert('Great!!!');
                    } else {
                        alert('Invalid date.');
                    }
                }
            }
        },
    });

    calendar.render();
});
*/

$(document).ready(function(){
    $('#calendar').fullCalendar({
        header: {
            right: 'custom2 prevYear,prev,next,nextYear'
        },
        // 출석체크를 위한 버튼 생성
        customButtons: {
            custom2: {
                text: '출석 체크',
                id: 'check',
                click: function() {
                    if(this.id != null){
                        location.href="/users/attendances";
                        alert("출석 체크 완료!\n10포인트가 적립되었습니다!");
                        //ajax 통신 실패로 순식간에 넘어감
                        $(".fc-custom2-button").prop('disabled', true);
                        $(".fc-custom2-button").html('출석 완료');
                        console.log("CheckDate Success");
                        return true;
                    } else {
                        alert("출석 체크 실패");
                        console.log("CheckDate Fail");
                        return false;
                    }


                    // ajax 통신으로 출석 정보 저장하기
                    // POST "/users/attendances" -> { status: "success", date:"2018-07-01"}
                    // 통신 성공시 버튼 바꾸고, property disabled 만들기

                    /*$.ajax({
                        url: '/users/attendances',
                        type: 'POST',
                        data : {userId: userId},
                        dataType: 'text',
                        success: function (date) {
                            $(".fc-custom2-button").prop('disabled', true);
                            $(".fc-custom2-button").html('출석완료');
                        }
                    });*/
                }
            }
        },
    });
});


/* 모바일 메뉴 */
if (matchMedia("screen and (max-width: 991px)").matches) {
    function mobile_menu() {
        var menu = $('#menu_list_01').css('display');
        if (menu == 'none') {
            $('#menu_list_01').css('display', 'block');
            $('#menu_list_02').css('display', 'block');
        } else {
            $('#menu_list_01').css('display', 'none');
            $('#menu_list_02').css('display', 'none');
        }
    }
} else {
    function mobile_menu() {
        $('#menu_list_01').css('display', 'block');
        $('#menu_list_02').css('display', 'block');
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

/*
function calenders(){
    /!* 내정보 메인 - 달력(참고 사이트) https://www.youtube.com/watch?v=jFmcH5GVRs4 *!/
    const date = new Date();
    const renderCalender = () => {
        document.querySelector('.year_month').innerHTML = date.getFullYear() + '년 ' + (date.getMonth() + 1) + '월';

        // 지난 달 마지막 Date, 이번달 마지막 DAte
        const prevLast = new Date(date.getFullYear(), date.getMonth(), 0);
        const thisLast = new Date(date.getFullYear(), date.getMonth() + 1, 0);

        const PLDate = prevLast.getDate();
        const PLDay = prevLast.getDay();

        const TLDate = thisLast.getDate();
        const TLDay = thisLast.getDay();

        //Dates 기본 배열
        const prevDates = [];
        const thisDates = [...Array(TLDate + 1).keys()].slice(1);
        const nextDates = [];
        //prevDates 계산
        if (PLDay !== 6) {
            for (let i = 0; i < PLDay + 1; i++) {
                prevDates.unshift(PLDate - i);
            }
        }
        //nextDates 계산
        for (let i = 1; i < 7 - TLDate; i++) {
            nextDates.push(i);
        }

        //Dates 합치기
        const dates = prevDates.concat(thisDates, nextDates);
        const firstDateIndex = dates.indexOf(1);
        const lastDateIndex = dates.indexOf(TLDate);

        //Dates 정리
        dates.forEach((date, i) => {
            const condition = i >= firstDateIndex && i <= lastDateIndex + 1
                ? 'this'
                : 'other';
            dates[i] = '<div class="date"><span class="' + condition + '">' + date + '</span></div>';
        })

        document.querySelector('.dates').innerHTML = dates.join('');

        //오늘 날짜 표시
        const today = new Date();
        if (date.getMonth() === today.getMonth() && date.getFullYear() === today.getFullYear()) {
            for (let date of document.querySelectorAll('.this')) {
                if (+date.innerText === today.getDate()) {
                    date.classList.add('today');
                    break;
                }
            }
        }
    };
    renderCalender();
    const prevMonth = () => {
        date.setDate(1);
        date.setMonth(date.getMonth() - 1);
        renderCalender();
    }
    const nextMonth = () => {
        date.setDate(1);
        date.setMonth(date.getMonth() + 1);
        renderCalender();
    }
}*/
