package com.junrui.logservice.download;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.htmlparser.Node;
import org.htmlparser.Parser;
import org.htmlparser.filters.AndFilter;
import org.htmlparser.filters.HasAttributeFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

public abstract class MarketDownLoad
{
	public abstract String getPatientUrl();
	
	public abstract String getDoctorUrl();
	
	public abstract String getDownloadText(String url);
	
	public int getDownloadCount(String text)
	{
		text=text.replaceAll("人下载","");
		return Integer.parseInt(text);
	}
	
	public  int getPatientDownloadCount()
	{
		return getDownloadCount(getDownloadText(getPatientUrl()));
	}
	
	public  int getDoctorDownloadCount()
	{
		return getDownloadCount(getDownloadText(getDoctorUrl()));
	}
	
}
