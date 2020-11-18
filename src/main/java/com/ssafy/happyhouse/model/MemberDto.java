package com.ssafy.happyhouse.model;


public class MemberDto {

	private String userFname;
	private String userLname;
	private String userpwd;
	private String email;
	
	
	public String getUserFname() {
		return userFname;
	}
	public void setUserFname(String userFname) {
		this.userFname = userFname;
	}
	public String getUserLname() {
		return userLname;
	}
	public void setUserLname(String userLname) {
		this.userLname = userLname;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public MemberDto(String userFname, String userLname, String userpwd, String email) {
		super();
		this.userFname = userFname;
		this.userLname = userLname;
		this.userpwd = userpwd;
		this.email = email;
	}
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MemberDto [userFname=" + userFname + ", userLname=" + userLname + ", userpwd=" + userpwd + ", email="
				+ email + "]";
	}
	
}

