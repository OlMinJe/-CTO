
document.cookie = "safeCookie1=foo; SameSite=Lax";
document.cookie = "crossCookie=bar; SameSite=None; Secure";

// footer popup script
function onClickEvent01() {
    document.querySelector('#modal01').style.display = 'block';
}
function onClickEvent02() {
    document.querySelector('#modal02').style.display = 'block';
}
function offClickEvent(){
    document.querySelector('#modal01').style.display = 'none';
    document.querySelector('#modal02').style.display = 'none';
}

// header script
function headerAction() {
    $(".nav_title").mouseover(function(){

        $(this).children(".nav_sub").stop().slideDown();

        $(this).children("a").css({'background-color' : "#fff"});
    });
    $(".nav_title").mouseleave(function(){
        $(this).children(".nav_sub").stop().slideUp();
        $(this).children("a").css({'background-color' : "#9ab3f5"});
    });
    $(".nav_title").mouseover(function(){
        $(this).children(".nav_sub").stop().slideDown();

        $(this).children("a").css({'background-color' : "#fff"});
    });
    $(".nav_title").mouseleave(function(){
        $(this).children(".nav_sub").stop().slideUp();
        $(this).children("a").css({'background-color' : "#9ab3f5"});
    });


    let m_title ='';
    $(".m_nav_title").click(function(){

        if(m_title != $(this).prop("id")){
            $(".m_nav_sub").stop().slideUp();
            $(this).children(".m_nav_sub").stop().slideDown(250);
            m_title = $(this).prop("id");
        }
        else{
            $(this).children(".m_nav_sub").stop().slideUp();
            m_title = '';
        }
    });

    let bool_menu = true;
    $("#burgerbtn").click(function(){
        if( bool_menu == true){
            $("#slide_menu").animate({'right' : '1px'},160);
            $("#slide_bg").animate({'left' : '0'},160);
            bool_menu = false;
        }
        else{
            $("#wrap").animate({'left' : '0'},200);
            bool_menu = true;
        }
    });

    $("#close_btn").click(function(){
        $("#slide_menu").animate({'right' : '-50%'},200);
        $("#slide_bg").animate({'left' : '-50%'},100);

        bool_menu = true;
    });

    $("#slide_bg").click(function(){
        $("#slide_menu").animate({'right' : '-50%'},200);
        $("#slide_bg").animate({'left' : '-50%'},100);

        bool_menu = true;
    });
}

// fixed_header
if(matchMedia("screen and (min-width: 772px)").matches){
    console.log('test');
    $(window).scroll(function () {

        var scrollTop = $(this).scrollTop(); //?????? ????????????
        var navHeight = $("#header").outerHeight(true); //Nav ?????????

        if (scrollTop >= navHeight) {
            $(".fixed_header").css("display", "inline-flex");
        } else {
            $(".fixed_header").css("display", "none");
        }

    });
}

// ?????? ??????
const WAPI_KEYS = "079aa2ca018001daee6e82cb90f282c0"; //add your API KEY
const COORDS = 'coords'; //????????? ?????? ??????

function init() {
    askForCoords();
}

//????????? ???????????? ??????
function askForCoords() {
    navigator.geolocation.getCurrentPosition(handleSuccess, handleError);
}

//????????? ????????? ???????????? ??? ????????? ??????
function handleSuccess(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const coordsObj = {
        latitude,
        longitude
    };
    getWeather(latitude, longitude); //?????? ???????????? ???????????? ??????????????? ????????????.
}
//????????? ????????? ???????????? ??? ????????? ??????
function handleError() {
    console.log("can't not access to location");
}

//?????? api??? ?????? ????????? ????????? ???????????? ????????????.
function getWeather(lat, lon) {
    const weatherInfo = document.querySelector('.weatherInfo');
    const weatherIconImg = document.querySelector(".weatherIcon");
    const weatherInfo01 = document.querySelector('.weatherInfo01');
    const weatherIconImg01 = document.querySelector(".weatherIcon01");
    fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${WAPI_KEYS}&units=metric&lang=kr`).then(function(response) {
        return response.json();
    })
    .then(function(json) {
        //??????, ??????, ????????????, ?????????????????? ?????????.
        const temperature = json.main.temp;
        const place = json.name;
        const weatherDescription = json.weather[0].description;
        const weatherIcon = json.weather[0].icon;
        const weatherIconAdrs = `http://openweathermap.org/img/wn/${weatherIcon}@2x.png`;

        //????????? ???????????? ????????????.
        //weatherInfo.innerText = temperature + "??C/ @" + place + " / " + weatherDescription;
        weatherInfo.innerText = temperature + "??C\n" + place;
        weatherInfo01.innerText = temperature + "??C " + place;
        weatherIconImg.setAttribute('src', weatherIconAdrs);
        weatherIconImg01.setAttribute('src', weatherIconAdrs);
    })
    .catch((error) => console.log("error:", error));
}

init();