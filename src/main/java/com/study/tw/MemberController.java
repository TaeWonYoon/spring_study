package com.study.tw;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.tw.lib.ScriptUtils;
import com.study.tw.lib.Upload;
import com.study.tw.service.MemberService;
import com.study.tw.vo.MemberVO;

@Controller
@RequestMapping(value = "/auth")
public class MemberController {

	@Autowired
	MemberService service;
	
	//패스워드 암호화
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value = "/register")
	public String getRegister(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		return "/auth/register.pages";
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String postRegister(MultipartFile imgUpload,HttpServletRequest request, MemberVO vo) throws Exception {
		
		//업로드
		Upload ul = new Upload();
		if(imgUpload.isEmpty() == false) {
		vo.setImg("userImg/"+ul.saveFile(imgUpload, request,"userImg/"));
		}
		
		String inputPass = vo.getUserpass();
		String userpass = pwdEncoder.encode(inputPass);
		vo.setUserpass(userpass);
		service.register(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login")
	public String login(MemberVO vo) throws Exception {
		return "/auth/login.page";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public void loginDo(MemberVO vo, HttpServletRequest req,HttpServletResponse res) throws Exception{
		HttpSession session = req.getSession();
		//디비 암호화 비밀번호 값과 vo비밀번호 값이 같은지 비교
		MemberVO login = service.login(vo);
		System.out.println(login);
		boolean pwdMacth = false;
		
		if(login != null) {
			pwdMacth = pwdEncoder.matches(vo.getUserpass(), login.getUserpass());
			if(pwdMacth) {
				System.out.println(pwdMacth);
				session.setAttribute("member", login);
				ScriptUtils.location(res, "");
			} else {
				ScriptUtils.alertHistory(res, "비밀번호가 틀립니다.");
				session.setAttribute("member", null);
			}
		} else {
			ScriptUtils.alertHistory(res, "아이디가 틀립니다.");
			session.setAttribute("member", null);
		}
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
	
	@RequestMapping(value = "/modify")
	public String modify(@RequestParam("userid") String userId, Model model) throws Exception {
		model.addAttribute("infor",service.modify(userId));
		return "/auth/modify.pages";
	}
	
	@RequestMapping(value = "/modify.do")
	public String ModifyDo(MemberVO vo, HttpSession session,MultipartFile imgUpload,HttpServletRequest request) throws Exception {

		//업로드 널이 아닐때
		if(imgUpload != null) {
			Upload ul = new Upload();
			if(imgUpload.isEmpty() == false) {
			vo.setImg("userImg/"+ul.saveFile(imgUpload, request,"userImg/"));
			}
		}
			
		if(vo.getUserpass() != null) {		
		String inputPass = vo.getUserpass();
		String userpass = pwdEncoder.encode(inputPass);
		vo.setUserpass(userpass);
		}
		
		service.modifyDo(vo);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/delete")
	public String delete() {
		return "/auth/delete.pages";
	}
	
	@RequestMapping(value = "/imgUpload")
	public String imgUpload() {
		
		return "/auth/imgUpload.page";
	}
	
	/*
	@RequestMapping(value = "/delete.do")
	public String deleteDo(MemberVO vo, HttpSession session,HttpServletResponse res) throws Exception {
		MemberVO login = service.login(vo);
		String url;
		boolean pwdMacth = pwdEncoder.matches(vo.getUserpass(), login.getUserpass());
		if(pwdMacth) {
			service.delete(vo);
			session.invalidate();
			url = "redirect:/";
		} else {
			System.out.println("삭제안됨");
			url = "redirect:/auth/delete";
		}
			
		return url;
	}
	*/
	
	
}
