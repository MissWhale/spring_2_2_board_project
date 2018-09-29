package com.inhatc.domain;

public class Criteria {
	private int maxPost;		//페이지당 표시 될 게시물
	private int firstPageNo;	//첫번째 페이지 번호
	private int prevPageNo;		//이전 페이지 번호
	private int startPageNo;	//시작 페이지 번호
	private int currentPageNo;	//현재 페이지 번호
	private int sizeOfPage;		//보여지는 페이지 갯수
	private int endPageNo;		//끝 페이지
	private int nextPageNo;		//다음 페이지 번호
	private int finalPageNo;	//마지막 페이지 번호
	private int numberOfRecords;//전체 레코드 수
	
	public Criteria() {
		
	}
	
	public Criteria(int currentPageNo, int maxPost) {
		this.currentPageNo = currentPageNo;
		this.sizeOfPage = 10;
		this.maxPost = maxPost != 0 ? maxPost : 5;
	}
	public int getMaxPost() {
		return maxPost;
	}
	public void setMaxPost(int maxPost) {
		this.maxPost = maxPost;
	}
	public int getFirstPageNo() {
		return firstPageNo;
	}
	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}
	public int getPrevPageNo() {
		return prevPageNo;
	}
	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}
	public int getStartPageNo() {
		return startPageNo;
	}
	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	public int getSizeOfPage() {
		return sizeOfPage;
	}
	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}
	public int getEndPageNo() {
		return endPageNo;
	}
	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}
	public int getNextPageNo() {
		return nextPageNo;
	}
	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}
	public int getFinalPageNo() {
		return finalPageNo;
	}
	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}
	public int getNumberOfRecords() {
		return numberOfRecords;
	}
	public void setNumberOfRecords(int numberOfRecords) {
		this.numberOfRecords = numberOfRecords;
	}

	public void makePaging() {
		if(numberOfRecords == 0)
			return;
		
		if(currentPageNo == 0)
			setCurrentPageNo(1);
		
		if(maxPost == 0)
			setMaxPost(5);
		
		int finalPage = (numberOfRecords + (maxPost -1)) / maxPost;
		
		if(currentPageNo > finalPage)
			setCurrentPageNo(finalPage);
		
		if(currentPageNo < 0)
			currentPageNo = 1;
		
		boolean isNowFirst = currentPageNo == 1 ? true : false;
		boolean isNowFinal = currentPageNo == finalPage ? true : false;
		
		int startPage = ((currentPageNo - 1) / sizeOfPage) * sizeOfPage + 1;
		int endPage = startPage + sizeOfPage - 1;
		
		if(endPage > finalPage)
			endPage = finalPage;
		
		setFirstPageNo(1);
		
		if(!isNowFirst)
			setPrevPageNo(((startPage - 1) < 1 ? 1 : (startPage - 1)));
		
		setStartPageNo(startPage);
		setEndPageNo(endPage);
		
		if(!isNowFinal)
			setNextPageNo(((endPage + 1 > finalPage ? finalPage : (endPage + 1))));
		
		setFinalPageNo(finalPage);
	}
}