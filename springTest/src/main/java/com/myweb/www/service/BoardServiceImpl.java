package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.FileDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO bdao;

	@Inject
	private FileDAO fdao;
	
//	@Override
//	public int register(BoardVO bvo) {
//		// TODO Auto-generated method stub
//		return bdao.register(bvo);
//	}

	@Override
	public BoardVO getDetail(int bno) {
		// TODO Auto-generated method stub
		bdao.readCnt(bno);
		return bdao.getDetail(bno);
	}

	@Override
	public int modify(BoardVO bvo) {
		// TODO Auto-generated method stub
		return bdao.modify(bvo);
	}

	@Override
	public int remove(int bno) {
		// TODO Auto-generated method stub
		return bdao.remove(bno);
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getList(pgvo);
	}


	@Override
	public int getTotal(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getTotal(pgvo);
	}

	@Override
	public int insert(BoardDTO bdto) {
		// bvo, flist 가져와서 각자 DB에 저장
		// 기존메서드 활용
		int isUp = bdao.insert(bdto.getBvo()); // insert를 해야 bno 발급이됨
		// null 처리
		if(bdto.getFlist() == null) {
			isUp *= 1;
			return isUp;
		}
		
		// bvo insert 후 => 파일도 있다면 .. 
		if(isUp > 0 && bdto.getFlist().size()>0) {
			long bno = bdao.selectOneBno(); // 가장 마지막에 등록된 bno 가져오기
			
			//모든 파일에 bno 세팅
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isUp *= fdao.insertFile(fvo);
			}
			
		}
		
		return isUp;
	}

	@Override
	public BoardDTO getImgDetail(int bno) {
		BoardVO bvo = bdao.getDetail(bno);
		List<FileVO> flist = fdao.getFileList(bno);
		
		
		return new BoardDTO(bvo,flist);
	}

	@Override
	public int removeFile(String uuid) {
		// TODO Auto-generated method stub
		return fdao.removeFile(uuid);
	}


}
