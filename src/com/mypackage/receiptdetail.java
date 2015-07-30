package com.mypackage;

/**
 * Created by Long on 6/4/2015.
 */
public class receiptdetail {
    private int detailid;
    private int receiptid;
    private int sku;
    private int price;
    private int quantity;
    private long total;

    public receiptdetail(){}
    public int getdetailid(){return detailid;}
    public void setdetailid(int value){detailid=value;}
    public int getreceiptid(){return receiptid;}
    public void setreceiptid(int value){receiptid=value;}
    public int getsku(){return sku;}
    public void setsku(int value){sku=value;}
    public int getprice(){return price;}
    public void setprice(int value){price=value;}
    public int getquantity(){return quantity;}
    public void setquantity(int value){quantity=value;}
    public long gettotal(){return total;}
    public void settotal(long value){total=value;}
}
