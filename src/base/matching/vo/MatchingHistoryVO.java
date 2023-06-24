package base.matching.vo;

import java.util.Date;

public class MatchingHistoryVO {

	private int mMatchingID;
	private String mMyID;
	private String mUserID;
	private String mGameType;
	private int mMatchingScore;
	private Date mMatchingDate;
	private String mUserRank;
	private String mUserChmpion;
	private String mUserTime;

	public int getmMatchingID() {
		return mMatchingID;
	}

	public void setmMatchingID(int mMatchingID) {
		this.mMatchingID = mMatchingID;
	}

	public String getmMyID() {
		return mMyID;
	}

	public void setmMyID(String mMyID) {
		this.mMyID = mMyID;
	}

	public String getmUserID() {
		return mUserID;
	}

	public void setmUserID(String mUserID) {
		this.mUserID = mUserID;
	}

	public String getmGameType() {
		return mGameType;
	}

	public void setmGameType(String mGameType) {
		this.mGameType = mGameType;
	}

	public int getmMatchingScore() {
		return mMatchingScore;
	}

	public void setmMatchingScore(int mMatchingScore) {
		this.mMatchingScore = mMatchingScore;
	}

	public Date getmMatchingDate() {
		return mMatchingDate;
	}

	public void setmMatchingDate(Date mMatchingDate) {
		this.mMatchingDate = mMatchingDate;
	}

	public String getmUserRank() {
		return mUserRank;
	}

	public void setmUserRank(String mUserRank) {
		this.mUserRank = mUserRank;
	}

	public String getmUserChmpion() {
		return mUserChmpion;
	}

	public void setmUserChmpion(String mUserChmpion) {
		this.mUserChmpion = mUserChmpion;
	}

	public String getmUserTime() {
		return mUserTime;
	}

	public void setmUserTime(String mUserTime) {
		this.mUserTime = mUserTime;
	}
}
