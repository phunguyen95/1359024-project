package com.mypackage;

import java.util.ArrayList;

/**
 * Created by Long on 5/27/2015.
 */
public class Cart {
    private Product p;
    private int quantity;

    public Cart() {
    }

    public Cart(Product p, int quantity) {
        this.p = p;
        this.quantity = quantity;
    }

    public ArrayList<Cart> reverse(ArrayList<Cart> list)
    {
        ArrayList<Cart> theReturn = new ArrayList<Cart>(list.size());

        for(int i=list.size()-1;i>=0;i--)
            theReturn.add(list.get(i));

        return theReturn;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
