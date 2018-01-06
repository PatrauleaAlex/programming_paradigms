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
}
