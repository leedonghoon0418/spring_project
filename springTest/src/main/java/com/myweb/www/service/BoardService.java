package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardService {

	//int register(BoardVO bvo);

	BoardVO getDetail(int bno);

	int modify(BoardVO bvo);

	int remove(int bno);

	List<BoardVO> getList(PagingVO pgvo);

	int getTotal(PagingVO pgvo);

	int insert(BoardDTO boardDTO);

	BoardDTO getImgDetail(int bno);

	int removeFile(String uuid);



}
