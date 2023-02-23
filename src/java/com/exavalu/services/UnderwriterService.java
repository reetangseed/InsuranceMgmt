/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Fnol;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import org.apache.log4j.Logger;

/**
 *
 * @author Preyangsee
 */
public class UnderwriterService {

    public static ArrayList getAllFnols() {
        
        ArrayList fnolList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            //String sql = "SELECT employeeId, firstName, lastName, phone, address, gender, age, basicSalary, .employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId carAllowance, departmentName, roleName FROM employeedb.employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId order by employeeId;";
            String sql = "SELECT * FROM fnol, users where fnol.userId=users.userId";
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();


            while(rs.next())
            {
                Fnol fnol = new Fnol();
                
                fnol.setFnolId(rs.getString("fnolId"));
                fnol.setFirstName(rs.getString("firstName"));
                fnol.setLastName(rs.getString("lastName"));
                fnol.setPhoneNumber(rs.getString("phoneNumber"));
                fnol.setPolicyId(rs.getString("policyId"));
                fnol.setCarAge(rs.getString("carAge"));
                fnol.setCarModel(rs.getString("carModel"));
                fnol.setCarNumber(rs.getString("carNumber"));
                fnol.setDateOfDamage(rs.getString("dateOfDamage"));
                fnol.setTimeofDamage(rs.getString("timeOfDamage"));
                fnol.setDriverLicenseNumber(rs.getString("driverLicenseNumber"));
                fnol.setDriverName(rs.getString("driverName"));
                fnol.setDriverPhoneNumber(rs.getString("driverPhoneNumber"));
                fnol.setUserId(rs.getString("userId"));
                fnol.setLocationOfAccident(rs.getString("locationOfAccident"));
                fnol.setEmailAddress(rs.getString("emailAddress"));
                fnol.setPolicyId(rs.getString("policyId"));
                fnol.setAccidentDetails(rs.getString("accidentDetails"));
                fnol.setInsuranceStatus(rs.getString("insuranceStatus"));
                fnol.setUnderwriterStatus(rs.getString("underwriterStatus"));
                fnolList.add(fnol);

            }


        } catch (SQLException ex) {
            Logger log = Logger.getLogger(UnderwriterService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());
        }
        System.out.println("Number of fnols = "+fnolList.size());
        return fnolList;
    }
    public static boolean updateStatus(int val, String fnolId){
        boolean res = false;
        try {
            Connection con = JDBCConnectionManager.getConnection();
            //String sql = "SELECT employeeId, firstName, lastName, phone, address, gender, age, basicSalary, .employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId carAllowance, departmentName, roleName FROM employeedb.employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId order by employeeId;";
            String sql = "UPDATE fnol SET underwriterStatus = ? WHERE fnolId = ?;";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, val);
            preparedStatement.setString(2, fnolId);
            
            int row = preparedStatement.executeUpdate();

                if (row == 1) {
                    res = true;
                }

        } catch (SQLException ex) {
            Logger log = Logger.getLogger(UnderwriterService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());
        }
        

        return res;
    }

    public static Fnol getFnol(String fnolId) {
        Fnol fnol = new Fnol();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            //String sql = "SELECT employeeId, firstName, lastName, phone, address, gender, age, basicSalary, .employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId carAllowance, departmentName, roleName FROM employeedb.employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId order by employeeId;";
            String sql = "SELECT * FROM fnol, users where fnol.userId=users.userId and fnolId=?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1,fnolId);

            ResultSet rs = preparedStatement.executeQuery();
             if(rs.next()){
                 fnol.setFnolId(rs.getString("fnolId"));
                 fnol.setFirstName(rs.getString("firstName"));
                 fnol.setLastName(rs.getString("lastName"));
                 fnol.setPhoneNumber(rs.getString("phoneNumber"));
                 fnol.setPolicyId(rs.getString("policyId"));
                 fnol.setCarAge(rs.getString("carAge"));
                 fnol.setCarModel(rs.getString("carModel"));
                 fnol.setCarNumber(rs.getString("carNumber"));
                 fnol.setDateOfDamage(rs.getString("dateOfDamage"));
                 fnol.setTimeofDamage(rs.getString("timeOfDamage"));
                 fnol.setDriverLicenseNumber(rs.getString("driverLicenseNumber"));
                 fnol.setDriverName(rs.getString("driverName"));
                 fnol.setDriverPhoneNumber(rs.getString("driverPhoneNumber"));
                 fnol.setUserId(rs.getString("userId"));
                 fnol.setLocationOfAccident(rs.getString("locationOfAccident"));
                 fnol.setEmailAddress(rs.getString("emailAddress"));
                 fnol.setPolicyId(rs.getString("policyId"));
                 fnol.setAccidentDetails(rs.getString("accidentDetails"));
                 fnol.setInsuranceStatus(rs.getString("insuranceStatus"));
                 fnol.setUnderwriterStatus(rs.getString("underwriterStatus"));

             }
                System.out.println("Fnol present");
        } catch (SQLException ex) {
            Logger log = Logger.getLogger(UnderwriterService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());
        }
        
        return fnol;
    }
   
    }
   
