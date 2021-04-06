package com.study.tw;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.tw.lib.Login;
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
	public String write(Model model,HttpServletRequest req, HttpServletResponse res, HttpSession session)throws Exception { 
		//로그인시에만 페이징처리
		session = req.getSession();
		if(session.getAttribute("member") == null) {
			Login login = new Login();
			login.LoginAuth(res);
		} 
		
		model.addAttribute("list",service.listAll()); 
		return "board/write.pages";
	}
	
	@RequestMapping(value= "/listAll")
	public String listAll(Model model,HttpServletRequest req, HttpServletResponse res, HttpSession session)throws Exception {
		//로그인시에만 페이징처리
		session = req.getSession();
		if(session.getAttribute("member") == null) {
			Login login = new Login();
			login.LoginAuth(res);
		} 
		
		System.out.println("세션아이디:"+session.getAttribute("member"));
			
		model.addAttribute("list",service.listAll()); 
		return "/board/listAll.page";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET) 
	  public String read(@RequestParam("bno")int bno,BoardVO board, Model model) throws Exception{
		
		//mv.addObject("board", board);
		model.addAttribute("board_vo",service.read(bno)); // read -	 
		
		return "/board/read.page";
	  }
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET) 
	public String modify(@RequestParam("bno")int bno,BoardVO board, Model model) throws Exception{
		
		model.addAttribute("board_vo",service.read(bno));	 
		
		return "/board/modify.page";
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST) 
	public String modifyDo(BoardVO vo) throws Exception{
		service.modify(vo);
		return "redirect:/board/read?bno="+vo.getBno();
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(@RequestParam("bno")int bno) throws Exception {
		System.out.println("delete매핑됨" + bno);
		service.delete(bno);
		
		return "redirect:/board/listAll";
	}
}
