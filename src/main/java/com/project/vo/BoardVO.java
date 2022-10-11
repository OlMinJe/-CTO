package com.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class BoardVO {

	private int com_num;
	private int mb_seq;
	private int com_list;
	private int com_category;
	private String com_title;
	private int com_like;
	private String com_content;
	private String com_photo;
	private Date com_date;
	private int com_hit;
	private int com_comment; //댓글 수 카운트를 위해 int로 변경
	private String mb_doctor;
	private String mb_nick;
}
