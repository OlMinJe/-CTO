// import BLOCKS from "./tetrisBlocks"

// DOM
const playground = document.querySelector(".playground > ul");
const gameText = document.querySelector(".game_text");
const gemeScore = document.querySelector(".score");
const restartBut = document.querySelector(".game_text .restart");
const stopBtn = document.querySelector(".game_text .stop");

// Setting
const GAME_ROWS = 20;
const GAME_COLS = 10;
const BLOCKS = {
    tree: [
        [[2,1],[0,1],[1,0],[1,1]],
        [[1,2],[0,1],[1,0],[1,1]],
        [[1,2],[0,1],[2,1],[1,1]],
        [[2,1],[1,2],[1,0],[1,1]],
    ],
    square: [
        [[0,0],[0,1],[1,0],[1,1]],
        [[0,0],[0,1],[1,0],[1,1]],
        [[0,0],[0,1],[1,0],[1,1]],
        [[0,0],[0,1],[1,0],[1,1]],
    ],
    bar: [
        [[1,0],[2,0],[3,0],[4,0]],
        [[2,1],[2,0],[2,1],[2,2]],
        [[1,0],[2,0],[3,0],[4,0]],
        [[2,1],[2,0],[2,1],[2,2]],
    ],
    zee: [
        [[0,0],[1,0],[1,1],[2,1]],
        [[0,1],[1,0],[1,1],[0,2]],
        [[0,1],[1,1],[1,2],[2,2]],
        [[2,0],[2,1],[1,1],[1,2]],
    ],
    elLeft: [
        [[0,0],[0,1],[1,1],[2,1]],
        [[1,0],[1,1],[1,2],[0,2]],
        [[0,1],[1,1],[2,1],[2,2]],
        [[1,0],[2,0],[1,1],[1,2]],
    ],
    elRight: [
        [[1,0],[2,0],[1,1],[1,2]],
        [[0,0],[0,1],[1,1],[2,1]],
        [[0,2],[1,0],[1,1],[1,1]],
        [[0,1],[1,1],[2,1],[2,2]],
    ]
}

// variables
let score = 0;
let duration = 500;
let downInterval;
let tempMovingItem;

const movingItem = {
    type: "tree",
    direction: 3,
    top: 0,
    left: 0,
};

init()

// functions
function init() {
    tempMovingItem = {...movingItem};
    for(let i = 0; i < GAME_ROWS; i++) {
        prependNewLine();
    }
    generateNewBlock();
}

function prependNewLine() {
    const li = document.createElement("li");
    const ul = document.createElement("ul");
    for(let j = 0; j < GAME_COLS; j++){
        const matrix = document.createElement("li");
        ul.prepend(matrix);
    }
    li.prepend(ul);
    playground.prepend(li);
}

function renderBlocks(moveType = "") {
    const { type, direction, top, left } = tempMovingItem;
    const movingBlocks = document.querySelectorAll(".moving");
    movingBlocks.forEach(moving => {
        moving.classList.remove(type, "moving");
    })
    BLOCKS[type][direction].some(block => {
        const x = block[0] + left;
        const y = block[1] + top;
        const targer = playground.childNodes[y] ? playground.childNodes[y].childNodes[0].childNodes[x] : null;
        const isAvailable = checkEmpty(targer);
        if(isAvailable) {
            targer.classList.add(type, "moving");
        } else {
            tempMovingItem = { ...movingItem };
            if(moveType === 'retry') {
                clearInterval(downInterval);
                showGameoverText();
            }
            setTimeout(() => {
                renderBlocks('retry');
                if(moveType === "top"){
                    seizeBlock();
                }
            }, 0);
            return true;
        }
    });
    movingItem.left = left;
    movingItem.top = top;
    movingItem.direction = direction;
}

function seizeBlock() {
    const movingBlocks = document.querySelectorAll(".moving");
    movingBlocks.forEach(moving => {
        moving.classList.remove("moving");
        moving.classList.add("seized");
    })
    checkMetch();
}

function checkMetch() {
    const childNodes = playground.childNodes;
    childNodes.forEach(child => {
        let matched = true;
        child.children[0].childNodes.forEach(li => {
            if(li.classList.contains("seized")) {
                matched = false;
            }
        })
        if(matched){
            child.remove();
            prependNewLine();
            score++;
            gemeScore.innerHTML = score;
        }
    })

    generateNewBlock();
}

function generateNewBlock() {
    clearInterval(downInterval);
    downInterval = setInterval(() => {
        moveBlock('top', 1)
    }, duration);

    const blockArray = Object.entries(BLOCKS);
    const randomIndex = Math.floor(Math.random() * blockArray.length);
    movingItem.type = blockArray[randomIndex][0];
    movingItem.top = 0;
    movingItem.left = 3;
    movingItem.direction = 0;
    tempMovingItem = {...movingItem};
    renderBlocks();
}

function checkEmpty(targer) {
    if(!targer || targer.classList.contains("seized")){
        return false;
    }
    return true;
}

function moveBlock(moveType, amount) {
    tempMovingItem[moveType] += amount;
    renderBlocks(moveType);
}

function changeDirection() {
    const direction = tempMovingItem.direction;
    direction === 3 ? tempMovingItem.direction = 0 : tempMovingItem.direction += 1;
    renderBlocks();
}

function dropBlock() {
    clearInterval(downInterval);
    downInterval = setInterval(() => {
        moveBlock("top", 1)
    }, 10)
}

function showGameoverText() {
    gameText.style.display = "flex";
}

// event handling
document.addEventListener("keydown", e => {
    switch(e.keyCode){
        case 39:
            moveBlock("left", 1);
            break;
        case 37:
            moveBlock("left", -1);
            break;
        case 40:
            moveBlock("top", 1);
            break;
        case 38:
            changeDirection();
            break;
        case 32:
            dropBlock();
            break;
        default:
            break;
    }
})

function scoreFinal() {
    var scoreFinal = gemeScore.outerHTML;
    console.log(scoreFinal);
}

restartBut.addEventListener("click", () => {
    playground.innerHTML = "";
    gameText.style.display = "none";
    scoreFinal();
    gemeScore.innerHTML = 0;
    init();
})

stopBtn.addEventListener("click", () => {
    scoreFinal();

})
