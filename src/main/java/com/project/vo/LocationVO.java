package com.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class LocationVO {
    private int loc_num;
    private int mb_seq;
    private Date loc_date;
    private int loc_category;
    private String loc_content;
}
