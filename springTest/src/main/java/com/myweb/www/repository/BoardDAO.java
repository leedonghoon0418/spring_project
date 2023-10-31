package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;




public interface BoardDAO {

	int register(BoardVO bvo);

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo);

	void readCnt(int bno);

	int remove(int bno);

	List<BoardVO> getList(PagingVO pgvo);

	int getTotal(PagingVO pgvo);

	long selectOneBno();

	int insert(BoardVO bvo);


}
