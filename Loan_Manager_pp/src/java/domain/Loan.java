/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import java.util.ArrayList;

/**
 *
 * @author Andrei
 */
public class Loan {
    private int id;
    private User user;
    private Bank bank;
    private int ammount;
    private int rate;
    private int noMonths;
    private int paid;
    private int toBePaid;
    private int completed;

    public Loan() {
    }

    public Loan( int id, User user, Bank bank, int ammount, int rate, int noMonths, int paid, int toBePaid, int completed) {
        this.id = id;
        this.user = user;
        this.bank = bank;
        this.ammount = ammount;
        this.rate = rate;
        this.noMonths = noMonths;
        this.paid = paid;
        this.toBePaid = toBePaid;
        this.completed = completed;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public int getAmmount() {
        return ammount;
    }

    public void setAmmount(int ammount) {
        this.ammount = ammount;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getNoMonths() {
        return noMonths;
    }

    public void setNoMonths(int noMonths) {
        this.noMonths = noMonths;
    }

    public int getPaid() {
        return paid;
    }

    public void setPaid(int paid) {
        this.paid = paid;
    }

    public int getToBePaid() {
        return toBePaid;
    }

    public void setToBePaid(int toBePaid) {
        this.toBePaid = toBePaid;
    }

    public int getCompleted() {
        return completed;
    }

    public void setCompleted(int completed) {
        this.completed = completed;
    }

    @Override
    public String toString() {
        return "Loan of " + "user = " + user + ", bank = " + bank + ", ammount = " + ammount + ", rate = " + rate + ", noMonths = " + noMonths + ", paid = " + paid + ", toBePaid = " + toBePaid + ", completed = " + completed + ";" ;
    }
    
    
    
}
