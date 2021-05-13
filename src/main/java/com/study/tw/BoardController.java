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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.study.tw.lib.Login;
import com.study.tw.lib.ScriptUtils;
import com.study.tw.lib.Upload;
import com.study.tw.service.BoardService;
import com.study.tw.vo.BoardVO;
import com.study.tw.vo.CommentVO;
import com.study.tw.vo.Page;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	private BoardService service; 
	
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String writeDo(BoardVO vo,MultipartFile imgUpload,HttpServletRequest request) throws Exception {
		//업로드
		String imgUrl = "boardUpload/";
		Upload ul = new Upload();
			if(imgUpload.isEmpty() == false) {
			vo.setImg(imgUrl+ul.saveFile(imgUpload, request,imgUrl));
		}
		
		System.out.println(vo.getImg());
		service.create(vo);
		return "redirect:/board/listAll?num=1";
	}
	
	@RequestMapping(value= "/write")
	public String write(Model model,HttpServletRequest req, HttpServletResponse res, HttpSession session)throws Exception { 
		//로그인시에만 페이징처리
		session = req.getSession();
		if(session.getAttribute("member") == null) {
			ScriptUtils.alertLogout(res, "로그인후 이용바랍니다.");
		} 
		
		return "board/write.pages";
	}
	
	@RequestMapping(value= "/listAll")
	public String listAll(Model model,@RequestParam("num") int num,HttpServletResponse res, HttpServletRequest req, HttpSession session)throws Exception {
		
		session = req.getSession();
		
		if(session.getAttribute("member") == null) {
			ScriptUtils.alertLogout(res, "로그인후 이용바랍니다.");
		} 
		//로그인시에만 페이징처리
		if(num == 0) {
			num = 1;
		}
		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count());  
		//페이징 처리
		page.dataCalc();
		model.addAttribute("list",service.listAll(page.getDisplayPost(), page.getPostNum()));
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		return "/board/listAll.page";
	}

	@RequestMapping(value= "/listTest.do")
	public String listAllSearch(Model model,
			@RequestParam("num") int num,
			@RequestParam("condition") String condition,
			@RequestParam("content") String content,
			HttpServletResponse res, HttpServletRequest req, HttpSession session
			)throws Exception {
		session = req.getSession();
		if(session.getAttribute("member") == null) {
			ScriptUtils.alertHistory(res, "로그인후 이용바랍니다.");
		} 
		String title="";
		String writer ="";
		//로그인시에만 페이징처리
		session = req.getSession();
		if(num == 0) {
			num = 1;
		}
		
		Page page = new Page();
		page.setNum(num);
		page.setCount(service.count());  
		//페이징 처리
		page.dataCalc();
		
		if(condition.equals("title")) {
			title = content;
			model.addAttribute("list",service.listAllSearch(page.getDisplayPost(), page.getPostNum(),title, condition));
		} else if(condition.equals("user_id")){
			writer = content;
			model.addAttribute("list",service.listAllSearch(page.getDisplayPost(), page.getPostNum(), writer, condition));
		} else if(condition.equals("search_t")) {
			model.addAttribute("list",service.listAllSearch(page.getDisplayPost(), page.getPostNum(), content, condition));
		} 
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		return "/board/listTest.page";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET) 
	  public String read(@RequestParam("bno")int bno,@RequestParam("num") int num,
			  Model model,HttpServletResponse res, HttpServletRequest req, HttpSession session) throws Exception{
		
		session = req.getSession();
		if(session.getAttribute("member") == null) {
			ScriptUtils.alertLogout(res, "로그인후 이용바랍니다.");
		}
		
		model.addAttribute("num", num);
		//mv.addObject("board", board);
		model.addAttribute("board_vo",service.read(bno)); // read -	 
		model.addAttribute("commentList", service.commentList(bno));
		return "/board/read.page";
	  }
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET) 
	public String modify(@RequestParam("bno")int bno,BoardVO board, Model model,
			HttpServletRequest req, HttpSession session,HttpServletResponse res) throws Exception{
		session = req.getSession();
		if(session.getAttribute("member") == null) {
			ScriptUtils.alertLogout(res, "로그인후 이용바랍니다.");
		}
		model.addAttribute("board_vo",service.read(bno));	 
		
		return "/board/modify.page";
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST) 
	public String modifyDo(BoardVO vo,MultipartFile imgUpload,HttpServletRequest request) throws Exception{
		
		//업로드
		String imgUrl = "boardUpload/";
		Upload ul = new Upload();
			if(imgUpload.isEmpty() == false) {
			vo.setImg(imgUrl+ul.saveFile(imgUpload, request,imgUrl));
		}
		
		service.modify(vo);
		return "redirect:/board/read?bno="+vo.getBno()+"&num=1";
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(@RequestParam("bno")int bno) throws Exception {
		service.delete(bno);
		
		return "redirect:/board/listAll?num=1";
	}
/*	
	@RequestMapping(value = "/comment")
	public String comment(Model model) throws Exception {
		
		model.addAttribute("commentList", service.commentList(1));
		return "/board/comment.page";
	}
*/	
	
	@RequestMapping(value = "/comment.do", method = RequestMethod.POST)
	public String commentDo(CommentVO vo) throws Exception {
		service.commentCreate(vo);
		return "redirect:/board/read?bno="+vo.getReadBno()+"&num=1";
	}
	
	@RequestMapping(value = "/commentDelte.do")
	public void comment(@RequestParam("commentBno") int commentBno,@RequestParam("num") int num,
			@RequestParam("bno") int bno,
			HttpServletResponse res) throws Exception {
		service.commentDelete(commentBno);
		res.sendRedirect("./read?bno="+bno+"&num="+num);
	}
	
}
