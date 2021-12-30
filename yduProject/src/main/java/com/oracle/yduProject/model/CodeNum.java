package com.oracle.yduProject.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CodeNum {
	private int l_code;
	private int m_code;
	private String type_name;
	private String create_id;
	private Date create_date;
	
}
