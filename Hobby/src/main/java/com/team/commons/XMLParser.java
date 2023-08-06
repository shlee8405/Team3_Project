package com.team.commons;

import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.http.HttpResponse;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.http.HttpEntity;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/*
 * USAGE
 * ------
 * static final String URL = "your url";
 * // XML node keys
 * static final String KEY_ITEM = "item"; // parent node
 * static final String KEY_NAME = "name";
 * XMLParser parser = new XMLParser();
 * String xml = parser.getXmlFromUrl(URL); // getting XML
 * Document doc = parser.getDomElement(xml); // getting DOM element
 * NodeList nl = doc.getElementsByTagName(KEY_ITEM);
 * 
 *  // looping through all item nodes <item>
 *  
 * for (int i = 0; i < nl.getLength(); i++) {
 *     String name = parser.getValue(e, KEY_NAME); // name child value
 *     
 * }
 * */

public class XMLParser {
	
	public Document getDomElement(String url) {
		Document doc = null;
		
		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			doc = db.parse(new URL(url).openStream());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("failed creating Document in XMLParser: getDomElement(url)");
		}
		return doc;
	}
	
	//Get each xml child element value by passing element node name
	public String getValue(Element item, String str) {
	    NodeList nodeList = item.getElementsByTagName(str);
	    return this.getElementValue(nodeList.item(0));
	}
	
	public final String getElementValue( Node element ) {
	         Node child;
	         if( element != null){
	             if (element.hasChildNodes()){
	                 for( child = element.getFirstChild(); child != null; child = child.getNextSibling() ){
	                     if( child.getNodeType() == Node.TEXT_NODE  ){
	                         return child.getNodeValue();
	                     }
	                 }
	             }
	         }
	         return "";
	  } 

}