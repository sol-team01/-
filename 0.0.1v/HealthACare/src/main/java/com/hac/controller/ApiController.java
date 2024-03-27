package com.hac.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.hac.dto.foodDto.FoodDto;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/NullMember/*") // 프로젝트 루트 경로 이하 /guest 상위폴더로 진입 시 여기로 진입하게 됨.
@AllArgsConstructor // 필드 값을 매개변수로 하는 생성자를 스프링이 알아서 만들어 줌. 그리고 그런 형태의 생성자를 추가하면 스프링이 알아서 객체관리
					// 해줌(@Auto.. 처럼)
@Controller
public class ApiController {
	
	// 칼로리 쪽 api인데 dto 이쪽에 안 갖고 와서 전체 주석 쳐둠 - 박남희
	// WOW - 최지은
	@RequestMapping("/BbsFood")
	public void a(@RequestParam(value = "desc_kor", defaultValue = "%EB%B0%B0") String descKor, Model model) {
		//// 우리나라 공공 api ////					
		//인코딩 인증키					
		String API_KEY = "hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D";					
		String API_URL = null;
		
		try {
			String encodedSearchId = URLEncoder.encode(descKor, "UTF-8");
			API_URL = "https://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1?serviceKey="+ API_KEY +"&desc_kor="+ encodedSearchId +"&pageNo=1&numOfRows=10&type=json" ;			
			log.info("========" + API_URL);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
				// * 주의 * https 아님 http 임. https 는 인증관련 복잡한 처리를 해야함.	
		
//	        descKor="%EB%B0%B0";
		
		RestTemplate restTemplate = new RestTemplate();					
		//// **** 중요 **** uri					
		URI uri = null; //java.net.URI 임포트 하셈					
		try {					
			uri = new URI(API_URL);				
		} catch (URISyntaxException e) {					
			e.printStackTrace();				
		}
							
//		String s = restTemplate.getForObject(uri, String.class); 			
//		log.info("====== 잘 나오나? "+s);	
		
		FoodDto kw = restTemplate.getForObject(uri, FoodDto.class); // 자기 클래스로 바꾸시오..							
		log.info("==== json ==== : ============================ : ");							
		String name = kw.body.items.get(0).DESC_KOR;							
		String kcal = kw.body.items.get(0).NUTR_CONT1;							
		String g = kw.body.items.get(0).NUTR_CONT2;							
		String ddara = String.format("==== json ==== : 음식, %s이고 칼로리는 %s kcal, 탄백질은 %s g이다.", name, kcal, g);							
		log.info(ddara);	
		
		 model.addAttribute("kw", kw);
		 
	}
	
	@RequestMapping("/c")
	public void c(Model model) throws IOException, ParserConfigurationException, SAXException {
		
		// 여기서 부터 아래 === 까지가 한 묶음인데 일단 잠만 둬봐 
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551182/diseaseInfoService/getDissByGenderAgeStats");
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10","UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1","UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("year", "UTF-8") + "=" + URLEncoder.encode("2022","UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("sickCd", "UTF-8") + "=" + URLEncoder.encode("A00","UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("sickType", "UTF-8") + "=" + URLEncoder.encode("1","UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("medTp", "UTF-8") + "=" + URLEncoder.encode("1","UTF-8"));
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Content-type", "application/xml");
		System.out.println("Response conde : " + con.getResponseCode());
		BufferedReader rd;
		if(con.getResponseCode() >= 200 && con.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		
		while((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		con.disconnect();
		System.out.println(sb.toString());
		
		System.out.println("=================================================="); 
		// 위랑 아래가 같은 건데 일단 같이 넣어둠 =============================================================================================================================

		// XML 파서를 생성하기 위한 팩토리를 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		// Document 객체를 만들기 위한 빌더를 생성
		DocumentBuilder builder = factory.newDocumentBuilder();

		// xml 파일을 document로 파싱하기
		Document document = builder.parse("https://apis.data.go.kr/B551182/diseaseInfoService/getDissByGenderAgeStats?serviceKey=hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D&numOfRows=10&pageNo=2&year=2022&sickCd=A00&sickType=1&medTp=1");
		
		// root 요소 가져오기
		Element root = document.getDocumentElement();
		// root 요소 확인 : 첫 태그 sample
		System.out.println(root.getNodeName()); 
		System.out.println("===========================2"); 
		// root 요소의 첫 번째 자식 노드의 다음 형제 노드를 가져와서 customer 노드로 지정
		Node firstNode = root.getFirstChild();
		// 다음 노드는 customer
		Node customer = firstNode.getNextSibling();
		// customer 요소 안의 노드 리스트
		NodeList childList = customer.getChildNodes();
		
		model.addAttribute("list", childList);
		// childList를 반복하며 자식 노드를 처리
		for(int i = 0; i < childList.getLength(); i++) {
			Node item = childList.item(i);
			if(item.getNodeType() == Node.ELEMENT_NODE) { // 노드의 타입이 Element일 경우(공백이 아닌 경우)
				System.out.println(item.getNodeName());
				System.out.println(item.getTextContent());
				System.out.println("==========================3"); 
			} else {
				System.out.println("공백 입니다.");
			}
		}
		
		
	}

}
