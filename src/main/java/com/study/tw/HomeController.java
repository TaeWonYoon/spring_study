package com.study.tw;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.tw.service.BoardService;
import com.study.tw.vo.BoardVO;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	@Autowired
	private BoardService service; 
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("list",service.listAll(0, 5));
		
		//뉴스 api
		String URL = "https://weather.naver.com/rgn/cityWetrMain.nhn";
		Document doc = Jsoup.connect(URL).get();
		Elements weather = doc.select(".today_weather .current");
		Elements chart_list = doc.select(".today_chart_list");
		Elements summary = doc.select(".summary");
		
		model.addAttribute("weather", weather);
        model.addAttribute("summary", summary);
        model.addAttribute("chart_list", chart_list);
		return "home.page";
	}
	
}
