package com.study.tw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.tw.service.MemberService;
import com.study.tw.vo.MemberVO;

@Controller()
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/admin")
	public String Admin(Model model) throws Exception{
		model.addAttribute("admin",service.adminList());
		return "/admin/admin.page";
	}
	
	@RequestMapping(value = "/admin.do", method = RequestMethod.POST)
	public String AdminDo(MemberVO vo) throws Exception {
		service.adminModify(vo);
		return "redirect:/admin/admin";
	}
}
