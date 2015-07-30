package com.mypackage;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Long on 6/14/2015.
 */
@WebServlet(name = "AddProductServlet")
public class AddProductServlet extends HttpServlet {
    private HttpSession session;
    private static final long serialVersionUID = 1L;
    private String filePath;
    private File file ;
    private boolean isMultipart;
    private static final String DATA_DIRECTORY = "data";
    private static final int MAX_MEMORY_SIZE = 2048 * 2048 * 2;
    private static final int MAX_REQUEST_SIZE = 2048 * 2048;
    public void init( ){
        // Get the file location where it would be stored.
        filePath =
                getServletContext().getInitParameter("file-upload");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        session = request.getSession();
        session.removeAttribute("list");
        String name = "";
        int price =0;
        int quantity = 0;
        int category = 0;
        String image = "";
        String description = "";
        // Check that we have a file upload request
        ///////////////////////////////////////////////////////////////////////////////

        // Check that we have a file upload request
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
                    if(fi.getFieldName().equals("txtname")){
                        name = fi.getString();
                    }
                    if(fi.getFieldName().equals("txtprice")){
                        String a = fi.getString();
                        price = Integer.parseInt(a);
                    }
                    if(fi.getFieldName().equals("txtquantity")){
                        String a = fi.getString();
                        quantity = Integer.parseInt(a);
                    }
                    if(fi.getFieldName().equals("txtcategory")){
                        String a = fi.getString();
                        category = Integer.parseInt(a);
                    }
                    if(fi.getFieldName().equals("txtdescription")){
                        description = fi.getString();
                    }
                }
                if ( !fi.isFormField () )
                {

                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    String contentType = fi.getContentType();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // Write the file
                    if( fileName.lastIndexOf("\\") >= 0 ){
                        file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
                    }else{
                        file = new File( filePath +
                                fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                    }
                    fi.write( file ) ;
                    System.out.println("fileName: "+fileName);
                    image = fileName;
                    out.println("Uploaded Filename: " + fileName + "<br>");
                }
            }

        }catch(Exception ex) {
            System.out.println(ex);
        }

        ///////////////////////////////////////////////////////////////////////////////

        if(!image.equals("")){
            Product p = new Product();
            Product p1 = new Product();
            p.setName(name);
            p.setprice(price);
            p.setquantity(quantity);
            p.setcatid(category);
            p.setimage(image);
            p.setdescription(description);
            if(p1.addproduct(p)){
                session.setAttribute("msgadd","Successfully added");
                response.sendRedirect("admin.jsp");
            }
            else{
                session.setAttribute("msgadd","Failed. Try to add again");
                response.sendRedirect("addproduct.jsp");
            }
        }
        else{
            System.out.println("ngu hoc");
            response.sendRedirect("addproduct.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
