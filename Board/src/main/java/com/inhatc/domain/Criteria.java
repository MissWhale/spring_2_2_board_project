package com.inhatc.domain;

public class Criteria {
	private int maxPost;		//�������� ǥ�� �� �Խù�
	private int firstPageNo;	//ù��° ������ ��ȣ
	private int prevPageNo;		//���� ������ ��ȣ
	private int startPageNo;	//���� ������ ��ȣ
	private int currentPageNo;	//���� ������ ��ȣ
	private int sizeOfPage;		//�������� ������ ����
	private int endPageNo;		//�� ������
	private int nextPageNo;		//���� ������ ��ȣ
	private int finalPageNo;	//������ ������ ��ȣ
	private int numberOfRecords;//��ü ���ڵ� ��
	
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