package com.hac.controller;

import java.net.URI;
import java.net.URISyntaxException;
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
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		String API_KEY = "AIzaSyAJ3ySaW26tlc1QrySK__0YcATBgUolbWI";									
		String API_BASIC = "https://youtube.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=5&regionCode=kr&key="+API_KEY;									
		log.info(API_BASIC);
		RestTemplate restTemplate = new RestTemplate();									
		URI uri_BASIC = null; //java.net.URI 임포트 하셈									
		try {									
			uri_BASIC = new URI(API_BASIC);								
		} catch (URISyntaxException e) {									
			e.printStackTrace();								
		}			
		String s = restTemplate.getForObject(uri_BASIC, String.class); 
		log.info("api 테스트"+s);
		
		return "home";
	}
	
}
