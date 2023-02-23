/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Policy;
import com.exavalu.utils.JDBCConnectionManager;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
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
public class PolicyService {
    
    public static ArrayList consumeDataFromAPI() throws ParseException{
        
        //String result = null;
        ArrayList policies = new ArrayList();
         try {

		URL url = new URL("https://63f0c872ff1b45a1a441818e.mockapi.io/api/dmv/policy");
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
                    JSONArray jsonArray = (JSONArray)parse.parse(inline);
                    //JSONArray jsonArray = data_obj.getJSONArra("languages");
                    
                    for(int i = 0; i < jsonArray.size(); i++){
                        
                        Policy policy = new Policy();
                        JSONObject obj = (JSONObject)jsonArray.get(i);
                        String id = obj.get("id").toString();
                        String name = obj.get("title").toString();
                        String info = obj.get("body").toString();
                        policy.setPolicyId(id);
                        policy.setPolicyInfo(info);
                        policy.setPolicyName(name);
//                        apiUser.setStreet(street);
//                        apiUser.setCity(city);
//                        apiUser.setCompanyName(companyName);
                        policies.add(policy);
                        
                    }
                    
                    System.out.println("Size of Policy List"+policies.size());
                }

	  } catch (MalformedURLException e) {

            Logger log = Logger.getLogger(PolicyService.class.getName());
            log.error(LocalDateTime.now()+ "Error Message: " + e.getMessage()+" Class : APIService, Method : consumeDataFromAPI()");

	  } catch (IOException e) {

            Logger log = Logger.getLogger(PolicyService.class.getName());
            log.error(LocalDateTime.now()+ "Error Message: " + e.getMessage()+" Class : APIService, Method : consumeDataFromAPI()");

	  }
         return policies;
	}

    public static boolean insertDataInDB(ArrayList policies) {
        boolean result = false;
        try {

            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO policies(policyId,policyName,policyInfo)" +"VALUES(?,?,?)";

            
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            con.setAutoCommit(false);
            //Iterator itr = apiUsers.iterator();
            //int i = apiUsers.size();
            Iterator itr = policies.iterator();
            while(itr.hasNext()){
                
                Policy policy = (Policy)itr.next();
                preparedStatement.setString(1,policy.getPolicyId());
                preparedStatement.setString(2, policy.getPolicyName());
                preparedStatement.setString(3, policy.getPolicyInfo());
                
                
                preparedStatement.addBatch();
                
               
            }
                int[] count = preparedStatement.executeBatch();
                con.commit();

                if (count.length >= 1) {
                    result = true;
                    System.out.println(count.length);
                }
                
                con.close();
                
        } catch (SQLException e) {
            Logger log = Logger.getLogger(PolicyService.class.getName());
            log.error(LocalDateTime.now()+ " Error Code:" + e.getErrorCode()+ "Error Message: " + e.getMessage()+" Class : APIService, Method : insertDataInDB()");
        }
        
        return result;
  
    }

    public static Policy getPolicyInfo(String policyId) throws ParseException {
         Policy policy = new Policy();
         try {

		URL url = new URL("https://63f0c872ff1b45a1a441818e.mockapi.io/api/dmv/policy/"+policyId);
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
                    JSONObject obj = (JSONObject) parse.parse(inline);
                    String id = obj.get("id").toString();
                    String name = obj.get("title").toString();
                    String info = obj.get("body").toString();
                    policy.setPolicyId(id);
                    policy.setPolicyInfo(info);
                    policy.setPolicyName(name);
     
                    }
                    
                    System.out.println("Size of Policy:"+policy.getPolicyId());
               
	  } catch (MalformedURLException e) {

            Logger log = Logger.getLogger(PolicyService.class.getName());
            log.error(LocalDateTime.now()+ "Error Message: " + e.getMessage());

	  } catch (IOException e) {

            Logger log = Logger.getLogger(PolicyService.class.getName());
            log.error(LocalDateTime.now()+ "Error Message: " + e.getMessage());

	  }
         return policy;
    }
}

