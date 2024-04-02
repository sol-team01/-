package com.hac.controller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
		
		String API_KEY = "AIzaSyBDCffnIxE1dnQFMQwIWdZjVoU3VvPTDrQ";									
		String API_Q = "운동";	
		String API_URL=null;
		try {
		String encodedSearchId = URLEncoder.encode(API_Q, "UTF-8");
		API_URL ="https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=6&q="+encodedSearchId+"&type=video&key="+API_KEY;
		log.info(API_URL);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
	RestTemplate restTemplate = new RestTemplate();									
	
	//// **** 중요 **** uri									
	URI uri = null; //java.net.URI 임포트 하셈									
	try {									
		uri = new URI(API_URL);								
	} catch (URISyntaxException e) {									
		e.printStackTrace();								
	}			
	String s = restTemplate.getForObject(uri, String.class); 	
	log.info(s);	
		return "home";
	}
	
}
