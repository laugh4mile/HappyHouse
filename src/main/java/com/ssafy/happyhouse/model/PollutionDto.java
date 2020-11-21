package com.ssafy.happyhouse.model;

public class PollutionDto {

	private int no;
	private String name;
	private String dongcode;
	private String dong;
	private String bizcode;
	private String address;
	private String lng;
	private String lat;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDongcode() {
		return dongcode;
	}
	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBizcode() {
		return bizcode;
	}
	public void setBizcode(String bizcode) {
		this.bizcode = bizcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	@Override
	public String toString() {
		return "PollutionDto [no=" + no + ", name=" + name + ", dongcode=" + dongcode + ", dong=" + dong + ", bizcode="
				+ bizcode + ", address=" + address + ", lng=" + lng + ", lat=" + lat + "]";
	}
	
	
}
