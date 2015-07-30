package com.mypackage;

import java.util.List;

/**
 * Created by Long on 5/19/2015.
 */
public class CategoryJspGui {
    public static String ToString(List<Category> list) {
        StringBuilder sb = new StringBuilder();
        sb.append("<table border=\"1\"><tr style=\"color:red\"><td>ID</td><td>Name</td></tr>");

        for (Category cate : list) {
            sb.append("<tr><td>" + cate.getid() + "</td>"
                    + "<td>" + cate.getName() + "</td></tr>");
        }

        sb.append("</table>");
        return sb.toString();
    }
}
