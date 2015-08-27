package com.junrui.logservice.download.sub;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.htmlparser.Parser;
import org.htmlparser.filters.AndFilter;
import org.htmlparser.filters.HasAttributeFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import com.junrui.logservice.download.MarketDownLoad;

public class YYBMarket extends MarketDownLoad {

	@Override
	public String getPatientUrl() {
		return null;
	}

	@Override
	public String getDoctorUrl() {
		return null;
	}

	@Override
	public String getDownloadText(String url) {
		try {
			AndFilter af=new AndFilter(new TagNameFilter("div"), new HasAttributeFilter("class", "det-ins-num"));
			Parser parser = new Parser((new URL(url)).openConnection()); 
			NodeList nl= parser.parse(af);
			if(nl!=null && nl.size()>0)
			{
				 return nl.elementAt(0).toPlainTextString();
			}
		} catch (ParserException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	@Override
	public int getDownloadCount(String text)
	{
		text=text.replaceAll("人下载","");
		return Integer.parseInt(text);
	}
	

}
