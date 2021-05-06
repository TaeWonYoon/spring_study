package com.study.tw;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonParser;

@Controller
public class NewsController {

	@RequestMapping(value = "/crawling/news", method = RequestMethod.GET)
	public String startCrawl(Model model) throws IOException {
		String URL = "https://news.naver.com/";
		Document doc = Jsoup.connect(URL).get();
		Elements comHeader = doc.select(".com_header");
		Elements newsInfo = doc.select(".news_info_txt");
		
		//Elements time_list = doc.select("dl .time_list");
		String[] str = comHeader.text().split("정치");
		System.out.println(str[0]);
		System.out.println("------------");
		System.out.println(comHeader);
			
		model.addAttribute("comHeaderstr", str[0]);
        model.addAttribute("comHeader", comHeader);
        model.addAttribute("newsInfo", newsInfo);
        

		return "crawling/news";
	}
	
}