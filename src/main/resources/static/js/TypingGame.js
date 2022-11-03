
const GAME_TIME = 9;
let score = 0;
let time = GAME_TIME;
let isPlaying = false;
let timeInterval;
let checkInterval;
let words = [];


const wordInput = document.querySelector('.word-input');
const wordDisplay = document.querySelector('.word-display');
const scoreDisplay = document.querySelector('.score');
const timeDisplay = document.querySelector('.time');
const button = document.querySelector('.button');


init();

function init() {
    buttonChange("게임 로딩중");
    getWords();
    wordInput.addEventListener('input', checkMatch)
}

// 게임 실행 함수
function run () {
    if(isPlaying) {
        return;
    }
    isPlaying = true;
    time = GAME_TIME;
    wordInput.focus();
    scoreDisplay.innerText = 0;
    timeInterval = setInterval(countDown,1000);
    // 짧은 시간 동안 게임이 계속 실행 되는지를 체크
    checkInterval = setInterval(checkStatus, 50)
    buttonChange("게임 중")
}


function checkStatus () {
    if(!isPlaying && time === 0) {
        buttonChange("게임 시작")
        clearInterval(checkInterval)
    }
}


// 단어 불러오는 함수
function getWords() {
    axios.get('https://random-word-api.herokuapp.com/word?number=100')  // 랜덤 단어 api
        .then(function (response) {
            response.data.forEach((word) => {
                if (word.length < 10) {
                    words.push(word);
                }
            })
            console.log(words)
            buttonChange("게임 시작");

        })

        .catch(function (error) {
            // 에러 핸들링
            console.log(error);
        })
}

//console.log(wordInput.value.toLowerCase() === wordDisplay.innerText.toLowerCase())


// 단어 일치 체크하는 함수
function checkMatch (){
    if(wordInput.value.toLowerCase() === wordDisplay.innerText.toLowerCase()) {
        wordInput.value = "";
        // 게임중이 아니라면 점수 X -> return 실행
        if(!isPlaying) {
            return;
        }
        score++;
        // input창 초기화
        scoreDisplay.innerText = score;
        time = GAME_TIME;
        const randomIndex = Math.floor(Math.random() * words.length);
        wordDisplay.innerText = words[randomIndex]
    }
}


// 시간이 카운트다운 되도록 하는 함수
function countDown () {
    time > 0 ? time-- : isPlaying = false;
    if(!isPlaying) {
        clearInterval(timeInterval)
    }
    timeDisplay.innerText = time;
}



// 버튼 변경 함수
function buttonChange(text) {
    button.innerText = text;
    text === '게임 시작' ? button.classList.remove('loading') : button.classList.add('loading')
}