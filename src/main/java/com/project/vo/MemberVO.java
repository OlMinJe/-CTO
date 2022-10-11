package com.project.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.sql.Date;


@Setter
@Getter
@ToString
@NoArgsConstructor
public class MemberVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer mb_seq;
	private String mb_id;
	private String mb_email;
	private String mb_pw;
	private String mb_name;
	private String mb_addr;
	private String mb_sex;
	private String mb_nick;
	private String mb_img;
	private String mb_doctor;
	private Date reg_date;
	private Boolean check_date;
}
