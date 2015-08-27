package com.junrui.logservice.download;

public abstract class MarketDownLoad
{
	public abstract String getPatientUrl();
	
	public abstract String getDoctorUrl();
	
	public String getHtml(String url)
	{
		return "";
	}
	
	public abstract String getDownloadText(String url);
	
	public abstract int getDownloadCount(String text);
	
	public  int getPatientDownloadCount()
	{
		return getDownloadCount(getDownloadText(getPatientUrl()));
	}
	
	public  int getDoctorDownloadCount()
	{
		return getDownloadCount(getDownloadText(getDoctorUrl()));
	}
	
}
