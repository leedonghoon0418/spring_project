package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;

public interface CommentDAO {

	int post(CommentVO cvo);

//	List<CommentVO> getList(long bno);

	int removeComment(int cno);

	int edit(CommentVO cvo);

	

	int getTotal(long bno);

	List<CommentVO> selectListPaging(@Param("bno")long bno, @Param("pgvo")PagingVO pgvo);

}
