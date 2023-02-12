package com.lms.hexa.command;

public class AttandanceNumCommand {
	
	
	private String totalNum;
	private String totalNum2;
	private String ynNum;
	private String ynnNum;
	
	
	
	public String getYnnNum() {
		return ynnNum;
	}
	public void setYnnNum(String ynnNum) {
		this.ynnNum = ynnNum;
	}
	public String getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(String totalNum) {
		this.totalNum = totalNum;
	}
	public String getTotalNum2() {
		return totalNum2;
	}
	public void setTotalNum2(String totalNum2) {
		this.totalNum2 = totalNum2;
	}
	public String getYnNum() {
		return ynNum;
	}
	public void setYnNum(String ynNum) {
		this.ynNum = ynNum;
	}
	
	public AttandanceNum toAttandanceNum() {
		AttandanceNum att = new AttandanceNum();
		
		if(totalNum !=null && !totalNum.isEmpty() ) {
			att.setTotalNum(Integer.parseInt(totalNum));				
		}				
		if(totalNum2 !=null && !totalNum2.isEmpty() ) {
			att.setTotalNum2(Integer.parseInt(totalNum2));				
		}				
		if(ynNum !=null && !ynNum.isEmpty()) {
			att.setYnNum(Integer.parseInt(ynNum));
		}
		if(ynnNum !=null && !ynnNum.isEmpty()) {
			att.setYnNum(Integer.parseInt(ynnNum));
		}
		
		return att;
	}
}
