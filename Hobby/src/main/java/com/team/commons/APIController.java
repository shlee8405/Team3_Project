package com.team.commons;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@Controller
public class APIController {

	@GetMapping("/campAllList.do")
	public ModelAndView getCampAllList() {
		ModelAndView mv = new ModelAndView("redirect:/camp.do");

		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();

		try {
			DocumentBuilder builder = builderFactory.newDocumentBuilder();
			// 사용할 xml 링크 투입
			Document doc = builder.parse("https://apis.data.go.kr/B551011/GoCamping/basedList?numOfRows=10&pageNo=1&MobileOS=WEB&MobileApp=AppTest&serviceKey=0jWBRiz0RJmRmzfMZ23uO9m7juS3aBNXJskrlUMMHsm15eOVy9oSxTPqJGoOVceVRR1oUCq%2BHjjzFSStiMpsdw%3D%3D&_type=xml.xml");
			// 필요한 데이터들의 부모 태그
			NodeList campList = (NodeList) doc.getElementsByTagName("item");
			System.out.println("namelist length is " + campList.getLength());
			System.out.println(campList.item(1));
			for (int i = 0; i < campList.getLength(); i++) {
				Node p = campList.item(i);
				if (p.getNodeType() == Node.ELEMENT_NODE) {
					Element camp = (Element) p;
					
					
					// 필요한 데이터들의 태그
					NodeList facltNm = (NodeList) camp.getElementsByTagName("facltNm");
					NodeList intro = (NodeList) camp.getElementsByTagName("intro");
					NodeList direction =  (NodeList) camp.getElementsByTagName("direction");
					
					System.out.println("facltNm is "+ facltNm.item(0).getTextContent());
					System.out.println("intro is "+ intro.item(0).getTextContent());
					System.out.println("direction is "+ direction.item(0).getTextContent());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
}


