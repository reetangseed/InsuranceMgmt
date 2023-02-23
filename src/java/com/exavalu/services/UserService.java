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
public class UserService {
    
    public static UserService userService = null;
    
    private UserService(){}
    
    public static UserService getInstance()
    {
        if(userService==null)
        {
            return new UserService();
        }
        else
        {
            return userService;
        }
    }
    
    public boolean enterFnolInDB(Fnol fnol){
        
        boolean result = false;
        try {

            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO fnol\n"
                    + "(userId,policyId,carModel,carNumber,carAge,driverName,driverLicenseNumber,driverPhoneNumber,dateOfDamage,timeOfDamage,locationOfAccident,accidentDetails)\n"
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement preparedStatement = con.prepareStatement(sql);

            int totalRows = 0;
            
                preparedStatement.setString(1, fnol.getUserId());
                preparedStatement.setString(2, fnol.getPolicyId());
                preparedStatement.setString(3, fnol.getCarModel());
                preparedStatement.setString(4, fnol.getCarNumber());
                preparedStatement.setString(5, fnol.getCarAge());
                preparedStatement.setString(6, fnol.getDriverName());
                preparedStatement.setString(7, fnol.getDriverLicenseNumber());
                preparedStatement.setString(8, fnol.getDriverPhoneNumber());
                preparedStatement.setString(9, fnol.getDateOfDamage());
                preparedStatement.setString(10, fnol.getTimeofDamage());
                preparedStatement.setString(11, fnol.getLocationOfAccident());
                preparedStatement.setString(12,fnol.getAccidentDetails());
                System.out.println(preparedStatement);
                int row = preparedStatement.executeUpdate();

                if (row == 1) {
                    result = true;
                }

        } catch (SQLException ex) {
	     Logger log = Logger.getLogger(UserService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());
            }
        return result;
    }
    public ArrayList getAllFnols(String userId) {
        
        ArrayList fnolList = new ArrayList();
        try {
            Connection con = JDBCConnectionManager.getConnection();
            //String sql = "SELECT employeeId, firstName, lastName, phone, address, gender, age, basicSalary, .employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId carAllowance, departmentName, roleName FROM employeedb.employees, employeedb.departments, employeedb.roles where employees.departmentId = departments.departmentId and employees.roleId = roles.roleId order by employeeId;";
            String sql = "SELECT * FROM fnol,users where fnol.userId=users.userId and fnol.userId=? order by fnol.fnolId desc;";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, userId);

            System.out.println(userId);
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
                fnol.setUnderwriterStatus(rs.getString("underwriterStatus"));
                fnol.setInsuranceStatus(rs.getString("insuranceStatus"));
                fnol.setLocationOfAccident(rs.getString("locationOfAccident"));
                fnol.setEmailAddress(rs.getString("emailAddress"));
                fnol.setAccidentDetails(rs.getString("accidentDetails"));

                fnolList.add(fnol);

            }


        } catch (SQLException ex) {
            Logger log = Logger.getLogger(UserService.class.getName());
            log.error(LocalDateTime.now()+ "Error Code: " + ex.getErrorCode() +"Error Message: " + ex.getMessage());
        }
        System.out.println("Number of fnols = "+fnolList.size());
        return fnolList;
    }
}
