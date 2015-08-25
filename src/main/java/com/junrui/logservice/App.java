package com.junrui.logservice;

import java.io.IOException;
import java.net.URL;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.htmlparser.Node;
import org.htmlparser.Parser;
import org.htmlparser.filters.AndFilter;
import org.htmlparser.filters.HasAttributeFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

/**
 * Hello world!
 *
 */
public class App 
{
	
	public static final String url="http://sj.qq.com/myapp/detail.htm?apkName=com.junrui.yhtd";
	
    public static void main( String[] args )
    {
    	
    	CloseableHttpClient httpClient=HttpClients.createDefault();
    	HttpGet get=new HttpGet(url);
    	
    	try {
			HttpResponse response=httpClient.execute(get);
			HttpEntity entity=response.getEntity();
			System.out.println(EntityUtils.toString(entity, "utf-8") );
			
			
			Parser parser = new Parser((new URL(url)).openConnection()); 
			
			AndFilter af=new AndFilter(new TagNameFilter("div"), new HasAttributeFilter("class", "det-ins-num"));
			
			NodeList nl= parser.parse(af);
			for(int i=0;i<nl.size();i++)
			{
				Node n=nl.elementAt(i);
				System.out.println(n.getText());
				System.out.println(n.toHtml());
				System.out.println(n.toPlainTextString());
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParserException e) {
			e.printStackTrace();
		}
    }
}
