package com.study.tw;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.tw.lib.Login;
import com.study.tw.service.MemberService;
import com.study.tw.vo.MemberVO;

@Controller
@RequestMapping(value = "/auth")
public class MemberController {

	@Inject
	MemberService service;
	
	@RequestMapping(value = "/register")
	public String getRegister(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String url;
		if(member != null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 중입니다. 로그아웃 후 입력해주세요');</script>");
			out.flush();
			url = "redirect:/";
		} else {
			url = "/auth/register.pages";
		}
		return url;
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		service.register(vo);
		System.out.println(vo.getTel());
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login")
	public String login(MemberVO vo) throws Exception {
		return "/auth/login.page";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr,HttpServletResponse res) throws Exception{
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		String redirect = ""; 
		if(login == null) {
			System.out.println("로그인실패");
			session.setAttribute("member", null);
			//rttr.addFlashAttribute("msg", false);
			Login loginDo = new Login();
			loginDo.LoginDo(res);
		}else {
			session.setAttribute("member", login);
			redirect = "redirect:/";
		}
		return redirect;
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
}
