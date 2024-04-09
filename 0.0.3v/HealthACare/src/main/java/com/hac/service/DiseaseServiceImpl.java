package com.hac.service;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.hac.dto.diseaseDto.DiseaseDto;

@Service
public class DiseaseServiceImpl implements DiseaseService {

	@Override
	 public List<DiseaseDto> getDiseaseList(String sickCd) throws IOException {
        StringBuilder urlBuilder = new StringBuilder(
                "https://apis.data.go.kr/B551182/diseaseInfoService/getDissByGenderAgeStats");
        appendParam(urlBuilder, "ServiceKey",
                "hHHC2afAzbBFG%2BiTNM1BgP8tim6KZmaRvsAPA6AOJd60TROjKviEGzaqQ%2BS%2BKLCR5OHtl74y2SWr%2Bev1LBBvHQ%3D%3D");
        appendParam(urlBuilder, "numOfRows", "18");
        appendParam(urlBuilder, "pageNo", "1");
        appendParam(urlBuilder, "year", "2022");
        appendParam(urlBuilder, "sickCd", sickCd);
        appendParam(urlBuilder, "sickType", "1");
        appendParam(urlBuilder, "medTp", "1");

        HttpURLConnection con = null;
        try {
            URL url = new URL(urlBuilder.toString());
            con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Content-type", "application/xml");

            try (BufferedReader rd = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = rd.readLine()) != null) {
                    sb.append(line);
                }

                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = factory.newDocumentBuilder();
                Document document = builder.parse(new ByteArrayInputStream(sb.toString().getBytes()));
                Element root = document.getDocumentElement();
                NodeList itemList = root.getElementsByTagName("item");

                return parseItemList(itemList);
            }
        } catch (IOException | ParserConfigurationException | SAXException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.disconnect();
            }
        }
        return null;
    }

	// NodeList를 처리하여 자바 객체 리스트로 변환하는 메서드 정의
    private List<DiseaseDto> parseItemList(NodeList nodeList) {
        List<DiseaseDto> diseaseList = new ArrayList<>();
        for (int i = 0; i < nodeList.getLength(); i++) {
            Element itemElement = (Element) nodeList.item(i);

            String age = extractTextContent(itemElement, "age");
            String ptntCnt = extractTextContent(itemElement, "ptntCnt");
            String rvdInsupBrdnAmt = extractTextContent(itemElement, "rvdInsupBrdnAmt");
            String rvdRpeTamtAmt = extractTextContent(itemElement, "rvdRpeTamtAmt");
            String sex = extractTextContent(itemElement, "sex");
            String sickCd = extractTextContent(itemElement, "sickCd");
            String sickNm = extractTextContent(itemElement, "sickNm");
            String specCnt = extractTextContent(itemElement, "specCnt");
            String vstDdcnt = extractTextContent(itemElement, "vstDdcnt");

            DiseaseDto item = new DiseaseDto();
            item.setAge(age);
            item.setPtntCnt(ptntCnt);
            item.setRvdInsupBrdnAmt(rvdInsupBrdnAmt);
            item.setRvdRpeTamtAmt(rvdRpeTamtAmt);
            item.setSex(sex);
            item.setSickCd(sickCd);
            item.setSickNm(sickNm);
            item.setSpecCnt(specCnt);
            item.setVstDdcnt(vstDdcnt);

            diseaseList.add(item);
        }
        return diseaseList;
    }

	
	private void appendParam(StringBuilder urlBuilder, String paramName, String paramValue) throws UnsupportedEncodingException {
	    if (urlBuilder.indexOf("?") == -1) {
	        urlBuilder.append("?");
	    } else {
	        urlBuilder.append("&");
	    }
	    urlBuilder.append(URLEncoder.encode(paramName, "UTF-8"));
	    urlBuilder.append("=");
	    urlBuilder.append(URLEncoder.encode(paramValue, "UTF-8"));
	}
	
	private String extractTextContent(Element element, String tagName) {
	    return element.getElementsByTagName(tagName).item(0).getTextContent();
	}
}
