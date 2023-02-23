/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.User;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import javax.swing.plaf.nimbus.State;
import org.apache.log4j.Logger;

/**
 *
 * @author Avijit Chattopadhyay
 */
public class LoginService {
    
    public static LoginService loginService = null;
    
    private LoginService(){}
    
    public static LoginService getInstance()
    {
        if(loginService==null)
        {
            return new LoginService();
        }
        else
        {
            return loginService;
        }
    }
    
    public boolean doLoginUser(String emailAddress, String password)
    {
        boolean success = false;
        
        String sql = "Select * from users where emailAddress=? and password=?";
        
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, emailAddress);
            ps.setString(2, password);
            
            System.out.println("LoginService :: "+ps);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                success = true;
            }
            
        } catch (SQLException ex) {
            Logger log = Logger.getLogger(LoginService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());

        }
        
        
        return success;
    }
    public boolean doLoginUnderwriter(String emailAddress, String password)
    {
        boolean success = false;
        
        String sql = "Select * from underwriters where emailAddress=? and password=?";
        
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, emailAddress);
            ps.setString(2, password);
            
            System.out.println("LoginService :: "+ps);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                success = true;
            }
            
        } catch (SQLException ex) {
            Logger log = Logger.getLogger(LoginService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());
        }
        
        
        return success;
    }
    public boolean doLoginInsuranceOfficer(String emailAddress, String password)
    {
        boolean success = false;
        
        String sql = "SELECT * FROM insuranceofficers where emailAddress=? and password=?";
        
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, emailAddress);
            ps.setString(2, password);
            
            System.out.println("LoginService :: "+ps);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                success = true;
            }
            
        } catch (SQLException ex) {
            Logger log = Logger.getLogger(LoginService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());
        }
        
        
        return success;
    }
    public String getUserId(String emailAddress){
        String userId=null;
        
        String sql = "Select userId from users where emailAddress=?";
        
        try {
            Connection con = JDBCConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, emailAddress);
            
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                userId=rs.getString("userId");
            }
            
        } catch (SQLException ex) {
            Logger log = Logger.getLogger(LoginService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());
        }
        
        
        return userId;
    }
    
//    public boolean doSignup(User user){
//        
//        boolean result = false;
//        Connection con = JDBCConnectionManager.getConnection();
//        try{
//            
//            
//            String sql = "INSERT INTO users(emailAddress, password, firstName,lastName,status,addressLine1,addressLine2,countryCode,stateCode,districtCode)" + "VALUES(? ,? ,? ,? ,? ,? ,? ,? ,? ,?)";
//            PreparedStatement preparedStatement = con.prepareStatement(sql);
//            preparedStatement.setString(1, user.getEmailAddress());
//            preparedStatement.setString(2, user.getPassword());
//            preparedStatement.setString(3, user.getFirstName());
//            preparedStatement.setString(4, user.getLastName());
//            preparedStatement.setInt(5,1);
//            
//            
//            int row = preparedStatement.executeUpdate();
//            
//            if(row==1){
//                result = true;
//            }
//        }catch(SQLException ex){
//            Logger log = Logger.getLogger(LoginService.class.getName());
//            log.error(LocalDateTime.now()+ " Error Code: " + ex.getErrorCode()+ " Error Message: " + ex.getMessage());
//
//        }
//        return result;
//    }
//    public ArrayList getAllCountries()
//    {
//        ArrayList countryList = new ArrayList();
//        try {
//            Connection con = JDBCConnectionManager.getConnection();
//            //String sql = "SELECT employeeId, firstName, lastName, phone, address, gender, age, basicSalary, .employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId carAllowance, departmentName, roleName FROM employeedb.employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId order by employeeId;";
//            String sql = "SELECT * FROM country";
//            PreparedStatement preparedStatement = con.prepareStatement(sql);
//
//            ResultSet rs = preparedStatement.executeQuery();
//
//
//            while(rs.next())
//            {
//                Country country = new Country();
//                country.setCountryName(rs.getString("countryName"));
//                country.setCountryCode(rs.getString("countryCode"));
//                
//                
//                countryList.add(country);
//
//            }
//
//
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        System.err.println("Number of countries = "+countryList.size());
//        return countryList;
//    }
//    public ArrayList getAllStates(String countryCode)
//    {
//        ArrayList stateList = new ArrayList();
//        try {
//            Connection con = JDBCConnectionManager.getConnection();
//            //String sql = "SELECT employeeId, firstName, lastName, phone, address, gender, age, basicSalary, .employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId carAllowance, departmentName, roleName FROM employeedb.employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId order by employeeId;";
//            String sql = "SELECT * FROM state where countryCode=?";
//            PreparedStatement preparedStatement = con.prepareStatement(sql);
//            preparedStatement.setString(1, countryCode);
//
//            ResultSet rs = preparedStatement.executeQuery();
//
//
//            while(rs.next())
//            {
//                State state = new State();
//                
//                state.setStateCode(rs.getString("stateCode"));
//                state.setStateName(rs.getString("stateName"));
//                
//                stateList.add(state);
//
//            }
//
//
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        System.err.println("Number of states = "+stateList.size());
//        return stateList;
//    }
    
    public static User getUser(String emailAddress) {
        User user= new User();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "Select * from users where emailAddress=?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, emailAddress);

            ResultSet rs = preparedStatement.executeQuery();

            if(rs.next())
            {

                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
            }
            
        } catch (SQLException ex) {
            Logger log = Logger.getLogger(LoginService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());
        }

        return user;
    }

//    public ArrayList getAllDistricts(String stateCode) {
//        
//        ArrayList districtList = new ArrayList();
//        try {
//            Connection con = JDBCConnectionManager.getConnection();
//            //String sql = "SELECT employeeId, firstName, lastName, phone, address, gender, age, basicSalary, .employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId carAllowance, departmentName, roleName FROM employeedb.employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId order by employeeId;";
//            String sql = "SELECT * FROM district where stateCode=?";
//            PreparedStatement preparedStatement = con.prepareStatement(sql);
//            preparedStatement.setString(1, stateCode);
//
//            ResultSet rs = preparedStatement.executeQuery();
//
//
//            while(rs.next())
//            {
//                District district = new District();
//                
//                district.setDistrictCode(rs.getString("districtCode"));
//                district.setDistrictName(rs.getString("districtName"));
//                
//                districtList.add(district);
//
//            }
//
//
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        System.err.println("Number of districts = "+districtList.size());
//        return districtList;
//    }
}
