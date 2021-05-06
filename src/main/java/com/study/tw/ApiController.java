package com.study.tw;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApiController {

	@RequestMapping(value = "/map/map")
	public String map() throws Exception{
		
		return "/map/map.page";
	}
}
