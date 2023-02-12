package com.lms.hexa.command;

public class PageMaker {
	
	private int totalCount; // ? „ì²? ?–‰?˜ ê°œìˆ˜
	private int startPage = 1; // ?‹œ?‘ ?˜?´ì§? ë²ˆí˜¸
	private int endPage = 1; // ë§ˆì?ë§? ?˜?´ì§? ë²ˆí˜¸
	private int realEndPage; // ? ?˜?´ì§? ë²ˆí˜¸
	private boolean prev; // ?´? „?˜?´ì§? ë²„íŠ¼ ?œ ë¬?
	private boolean next; // ?‹¤?Œ?˜?´ì§? ë²„íŠ¼ ?œ ë¬?

	private int displayPageNum = 10; // ?•œ ?˜?´ì§??— ë³´ì—¬ì¤? ?˜?´ì§?ë²ˆí˜¸ ê°œìˆ˜
	
	Criteria cri = new Criteria(); 
	
	// starPage,endPage, prev, next ?„¤? •. by totalCount
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) 
							* displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		realEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (startPage < 0) {
			startPage = 1;
		}
		if (endPage > realEndPage) {
			endPage = realEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage >= realEndPage ? false : true;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getRealEndPage() {
		return realEndPage;
	}

	public void setRealEndPage(int realEndPage) {
		this.realEndPage = realEndPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	
}
