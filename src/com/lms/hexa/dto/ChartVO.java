package com.lms.hexa.dto;

public class ChartVO {
	
	private String area1;
	private String area2;
	private String area3;
	private String area4;
	private String area5;
	
	private int totalNum; // 전체 개수
	private int getNum; // 맞은 개수
	private int goodTotalNum; // 난이도 상 전체 개수
	private int goodNum; // 난이도 상 맞은 개수
	
	private int fairTotalNum; // 난이도 중 전체 개수
	private int fairNum; // 난이도 중 맞은 개수
	
	private int poorTotalNum; // 난이도 하 전체 개수
	private int poorNum; // 난이도 하 맞은 개수
	
	
	
	
	public String getArea1() {
		return area1;
	}
	public void setArea1(String area1) {
		this.area1 = area1;
	}
	public String getArea2() {
		return area2;
	}
	public void setArea2(String area2) {
		this.area2 = area2;
	}
	public String getArea3() {
		return area3;
	}
	public void setArea3(String area3) {
		this.area3 = area3;
	}
	public String getArea4() {
		return area4;
	}
	public void setArea4(String area4) {
		this.area4 = area4;
	}
	public String getArea5() {
		return area5;
	}
	public void setArea5(String area5) {
		this.area5 = area5;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getGetNum() {
		return getNum;
	}
	public void setGetNum(int getNum) {
		this.getNum = getNum;
	}
	public int getGoodTotalNum() {
		return goodTotalNum;
	}
	public void setGoodTotalNum(int goodTotalNum) {
		this.goodTotalNum = goodTotalNum;
	}
	public int getGoodNum() {
		return goodNum;
	}
	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}
	public int getFairTotalNum() {
		return fairTotalNum;
	}
	public void setFairTotalNum(int fairTotalNum) {
		this.fairTotalNum = fairTotalNum;
	}
	public int getFairNum() {
		return fairNum;
	}
	public void setFairNum(int fairNum) {
		this.fairNum = fairNum;
	}
	public int getPoorTotalNum() {
		return poorTotalNum;
	}
	public void setPoorTotalNum(int poorTotalNum) {
		this.poorTotalNum = poorTotalNum;
	}
	public int getPoorNum() {
		return poorNum;
	}
	public void setPoorNum(int poorNum) {
		this.poorNum = poorNum;
	}

}
