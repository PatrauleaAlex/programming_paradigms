/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;

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
    
    
}
