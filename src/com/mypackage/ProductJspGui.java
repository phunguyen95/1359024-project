package com.mypackage;

import java.text.DecimalFormat;
import java.util.List;

/**
 * Created by Long on 5/18/2015.
 */
public class ProductJspGui {
    public static String ToString(List<Product> list) {
        StringBuilder sb = new StringBuilder();
        sb.append("<table border=\"1\"><tr style=\"color:red\"><td>ID</td><td  width=\"400\">Name</td><td align=\"center\">Price(VND)</td><td>Quantity</td><td>Catid</td><td align=\"center\">Date</td><td>Views</td></tr>");
        DecimalFormat numFormat = new DecimalFormat("#,###,###");
        String number;

        for (Product product : list) {
            number = numFormat.format(product.getprice());
            sb.append("<tr><td><a href=\"index.jsp?sku="+product.getSKU()+"\">" + product.getSKU() + "</a></td>"
                    + "<td><a href=\"index.jsp?sku="+product.getSKU()+"\">" + product.getName() + "</a></td>"
                    + "<td align=\"right\" width=\"100\"><a href=\"index.jsp?sku="+product.getSKU()+"\">" + number + "</a></td>"
                    + "<td align=\"right\"><a href=\"index.jsp?sku="+product.getSKU()+"\">" + product.getquantity() + "</a></td>"
                    + "<td align=\"right\"><a href=\"index.jsp?sku="+product.getSKU()+"\">" + product.getcatid() + "</a></td>"
                    + "<td align=\"right\"><a href=\"index.jsp?sku="+product.getSKU()+"\">" + product.getdate() + "</a></td>"
                    + "<td align=\"right\">" + product.getviews() + "</td></tr>");
        }

        sb.append("</table>");
        return sb.toString();
    }
}
