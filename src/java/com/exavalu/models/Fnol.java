/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.DMVService;
import com.exavalu.services.OfficerService;
import com.exavalu.services.PolicyService;
import com.exavalu.services.UnderwriterService;
import com.exavalu.services.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.simple.parser.ParseException;

/**
 *
 * @author Preyangsee
 */
public class Fnol extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    private String fnolId;
    private String userId;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String policyId;
    private String carModel;
    private String carNumber;
    private String carAge;
    private String driverName;
    private String driverLicenseNumber;
    private String driverPhoneNumber;
    private String dateOfDamage;
    private String timeofDamage;
    private String locationOfAccident;
    private String underwriterStatus;
    private String insuranceStatus;
    private String emailAddress;
    private String accidentDetails;

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

    public String doInsertFnol() {
        String result = "FAILURE";
        boolean res = UserService.getInstance().enterFnolInDB(this);
        if (res) {
            result = "SUCCESS";
            sessionMap.put("FNOL", this);
            sessionMap.put("successmsg", "INSERTED");
        } else {
            System.out.println("returning failure from insert");
            sessionMap.put("errormsg", "NOT INSERTED");
        }
        return result;
    }

    public String getAllFnol() {
        String result = "FAILURE";
        ArrayList fnolList = UnderwriterService.getAllFnols();
        if (!fnolList.isEmpty()) {
            result = "SUCCESS";
            sessionMap.put("FnolList", fnolList);
        }
        return result;
    }
    public String getFNOL(){
        String result = "FAILURE";
        Fnol fnol= UnderwriterService.getFnol(fnolId);
        System.out.println(fnolId);
        if (fnol!=null) {
            result = "SUCCESS";
            System.out.println("returning success from getFnol" + fnol.getFirstName());
            
            sessionMap.put("fnol", fnol);
        }
        return result;
    }
    public String checkAllFnol() {
        String result = "FAILURE";
        ArrayList fnolList = OfficerService.getAllFnols();
        if (!fnolList.isEmpty()) {
            result = "SUCCESS";
            sessionMap.put("FnolList", fnolList);
        }
        return result;
    }
    public String approveUnderwriter(){
        String result = "FAILURE";
        boolean res = UnderwriterService.updateStatus(1, this.fnolId);
        ArrayList fnolList = UnderwriterService.getAllFnols();
        if(res){
            result="SUCCESS";
            sessionMap.put("FnolList", fnolList);
        }
        return result;
    }
    public String rejectUnderwriter(){
        String result = "FAILURE";
        boolean res = UnderwriterService.updateStatus(-1, this.fnolId);
        ArrayList fnolList = UnderwriterService.getAllFnols();
        if(res){
            result="SUCCESS";
            sessionMap.put("FnolList", fnolList);
        }
        return result;
    }
    public String approveFNOL(){
        String result = "FAILURE";
        boolean res = OfficerService.updateStatus(1, this.fnolId);
        ArrayList fnolList = UnderwriterService.getAllFnols();
        if(res){
            result="SUCCESS";
            sessionMap.put("FnolList", fnolList);
        }
        return result;
    }
    public String rejectFNOL(){
        String result = "FAILURE";
        boolean res = OfficerService.updateStatus(-1, this.fnolId);
        ArrayList fnolList = UnderwriterService.getAllFnols();
        if(res){
            result="SUCCESS";
            sessionMap.put("FnolList", fnolList);
        }
        return result;
    }
    public String getPolicies() throws ParseException{
        String result = "FAILURE";
        ArrayList policyList = PolicyService.consumeDataFromAPI();
        if(!policyList.isEmpty()){
            result = "SUCCESS";
            sessionMap.put("PolicyList", policyList);
        }
        return result;
    }
    public String getDriverInfo() throws ParseException{
        
        String result = "FAILURE";
        DMV driver = DMVService.consumeDataFromAPI(driverLicenseNumber);
        System.out.println(driverLicenseNumber);
        if(driver!=null){
            sessionMap.put("driver", driver);
            System.out.println("returning success from driver info");
            result = "SUCCESS";
        }
        return result;
    }
    public String getPolicyInfo() throws ParseException{
        
        String result = "FAILURE";
        Policy policy = PolicyService.getPolicyInfo(policyId);
        System.out.println(driverLicenseNumber);
        if(policy!=null){
            sessionMap.put("policy", policy);
            System.out.println("returning success from driver info");
            result = "SUCCESS";
        }
        return result;
    }

        public String dummy(){
        
        String result = "SUCCESS";
        return result;
    }

    /**
     * @return the fnolId
     */
    public String getFnolId() {
        return fnolId;
    }

    /**
     * @param fnolId the fnolId to set
     */
    public void setFnolId(String fnolId) {
        this.fnolId = fnolId;
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

    /**
     * @return the policyId
     */
    public String getPolicyId() {
        return policyId;
    }

    /**
     * @param policyId the policyId to set
     */
    public void setPolicyId(String policyId) {
        this.policyId = policyId;
    }

    /**
     * @return the carModel
     */
    public String getCarModel() {
        return carModel;
    }

    /**
     * @param carModel the carModel to set
     */
    public void setCarModel(String carModel) {
        this.carModel = carModel;
    }

    /**
     * @return the carNumber
     */
    public String getCarNumber() {
        return carNumber;
    }

    /**
     * @param carNumber the carNumber to set
     */
    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }


    /**
     * @return the driverName
     */
    public String getDriverName() {
        return driverName;
    }

    /**
     * @param driverName the driverName to set
     */
    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    /**
     * @return the driverLicenseNumber
     */
    public String getDriverLicenseNumber() {
        return driverLicenseNumber;
    }

    /**
     * @param driverLicenseNumber the driverLicenseNumber to set
     */
    public void setDriverLicenseNumber(String driverLicenseNumber) {
        this.driverLicenseNumber = driverLicenseNumber;
    }

    /**
     * @return the driverPhoneNumber
     */
    public String getDriverPhoneNumber() {
        return driverPhoneNumber;
    }

    /**
     * @param driverPhoneNumber the driverPhoneNumber to set
     */
    public void setDriverPhoneNumber(String driverPhoneNumber) {
        this.driverPhoneNumber = driverPhoneNumber;
    }

    /**
     * @return the dateOfDamage
     */
    public String getDateOfDamage() {
        return dateOfDamage;
    }

    /**
     * @param dateOfDamage the dateOfDamage to set
     */
    public void setDateOfDamage(String dateOfDamage) {
        this.dateOfDamage = dateOfDamage;
    }

    /**
     * @return the timeofDamage
     */
    public String getTimeofDamage() {
        return timeofDamage;
    }

    /**
     * @param timeofDamage the timeofDamage to set
     */
    public void setTimeofDamage(String timeofDamage) {
        this.timeofDamage = timeofDamage;
    }

    /**
     * @return the locationOfAccident
     */
    public String getLocationOfAccident() {
        return locationOfAccident;
    }

    /**
     * @param locationOfAccident the locationOfAccident to set
     */
    public void setLocationOfAccident(String locationOfAccident) {
        this.locationOfAccident = locationOfAccident;
    }

    /**
     * @return the underwriterStatus
     */
    public String getUnderwriterStatus() {
        return underwriterStatus;
    }

    /**
     * @param underwriterStatus the underwriterStatus to set
     */
    public void setUnderwriterStatus(String underwriterStatus) {
        this.underwriterStatus = underwriterStatus;
    }

    /**
     * @return the insuranceStatus
     */
    public String getInsuranceStatus() {
        return insuranceStatus;
    }

    /**
     * @param insuranceStatus the insuranceStatus to set
     */
    public void setInsuranceStatus(String insuranceStatus) {
        this.insuranceStatus = insuranceStatus;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

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
     * @return the carAge
     */
    public String getCarAge() {
        return carAge;
    }

    /**
     * @param carAge the carAge to set
     */
    public void setCarAge(String carAge) {
        this.carAge = carAge;
    }

    /**
     * @return the emailAddress
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * @param emailAddress the emailAddress to set
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    /**
     * @return the accidentDetails
     */
    public String getAccidentDetails() {
        return accidentDetails;
    }

    /**
     * @param accidentDetails the accidentDetails to set
     */
    public void setAccidentDetails(String accidentDetails) {
        this.accidentDetails = accidentDetails;
    }

}
