package com.study.tw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.tw.service.BoardService;
import com.study.tw.vo.BoardVO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService service; 
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String writeDo(BoardVO vo) throws Exception {
		service.create(vo);
	
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value= "/write")
	public String write(Model model)throws Exception { 
		model.addAttribute("list",service.listAll()); 
		return "board/write";
	}
	
	@RequestMapping(value= "/listAll")
	public String listAll(Model model)throws Exception { 
		model.addAttribute("list",service.listAll()); 
		return "board/listAll";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET) 
	  public void read(@RequestParam("bno")int bno,BoardVO board, Model model) throws Exception{
		model.addAttribute("board_vo",service.read(bno)); // read -	 
	  }
}
