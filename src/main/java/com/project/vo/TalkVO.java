package com.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class TalkVO {
    private int talk_num;
    private int mb_seq;
    private int talk_list;
    private int talk_category;
    private String talk_title;
    private int talk_like;
    private String talk_content;
    private String talk_photo;
    private Date talk_date;
    private int talk_hit;
    private int talk_comment; //댓글 수 카운트를 위해 int로 변경
    private Integer mb_doctor;
    private String mb_nick;
}

