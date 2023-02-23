/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.DMV;
import com.exavalu.models.Policy;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Scanner;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author Preyangsee
 */
public class DMVService {
    
    public static DMV consumeDataFromAPI(String id) throws ParseException{
        
        //String result = null;
        //ArrayList driverList = new ArrayList();
        DMV driver = new DMV();
         try {

		URL url = new URL("https://63f0c872ff1b45a1a441818e.mockapi.io/api/dmv/info/"+id);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
                else{
                    
                    String inline = "";
                    Scanner scanner = new Scanner(url.openStream());
                    while(scanner.hasNext()){
                        inline += scanner.nextLine();
                    }
                    scanner.close();
                    JSONParser parse = new JSONParser();
                    //JSONArray jsonArray = (JSONArray)parse.parse(inline);
                    //JSONArray jsonArray = data_obj.getJSONArra("languages");
                    JSONObject obj = (JSONObject)parse.parse(inline); 
                    String licenseId = obj.get("licenseId").toString();
                    String name = obj.get("name").toString();
                    String status = obj.get("licenseStatus").toString();
                    String accidentStatus = obj.get("accidentStatus").toString();
                    String gender = obj.get("gender").toString();
                    String eyeColor = obj.get("eyeColor").toString();
                    String address = obj.get("address").toString();
                    driver.setAccidentstatus(accidentStatus);
                    driver.setAddress(address);
                    driver.setEyeColor(eyeColor);
                    driver.setName(name);
                    driver.setLicenseId(licenseId);
                    driver.setLicenseStatus(status);
                    driver.setGender(gender);
                    System.out.println("Driver present"+driver.getName());

                }

	  } catch (MalformedURLException e) {

            Logger log = Logger.getLogger(PolicyService.class.getName());
            log.error(LocalDateTime.now()+ "Error Message: " + e.getMessage());

	  } catch (IOException e) {

            Logger log = Logger.getLogger(PolicyService.class.getName());
            log.error(LocalDateTime.now()+ "Error Message: " + e.getMessage());

	  }
         return driver;
	}

    
}
