package com.shoeweb.common;

import javax.servlet.http.HttpServletRequest;

public class Utils {
	 public static String getBaseURL(HttpServletRequest request) {
	        String scheme = request.getScheme();
	        String serverName = request.getServerName();
	        int serverPort = request.getServerPort();
	        String contextPath = request.getContextPath();
	        StringBuffer url =  new StringBuffer();
	        url.append(scheme).append("://").append(serverName);
	        if ((serverPort != 80) && (serverPort != 443)) {
	            url.append(":").append(serverPort);
	        }
	        url.append(contextPath);
	        if(url.toString().endsWith("/")){
	            url.append("/");
	        }
	        return url.toString();
	    }
	    public static double round(double value, int places) {
	        if (places < 0) throw new IllegalArgumentException();

	        long factor = (long) Math.pow(10, places);
	        value = value * factor;
	        long tmp = Math.round(value);
	        return (double) tmp / factor;
	    }
}
