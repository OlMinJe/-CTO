package com.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class EditorVO {
    private int edit_num;
    private int mb_seq;
    private int edit_list;
    private int edit_category;
    private String edit_title;
    private String edit_content;
    private String edit_photo;
    private Date edit_date;
    private int edit_hit;
    private String edit_comment;
    private int edit_like;
}
