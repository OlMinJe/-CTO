package com.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ReportVO {
    private int re_num;
    private int mb_seq;
    private int report_category;
    private String re_title;
    private String re_content;
    private String re_photo;
    private Date re_date;
}
