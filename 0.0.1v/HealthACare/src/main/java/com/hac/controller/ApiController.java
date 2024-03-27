package com.hac.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
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
//@AllArgsConstructor // 필드 값을 매개변수로 하는 생성자를 스프링이 알아서 만들어 줌. 그리고 그런 형태의 생성자를 추가하면 스프링이 알아서 객체관리
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
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("18","UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1","UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("year", "UTF-8") + "=" + URLEncoder.encode("2022","UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("sickCd", "UTF-8") + "=" + URLEncoder.encode("B15","UTF-8"));
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
		
		// 가져온 XML 데이터를 Document 객체로 파싱
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document document = builder.parse(new ByteArrayInputStream(sb.toString().getBytes()));
		// root 요소 가져오기
		Element root = document.getDocumentElement();

		// item 요소 추출
		NodeList itemList = root.getElementsByTagName("item");

		// 각 item 요소별로 출력
		for (int i = 0; i < itemList.getLength(); i++) {
		    Node itemNode = itemList.item(i);
		    if (itemNode.getNodeType() == Node.ELEMENT_NODE) {
		        Element itemElement = (Element) itemNode;
		        
		        // item 요소 내부에서 필요한 정보 추출
		        String age = itemElement.getElementsByTagName("age").item(0).getTextContent();
		        String ptntCnt = itemElement.getElementsByTagName("ptntCnt").item(0).getTextContent();
		        String rvdInsupBrdnAmt = itemElement.getElementsByTagName("rvdInsupBrdnAmt").item(0).getTextContent();
		        String rvdRpeTamtAmt = itemElement.getElementsByTagName("rvdRpeTamtAmt").item(0).getTextContent();
		        String sex = itemElement.getElementsByTagName("sex").item(0).getTextContent();
		        String sickCd = itemElement.getElementsByTagName("sickCd").item(0).getTextContent();
		        String sickNm = itemElement.getElementsByTagName("sickNm").item(0).getTextContent();
		        String specCnt = itemElement.getElementsByTagName("specCnt").item(0).getTextContent();
		        String vstDdcnt = itemElement.getElementsByTagName("vstDdcnt").item(0).getTextContent();
		        
		        // 추출한 정보 출력
		        System.out.println("나이: " + age);
		        System.out.println("환자 수: " + ptntCnt);
		        System.out.println("받은 보조 부담금 액: " + rvdInsupBrdnAmt);
		        System.out.println("귀환 치료액: " + rvdRpeTamtAmt);
		        System.out.println("성별: " + sex);
		        System.out.println("질병 코드: " + sickCd);
		        System.out.println("질병 이름: " + sickNm);
		        System.out.println("특수 카운트: " + specCnt);
		        System.out.println("일일 방문 의사 수: " + vstDdcnt);
		        System.out.println("==========================3"); 
		    }
		}
		
		
	}

}
