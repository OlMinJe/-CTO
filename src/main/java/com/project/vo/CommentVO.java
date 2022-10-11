package com.project.vo;


import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class CommentVO {
    private int comment_seq;
    private int mb_seq;
    private String mb_nick;
    private int com_num;
    private int talk_num;
    private String mb_doctor;
    private String comment_content;
    private int comment_like;
    private Date comment_date;
}
