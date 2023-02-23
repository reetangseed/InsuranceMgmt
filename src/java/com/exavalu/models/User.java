/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.LoginService;
import com.exavalu.services.OfficerService;
import com.exavalu.services.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Preyangsee
 */
public class User extends ActionSupport implements ApplicationAware, SessionAware, Serializable {
    
    
    private String userId;
    private String emailAddress;
    private String password;
    private String firstName;
    private String lastName;
    private String phoneNumber;

    
    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    
    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastname) {
        this.lastName = lastname;
    }
    
    
     public String doLogin() throws Exception {
        String result = "FAILURE";

        boolean successUser = LoginService.getInstance().doLoginUser(emailAddress, password);
        boolean successUnderwriter = LoginService.getInstance().doLoginUnderwriter(emailAddress, password);
        boolean successInsuranceOfficer = LoginService.getInstance().doLoginInsuranceOfficer(emailAddress, password);
        

        if (successUser) {
            System.out.println("returning Success from doLogin method");
            result = "USER";
            sessionMap.put("Loggedin", this);
            userId = LoginService.getInstance().getUserId(emailAddress);
            sessionMap.put("User",this);
            
        }
        else if(successUnderwriter){
            result = "UNDERWRITER";
            System.out.println("returning Success from doLogin method");
            sessionMap.put("Loggedin", this);
            sessionMap.put("User",this);
            
        } 
        else if(successInsuranceOfficer){
            result = "INSURANCEOFFICER";
            System.out.println("returning Success from doLogin method");
            ArrayList fnolList = OfficerService.getAllFnols();
            sessionMap.put("FnolList",fnolList);
            sessionMap.put("Loggedin", this);
            sessionMap.put("User",this);
        }else {
            System.out.println("returning Failure from doLogin method");
            sessionMap.put("ErrorMsg","ERROR");
            Logger log = Logger.getLogger(User.class.getName());
            log.error(LocalDateTime.now()+ "Error Message: " +"Incorrect Email Address or Password!");

            
        }

        return result;
    }
     public String doLogout(){
        
        String result="SUCCESS";
        sessionMap.clear();
        return result;
    }
     public String displayStatus(){
        String result="FAILURE";
        ArrayList fnolList = UserService.getInstance().getAllFnols(userId);
        if(!fnolList.isEmpty()){
            result="SUCCESS";
            sessionMap.put("fnolStatus", fnolList);
            
        }
        else{
            sessionMap.put("emptyMsg", "NOTHING");
        }
        return result;
     }
     
//    public String doSignup()
//    {
//        String result="FAILURE";
//
//        boolean res = LoginService.getInstance().doSignup(this);
//
//        if (res) {
//            result="SUCCESS";
//            String successMsg = "Account Creation Done!";
//            sessionMap.put("SuccessMsg",successMsg);
//        } else {
//            String errorMsg = "Account Creation Failed! Try Again?";
//            sessionMap.put("ErrorMsg",errorMsg);
//        }
//        return result;
//    }


    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
}
