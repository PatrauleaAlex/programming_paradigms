/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.Payment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DataBase;

/**
 *
 * @author Andrei
 */
public class PaymentDAO {
    private Connection conn;
    private static PaymentDAO instance;

    public static PaymentDAO getInstance() {
        if (instance == null) {
            instance = new PaymentDAO();
        }
        return instance;
    }

    public PaymentDAO() {

    };
    
    public boolean insertPayment(int lId, int amount, String date, String info){
        conn = DataBase.getConnection();
        
        try {
            PreparedStatement statement = conn.prepareStatement("insert into payments values (default, ?, ?, ?, ? )");
            statement.setInt(1, lId);
            statement.setInt(2, amount);
            statement.setString(3, date);
            statement.setString(4, info);
            statement.executeUpdate();
            conn.commit();
            statement.close();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(LoanDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
    
    public ArrayList<Payment> getPayments(String username){
        
        conn = DataBase.getConnection();
        
        System.out.println("username" + username);
        ArrayList<Payment> payments = new ArrayList<>();
        try {
            PreparedStatement prepStmt = conn.prepareStatement("select banks.id as bank_id, banks.name as bank_name, banks.address as bank_address, loans.id as l_id, loans.ammount as am, loans.rate as rt, loans.toBePaid as tbp, loans.noMonths as nomon, loans.paid as pd, loans.completed as comp,payments.ammount as paid_am,payments.date as pay_dat,payments.info as pay_inf from payments left join loans on loans.id = payments.loan_id left join banks on banks.id = loans.bank_id left join users on users.id = loans.user_id where users.username = ?;");
            prepStmt.setString(1, username);
            
            ResultSet rs = prepStmt.executeQuery();
            
            while (rs.next()) {
                Payment l = new Payment();
                l.setAmmount(rs.getInt("paid_am"));
                l.setDate(rs.getString("pay_dat"));
                l.setInfo(rs.getString("pay_inf"));
                
                
                payments.add(l);
            }
            
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return payments;
    }
    
}
