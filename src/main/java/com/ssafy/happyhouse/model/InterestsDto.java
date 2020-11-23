package com.ssafy.happyhouse.model;


public class InterestsDto {
	private int no;
	private String email;
	private String dongcode;
	private String dongName;
	private String aptNo;
	private String aptName;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDongcode() {
		return dongcode;
	}
	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}
	public String getDongName() {
		return dongName;
	}
	public void setDongName(String dongName) {
		this.dongName = dongName;
	}
	public String getAptNo() {
		return aptNo;
	}
	public void setAptNo(String aptNo) {
		this.aptNo = aptNo;
	}
	public String getAptName() {
		return aptName;
	}
	public void setAptName(String aptName) {
		this.aptName = aptName;
	}
	@Override
	public String toString() {
		return "InterestsDto [no=" + no + ", email=" + email + ", dongcode=" + dongcode + ", dongName=" + dongName
				+ ", aptNo=" + aptNo + ", aptName=" + aptName + "]";
	}
}
