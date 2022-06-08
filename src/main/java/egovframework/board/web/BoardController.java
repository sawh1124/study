package egovframework.board.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.board.bean.BoardBean;
import egovframework.board.service.BoardService;
import egovframework.pagination.bean.Search;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/board/write.do")
	public String write() {
		
		return "board/write";
	}
	
	@RequestMapping(value = "/board/writePro.do")
	public String writePro(@ModelAttribute("BoardBean")BoardBean boardBean) throws Exception {
		
		String fileName = null;
		MultipartFile uploadFile =boardBean.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("/Users/alby/"+fileName));
		}
		boardBean.setFileName(fileName);
			System.out.println(boardBean.getFileName());
		int isSuc = boardService.insertboard(boardBean);
		return "redirect:/board/list.do";
	}
	@RequestMapping(value = "/board/list.do")
	public String list(@ModelAttribute("BoardBean")BoardBean bean, Model model
			,@RequestParam(required = false,defaultValue="1") int page
			,@RequestParam(required = false,defaultValue="1") int range
			,@RequestParam(required = false,defaultValue="Title") String searchType
			,@RequestParam(required = false)String keyword
			,@ModelAttribute("search")Search search) throws Exception{
		
		//검
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		//전체 개시글 개수
		int listCnt = boardService.getBoardListcnt(search);
		
		search.pageInfo(page, range, listCnt);
		
		model.addAttribute("paginationBean", search);
		model.addAttribute("list", boardService.selectBoardList(search));

		
		return "board/list";
	}
	@RequestMapping(value = "/board/BoardDetail.do")
	public String boardDetail(@ModelAttribute("BoardBean")BoardBean boardBean, Model model,
				@RequestParam(required = false) int no) {

		BoardBean resultBean = boardService.selectBoardOne(no);
		
		model.addAttribute("resultBean", resultBean);
		
		return "board/BoardDetail";
	}
	@RequestMapping(value ="/board/BoardUpdate.do")
	public String BoardUptate(@ModelAttribute("BoardBean") BoardBean boardBean)throws Exception  {
		
		String resultReturn = "";
		
		String fileName = null;
        MultipartFile uploadFile = boardBean.getUploadFile();
        if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자구하기
            UUID uuid = UUID.randomUUID(); // uuid구하기
            fileName = uuid + "." + ext;
            uploadFile.transferTo(new File("/Users/alby/" + fileName));
            boardBean.setFileName(fileName);
            
            boardService.BoardUpdate(boardBean);
            
//            resultReturn = "redirect:/board/BoardDetail.do?no=" + boardBean.getNo();
            resultReturn = "redirect:/board/list.do";
        }else{
    		boardService.BoardUpdate(boardBean);
//    		resultReturn = "redirect:/board/BoardDetail.do?no=" + boardBean.getNo();
    		resultReturn = "redirect:/board/list.do";
        }
		
		return resultReturn;
	}
	@RequestMapping(value ="/board/BoardDelete.do")
	public String BoardDelete(@ModelAttribute("BoardBean") BoardBean boardBean) {
		
		boardService.BoardDelete(boardBean);
		
		return "redirect:/board/list.do";
	}
}