package kr.co.goodstore.paging;



public class Paging {
	
	private int gtp;
	private int gpp;
	private int firstPage;
	private int lastPage;
	private int totalRecord;
	private Integer currentPage;
	private int pagePerRecord;
	
	
	


	
	/**
	 * @param currentPage
	 * @param groupPerPage
	 * @param pagePerRecord
	 * @param totalRecord
	 */
	public Paging(Integer currentPage,int groupPerPage,int pagePerRecord,int totalRecord) {
	
		this.gpp = groupPerPage;
		this.pagePerRecord=pagePerRecord;
		this.totalRecord = totalRecord;
		this.gtp=getTotalPage();
		this.currentPage = validatePageNum(currentPage);
		this.firstPage = this.getFirstPage();
		this.lastPage = this.getLastPage();
	}
	
	/**
	 * 첫번째 레코드 인덱스
	 * @return
	 */
	public int getFirstRecord() {
		Integer param = currentPage;
		param-=1;
		return param*pagePerRecord;

	}
	
	/**마지막 레코드 인덱스
	 * @return
	 */
	public int getLastRecord() {
		Integer param = currentPage;
		param-=1;
		if(param*pagePerRecord+pagePerRecord > this.totalRecord) {
			
			return totalRecord;
		}
		return param*pagePerRecord+pagePerRecord;
	}
	
	/**
	 * 파라미터 유효성 검증
	 * @param request
	 * @return
	 */
	private int validatePageNum(Integer currentPage) {
		
		if (currentPage == null) {
			return 1;
		} 
		if (currentPage > this.getTotalPage()) {
			
			return this.gtp;
		}
		this.currentPage = currentPage;
		return currentPage;	
	}



	
	


	/**
	 *각 페이지당 첫번째 페이지숫자 얻기
	 */
	public int getFirstPage() {
		
		int result = currentPage / this.gpp;				
		if(currentPage%this.gpp!=0) {
			this.firstPage=result*this.gpp+1;
			return result*this.gpp+1;
		}
		this.firstPage=(result-1)*this.gpp+1;
		return (result-1)*this.gpp+1;		
	}
	
	/**
	 *각 페이지 마지막 페이지 얻기
	 */
	public int getLastPage() {
		
		int result = currentPage / this.gpp;
		if(currentPage%this.gpp ==0) {
			result -= 1;
		}
		
		if(this.gtp / this.gpp >  result) {
			this.lastPage = this.gpp * (result+1);
			return this.gpp * (result+1);
		}
		
		
		this.lastPage = (this.gtp % this.gpp)+this.gpp*(result);
		return (this.gtp % this.gpp)+this.gpp*(result);
	}

	/**
	 *next버튼 눌렸을 때 페이지 얻기
	 */
	public int getNextPage() {		
		return this.lastPage+1;
	}
	
	/**
	 *prev버튼 눌렸을 때 페이지 얻기
	 */
	public int getPrevPage() {		
		return this.firstPage-1;
	}
	
	/**
	 *next 버튼 조건문
	 */
	public boolean isNextPage() {
		return this.gtp-this.lastPage>0;
	}

	/**
	 *prev 버튼 조건문
	 */
	public boolean isPrevPage() {
		return this.firstPage != 1;
	}

	
	
	/**
	 * 총 페이지 수
	 * @return
	 */

	public int getTotalPage() {
		if(validateTotalPage()) {
			this.gtp = totalRecord/pagePerRecord;
			return gtp;
		}
		
		this.gtp=(totalRecord/pagePerRecord)+1;
		return gtp;
	}
	

	private boolean validateTotalPage () {
		int temp = pagePerRecord;
		while (temp <= totalRecord) {
			if (temp == totalRecord) {
				return true;
			}
			temp += pagePerRecord;
		}
		return false;
	}
}
