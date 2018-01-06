/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import domain.Bank;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DataBase;

/**
 *
 * @author Andrei
 */
public class BankDAO {
    private Connection conn;
    private static BankDAO instance;

    public static BankDAO getInstance() {
        if (instance == null) {
            instance = new BankDAO();
        }
        return instance;
    }

    public BankDAO() {

    };
    
    public ArrayList<Bank> getBanks() {
        conn=DataBase.getConnection();
        ArrayList<Bank> banks = new ArrayList<>();
        try {
            PreparedStatement prepStmt = conn.prepareStatement("select  * from banks");
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                banks.add(new Bank(rs.getString("name"), rs.getString("address"),rs.getInt("id")));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return banks;
    }
}
