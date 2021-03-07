package Action.Util;

import DAO.Dao;

public class Paging {
    private final static int pageCount = 10;
    private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPageNum = 0;
    private int lastNum = 0;

    public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	public int getBlockStartNum() {
        return blockStartNum;
    }
    public void setBlockStartNum(int blockStartNum) {
        this.blockStartNum = blockStartNum;
    }
    public int getBlockLastNum() {
        return blockLastNum;
    }
    public void setBlockLastNum(int blockLastNum) {
        this.blockLastNum = blockLastNum;
    }
    public int getLastPageNum() {
        return lastPageNum;
    }
    public void setLastPageNum(int lastPageNum) {
        this.lastPageNum = lastPageNum;
    }

    // block을 생성
    // 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
    public void makeBlock(int curPage){
    	if(curPage < 1) {
    		curPage = 1;
    	}
    	if (curPage < 5) {
    		blockStartNum = 1;
		}else {
			blockStartNum = curPage-4;
		}
        

//        blockNum = (int)(Math.floor((curPage-1))/ pageCount);
//        blockStartNum = (pageCount * blockNum) + 1;
//        blockLastNum = blockStartNum + (pageCount-1);
		}
    

    // 총 페이지의 마지막 번호
    public void makeLastPageNum(int curPage) {
        Dao dao = new Dao();
        int total = dao.getBNum()-1;

        if( total % pageCount == 0 ) {
            lastPageNum = (int)Math.floor(total/pageCount);
            lastNum = (int)Math.floor(total/pageCount);
        }
        else {
            lastPageNum = (int)Math.floor(total/pageCount) + 1;
            lastNum = (int)Math.floor(total/pageCount) + 1;
        }
        
        if (curPage <= 4) {
	   		lastPageNum = 5;
	   		
        }else if (curPage <= lastPageNum-4) {
        	lastPageNum = curPage +4;
			
		}
        }
        	
/*
    // 검색을 했을 때 총 페이지의 마지막 번호
    public void makeLastPageNum(String kwd) {
    	Dao dao = new Dao();
        int total = dao.getBNum()-1;

        if( total % pageCount == 0 ) {
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else {
            lastPageNum = (int)Math.floor(total/pageCount) + 1;
        }
    }
    
*/
    
    
}
    
