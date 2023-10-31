package com.myweb.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.print.attribute.standard.MediaTray;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.FileHandler;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private BoardService bsv;
	
	@Inject
	private FileHandler fh;
	
	@GetMapping("/register")
	public void getRegister() {
		
	}
	@PostMapping("/register")
	public String register(BoardVO bvo , @RequestParam(name="files", required = false)MultipartFile[] files) { // name = register.jsp에서 files 네임
		
		log.info("bvo/files"+bvo+"/"+files);
		List<FileVO> flist = new ArrayList<FileVO>();
		// 파일 업로드 할수 있는 핸들러 생성
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files);
		}
		
		int isOk = bsv.insert(new BoardDTO(bvo,flist));		
		//int isOk = bsv.register(bvo);
		//log.info((isOk>0)?"O":"X");
		return "index";
	}
	
	@GetMapping("/list")
	public String list(Model m,PagingVO pgvo) {
		m.addAttribute("list",bsv.getList(pgvo));
		int totalCount = bsv.getTotal(pgvo);
		log.info("pgvo"+pgvo);
		PagingHandler ph = new PagingHandler(pgvo,totalCount);
		m.addAttribute("ph",ph);
		return "/board/list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("bno")int bno ,Model m) {
		BoardDTO bdto = bsv.getImgDetail(bno);
		m.addAttribute("bvo", bdto.getBvo());
		m.addAttribute("flist", bdto.getFlist());
		return "/board/detail";
	}
	
	@GetMapping("/modify")
	public void getModify(@RequestParam("bno")int bno, Model m) {
		BoardVO bvo = bsv.getDetail(bno);
		BoardDTO bdto = bsv.getImgDetail(bno);
		m.addAttribute("bvo", bdto.getBvo());
		m.addAttribute("flist", bdto.getFlist());
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo) {
		int isOk = bsv.modify(bvo);
		log.info((isOk>0)?"성공":"실패");
		return "redirect:/board/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno")int bno) {
		int isOk = bsv.remove(bno);
		log.info((isOk>0)?"성공":"실패");
		return "redirect:/board/list";
	}
	
	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid") String uuid){
		int isOk = bsv.removeFile(uuid);
		
		return isOk > 0 ? new ResponseEntity<String>("1",HttpStatus.OK):
			new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
