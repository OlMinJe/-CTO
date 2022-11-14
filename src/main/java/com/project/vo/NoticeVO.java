package com.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class NoticeVO {
    private int notice_num;
    private int mb_seq;
    private int notice_list;
    private String notice_title;
    private String notice_content;
    private Date notice_date;
    private String mb_nick;
    private int notice_category;
}
