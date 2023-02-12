package com.lms.hexa.command;

public class AttandanceMaker {
	
	
	private int totalNum = 1;
	private int totalNum2 = 1;
	private int ynNum = 0;
	private int ynnNum = 0;
	
	AttandanceNum att = new AttandanceNum();
	
	private void calcData() {
		
		ynnNum = (totalNum - ynNum);
	}
	
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
		
		calcData();
	}
	public int getTotalNum2() {
		return totalNum2;
	}
	public void setTotalNum2(int totalNum2) {
		this.totalNum2 = totalNum2;
		
	
	}
	public int getYnNum() {
		return ynNum;
	}
	public void setYnNum(int ynNum) {
		this.ynNum = ynNum;
		
		calcData();
	}
	
	
	public int getYnnNum() {
		return ynnNum;
	}
	public void setYnnNum(int ynnNum) {
		this.ynnNum = ynnNum;
	}



	public AttandanceNum getAtt() {
		return att;
	}
	public void setAtt(AttandanceNum att) {
		this.att = att;
	}
	
	
	
}
