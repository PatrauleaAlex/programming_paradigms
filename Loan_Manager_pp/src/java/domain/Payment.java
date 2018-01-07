/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

/**
 *
 * @author Andrei
 */
public class Payment {
    
    private Loan loan;
    private int ammount;
    private String date;
    private String info;

    public Payment() {
    }

    public Payment(Loan loan, int ammount, String date, String info) {
        this.loan = loan;
        this.ammount = ammount;
        this.date = date;
        this.info = info;
    }

    public Loan getLoan() {
        return loan;
    }

    public void setLoan(Loan loan) {
        this.loan = loan;
    }

    public int getAmmount() {
        return ammount;
    }

    public void setAmmount(int ammount) {
        this.ammount = ammount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "Payment: " + "ammount = " + ammount + ", date = " + date + ", info = " + info + ';';
    }
    
    
}
