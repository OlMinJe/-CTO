package com.project.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class LikeVO {
    private int like_num;
    private int com_num;
    private String mb_nick;
    private int like_check;
    private int count;//좋아요가 눌린 상태인가 아닌가.
    private int edit_num;
}
