package com.mypackage;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Long on 6/3/2015.
 */
@WebServlet(name = "deleteProduct")
public class deleteProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String filePath;
    private File file ;
    private boolean isMultipart;
    private static final String DATA_DIRECTORY = "data";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;
    public void init( ){
        // Get the file location where it would be stored.
        filePath =
                getServletContext().getInitParameter("file-upload");
    }
    private HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        int sku = 0;

        String image = "";
        isMultipart = ServletFileUpload.isMultipartContent(request);

        if( !isMultipart ){
            image = "No file upload";
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(MAX_MEMORY_SIZE);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try{
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();


            System.out.println("uploading img file");

            while ( i.hasNext () ) {

                FileItem fi = (FileItem)i.next();

                if(fi.isFormField ()){
                    if(fi.getFieldName().equals("txtid")){
                        String a = fi.getString();
                        sku = Integer.parseInt(a);
                    }

                }
            }

        }catch(Exception ex) {
            System.out.println(ex);
        }

        Product p = new Product();
        if(p.deleteProduct(sku)){
            session.setAttribute("msgupdate","Successfully Deleted");
        }
        else{
            session.setAttribute("msgupdate","Failed");
        }
        response.sendRedirect("updateproduct.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
