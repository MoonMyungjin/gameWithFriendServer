package com.lms.hexa.command;

public class AttandanceNum {
	
	
	private int totalNum = 1;
	private int totalNum2 = 1;
	private int ynNum = 0;
	private int ynnNum = 0;
	
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		if(totalNum<1) {
			this.totalNum=1;
		}else {
			this.totalNum = totalNum;
		}
	}
	public int getTotalNum2() {
		return totalNum2;
	}
	public void setTotalNum2(int totalNum2) {
		if(totalNum2<1) {
			this.totalNum2=1;
		}else {
			this.totalNum2 = totalNum2;
		}
	}
	public int getYnNum() {
		return ynNum;
	}
	public int getYnnNum() {
		return ynnNum;
	}
	
	public void setYnnNum(int ynnNum) {
		this.ynnNum = ynnNum;
	}
	public void setYnNum(int ynNum) {
		this.ynNum = ynNum;
	}
	
	
}
