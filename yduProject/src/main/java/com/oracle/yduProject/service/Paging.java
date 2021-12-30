package com.oracle.yduProject.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {

	private int currentPage = 1;
	private int rowPage = 10; //pageSize
	private int pageBlock = 10;
	private int start;
	private int end;
	private int startPage;
	private int endPage;  
	private int total; 
	private int totalPage; //page Count
	
	public Paging(int total, String currentPage1) {
		this.total = total;
		if(currentPage1 == null || currentPage1.equals("")) {
			this.currentPage = 1;
		}else {
			this.currentPage = Integer.parseInt(currentPage1);
		}
		start = (currentPage - 1) * rowPage + 1; // 시작시 1
		end   =  start + rowPage - 1; //시작시 10
		totalPage = (int) Math.ceil((double)total / rowPage); //시작시 2
		startPage = currentPage - (currentPage - 1) % pageBlock; //시작시 1
		endPage   = startPage + pageBlock - 1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}

	@Override
	public String toString() {
		return "Paging [currentPage=" + currentPage + ", rowPage=" + rowPage + ", pageBlock=" + pageBlock + ", start="
				+ start + ", end=" + end + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", totalPage=" + totalPage + "]";
	}
	
	
	
}
