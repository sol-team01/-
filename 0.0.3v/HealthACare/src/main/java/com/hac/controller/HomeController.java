package com.hac.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hac.dto.searchDto.MyPageDto;
import com.hac.service.MyPageService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Setter(onMethod_ = @Autowired)
	private MyPageService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(MyPageDto dto,Locale locale, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String U_no = (String) session.getAttribute("U_no");
//		logger.info("Welcome home! The client locale is {}.", locale);
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
		
		//(최) 유튜브 api 전송량이 적어서 오류가 자주 뜨기 때문에 주석처리 해놓음
		// 정상작동은 합니다.
//		String API_KEY = "AIzaSyBDCffnIxE1dnQFMQwIWdZjVoU3VvPTDrQ";									
//		String API_Q = "운동";	
//		String API_URL=null;
//		try {
//		String encodedSearchId = URLEncoder.encode(API_Q, "UTF-8");
//		API_URL ="https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=6&q="+encodedSearchId+"&type=video&key="+API_KEY;
//		log.info(API_URL);
//		} catch (UnsupportedEncodingException e1) {
//			e1.printStackTrace();
//		}
//	RestTemplate restTemplate = new RestTemplate();									
//	
//	//// **** 중요 **** uri									
//	URI uri = null; //java.net.URI 임포트 하셈									
//	try {									
//		uri = new URI(API_URL);								
//	} catch (URISyntaxException e) {									
//		e.printStackTrace();								
//	}			
//	String s = restTemplate.getForObject(uri, String.class); 	
//	YoutubeApiDto youtube = restTemplate.getForObject(uri, YoutubeApiDto.class); // 자기 클래스로 바꾸시오..
//	model.addAttribute("YoutubeDtoBasic0", youtube.items.get(0).id.videoId);
//	model.addAttribute("YoutubeDtoBasic1", youtube.items.get(1).id.videoId);
//	model.addAttribute("YoutubeDtoBasic2", youtube.items.get(2).id.videoId);
//	model.addAttribute("YoutubeDtoBasic3", youtube.items.get(3).id.videoId);
//	model.addAttribute("YoutubeDtoBasic4", youtube.items.get(4).id.videoId);
//	model.addAttribute("YoutubeDtoBasic5", youtube.items.get(5).id.videoId);
//	log.info(youtube.items.get(5).id.videoId);
//	log.info(youtube.items.get(4).id.videoId);
//	log.info(youtube.items.get(3).id.videoId);
	//	log.info(s);	
		if(U_no != null && !U_no.equals(null)) {
			dto.setU_no(U_no);
			model.addAttribute("myInfo",service.myProfile(dto));
		}
		return "home";
	}
	
}
