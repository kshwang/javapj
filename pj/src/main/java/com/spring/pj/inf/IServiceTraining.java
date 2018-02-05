package com.spring.pj.inf;

import com.spring.pj.model.ModelTraining;


public interface IServiceTraining extends IDaoTraining {
    
    ModelTraining transArticle(int articleno);
    int transDeleteArticle(int articleno);

    /*
	public int getListNo();
	
	public int getPrevLink();
	
	public int getFirstPage();
	
	public int getLastPage();
	
	public int getNextLink();

	public int[] getPageLinks();

	public PagingHelper getPagingHelper();

	public void setPagingHelper(PagingHelper pagingHelper);
	*/
}
