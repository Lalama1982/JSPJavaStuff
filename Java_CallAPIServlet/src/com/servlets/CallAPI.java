package com.servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class CallAPI {
	private String baseURL;
	private String param1;
	
	public CallAPI(String baseURL, String param1) {
		this.setBaseURL(baseURL);
		this.setParam1(param1);
	}

	public String getBaseURL() {
		return baseURL;
	}

	public void setBaseURL(String baseURL) {
		this.baseURL = baseURL;
	}

	public String getParam1() {
		return param1;
	}

	public void setParam1(String param1) {
		this.param1 = param1;
	}

	public String MyGETRequest() throws IOException {
		String methodResponse;
		String constructedURL = this.baseURL+"/"+param1;
	    URL urlForGetRequest = new URL(constructedURL); //("https://jsonplaceholder.typicode.com/posts/1");
	    String readLine = null;
	    
	    HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
	    conection.setRequestMethod("GET");
	    conection.setRequestProperty("userId", "a1bcdef"); // set userId its a sample here
	    int responseCode = conection.getResponseCode();
	    
	    if (responseCode == HttpURLConnection.HTTP_OK) {
	        BufferedReader in = new BufferedReader(new InputStreamReader(conection.getInputStream()));
	        StringBuffer response = new StringBuffer();
	        while ((readLine = in .readLine()) != null) {
	            response.append(readLine);
	        } in .close();
	        // print result
	        //System.out.println("JSON String Result " + response.toString());
	        methodResponse = response.toString();
	        //GetAndPost.POSTRequest(response.toString());
	        
	    } else {
	        //System.out.println("GET NOT WORKED");
	    	methodResponse = "GET NOT WORKED";
	    }		
		
		return methodResponse;
		
	}
	
}
