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
@WebServlet(name = "UpdateproductServlet")
public class UpdateproductServlet extends HttpServlet {
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
        session = request.getSession();
        int sku = 0;
        if(request.getParameter("txtid")!=null){
            sku = Integer.parseInt(request.getParameter("txtid"));
        }
        String name = "";
        if(request.getParameter("txtname")!=null){
            name = request.getParameter("txtname");
        }
        int price = 0;
        if(request.getParameter("txtprice")!=null){
            price = Integer.parseInt(request.getParameter("txtprice"));
        }
        int quantity = 0;
        if(request.getParameter("txtquantity")!=null){
            quantity = Integer.parseInt(request.getParameter("txtquantity"));
        }
        String description = "";
        if(request.getParameter("txtdescription")!=null){
            description = request.getParameter("txtdescription");
        }
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
                }
            }

        }catch(Exception ex) {
            System.out.println(ex);
        }

        Product p = new Product();
        if(!image.equals("")){
            if(p.updateProduct(sku,name,price,quantity,description,image)){
                session.setAttribute("msgupdate","Successfully Updated");
                session.removeAttribute("list");
            }
            else{
                session.setAttribute("msgupdate","Failed!");
            }
        }
        else{
            if(p.updateProduct1(sku, name, price, quantity, description)){
                session.setAttribute("msgupdate","Successfully Updated");
                session.removeAttribute("list");
            }
            else{
                session.setAttribute("msgupdate","Failed!");
            }
        }
        response.sendRedirect("updateproduct.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
