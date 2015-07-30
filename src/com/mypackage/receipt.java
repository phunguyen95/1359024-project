package com.mypackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

/**
 * Created by Long on 6/2/2015.
 */
public class receipt {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnf) {
            System.out.println("Driver could not be loaded: " + cnf);
        }
    }

    private int _receiptID;
    private String _client;
    private long _total;
    private Date _date;
    private int _status;
    private Date _datestatus;
    public receipt(){}

    public receipt(int id, String client, long total, Date date){
        _receiptID = id;
        _client = client;
        _total = total;
        _date = date;
    }

    public int getreceiptID(){return _receiptID;}
    public void setreceiptID(int value){_receiptID=value;}
    public String getclient(){return _client;}
    public void setclient(String value){_client=value;}
    public long gettotal(){return _total;}
    public void settotal(long value){_total=value;}
    public Date getdate(){return _date;}
    public void setdate(Date value){_date=value;}
    public int getstatus(){return _status;}
    public void setstatus(int value){_status=value;}
    public Date getdatestatus(){return _datestatus;}
    public void setdatestatus(Date value){_datestatus=value;}

    public void updatestatus(int ReceiptID, int status, Date date){
        String database = "myproduct";
        String connectionURL = "jdbc:mysql://localhost:3306/" + database;
        String dbUser = "root";
        String dbPassword = "";
        String sql = "update receipt set status = ? , datestatus = ? where ReceiptID = ?";
        try {
            Connection conn = DriverManager.getConnection(connectionURL, dbUser, dbPassword);
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1,status);
            psmt.setDate(2, (java.sql.Date) date);
            psmt.setInt(3, ReceiptID);

            psmt.executeUpdate();
            psmt.close();
            if (conn != null) {
                conn.close();
                conn = null;
            }
        }
        catch (SQLException sqle) {
            System.out.println("SQL Exception thrown: " + sqle);
        }
    }


}
