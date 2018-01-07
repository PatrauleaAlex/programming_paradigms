/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.Bank;
import domain.User;
import domain.Loan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.OptionalDouble;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DataBase;

/**
 *
 * @author Andrei
 */
public class LoanDAO {
    
    private Connection conn;
    private static LoanDAO instance;

    public static LoanDAO getInstance() {
        if (instance == null) {
            instance = new LoanDAO();
        }
        return instance;
    }

    public LoanDAO() {

    };
    
    public boolean insertLoan( int uId, int bId, int amount, int rate, int noM){
        conn = DataBase.getConnection();
        
        int tbp = amount + ((amount * rate) / 100);
        try {
            PreparedStatement statement = conn.prepareStatement("insert into loans values (default, ?, ?, ?, ? ,?, ?, ?, ?)");
            statement.setInt(1, uId);
            statement.setInt(2, bId);
            statement.setInt(3, amount);
            statement.setInt(4, rate);
            statement.setInt(5, noM);
            statement.setInt(6, 0);
            statement.setInt(7, tbp);
            statement.setInt(8, 0);
            statement.executeUpdate();
            conn.commit();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(LoanDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
        
    }
    
    public ArrayList<Loan> getLoans(String username){
        conn=DataBase.getConnection();
        ArrayList<Loan> loans = new ArrayList<>();
        try {
            PreparedStatement prepStmt = conn.prepareStatement("select \n" +
                                                                "	banks.id as bank_id,\n" +
                                                                "	banks.name as bank_name, \n" +
                                                                "	banks.address as bank_address, \n" +
                                                                "	loans.id as l_id,\n" +
                                                                "	loans.ammount as am,\n" +
                                                                "	loans.rate as rt,  \n" +
                                                                "	loans.toBePaid as tbp, \n" +
                                                                "	loans.noMonths as nomon, \n" +
                                                                "	loans.paid as pd,\n" +
                                                                "	loans.completed as comp\n" +
                                                                "from loans\n" +
                                                                "	left join banks on banks.id = loans.bank_id\n" +
                                                                "	left join users on users.id = loans.user_id\n" +
                                                                "where users.username = ?;");
            prepStmt.setString(1, username);
            
            ResultSet rs = prepStmt.executeQuery();
            
            while (rs.next()) {
                Loan l = new Loan();
                l.setId(rs.getInt("l_id"));
                l.setAmmount(rs.getInt("am"));
                l.setRate(rs.getInt("rt"));
                l.setToBePaid(rs.getInt("tbp"));
                l.setNoMonths(rs.getInt("nomon"));
                l.setPaid(rs.getInt("pd"));
                l.setCompleted(rs.getInt("comp"));
                Bank b;
                b = new Bank(rs.getString("bank_name"), rs.getString("bank_address"),rs.getInt("bank_id"));
                l.setBank(b);
                User u = new User();
                u.setUsername(username);
                l.setUser(u);
                loans.add(l);
            }
            
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return loans;
    }
    
    public boolean updateLoan(int loanId, int amount){
        conn = DataBase.getConnection();
        try {
            int toBePaid = 0;
            int completed = 0;
            int paid = 0;
            
            PreparedStatement prepStmt = conn.prepareStatement("select toBePaid from loans where id = ?;");
            prepStmt.setInt(1, loanId);
            
            ResultSet rs = prepStmt.executeQuery();
            
            while(rs.next()){
                toBePaid = rs.getInt("toBePaid");
            }
            
            if((toBePaid - amount) <= 0){
                completed = 1;
            }

            
            if(completed == 1){
                prepStmt = 
                        conn.prepareStatement("update loans set paid=paid + ?, toBePaid = ?, completed = 1 where id = ?;");
                prepStmt.setInt(1, amount);
                prepStmt.setInt(2, 0);
                prepStmt.setInt(3, loanId);
                prepStmt.executeUpdate();
                conn.commit();
                prepStmt.close();
            }else{
                prepStmt = 
                        conn.prepareStatement("update loans set paid=paid + ?, toBePaid = toBePaid-?, completed = 0 where id = ?;");
                prepStmt.setInt(1, amount);
                prepStmt.setInt(2, amount);
                prepStmt.setInt(3, loanId);
                prepStmt.executeUpdate();
                conn.commit();
                prepStmt.close();
            }
            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(LoanDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    //functional part
    public double getAverage(String username){
        OptionalDouble average = getLoans(username).stream().mapToDouble(l -> l.getAmmount()).average();
        
        return average.isPresent() ? average.getAsDouble() :0;
    }
    
    public double getMax(String username){
        OptionalDouble max = getLoans(username).stream().mapToDouble(l -> l.getAmmount()).max();
        
        return max.isPresent() ? max.getAsDouble() :0;
    }
    
    public double getMin(String username){
        OptionalDouble max = getLoans(username).stream().mapToDouble(l -> l.getAmmount()).max();
        
        return max.isPresent() ? max.getAsDouble() :0;
    }
        
}
