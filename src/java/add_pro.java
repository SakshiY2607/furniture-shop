/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Scanner;
import javax.activation.MimetypesFileTypeMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


public class add_pro extends HttpServlet {

     String pname, pdetail,pcat,pprice,pqty;
    Connection con;
    PreparedStatement ps;
    String msg="";
    String ui, un, pw, ph;
    int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   String filePath = "C:/Users/Ashish/Documents/NetBeansProjects/Furniture/web/img/";
   String dbfilepath ="";
    File file ;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        PrintWriter out = response.getWriter();
        
        
        RequestDispatcher rd=getServletContext().getRequestDispatcher("/admin_home.jsp");
        
        pname=request.getParameter("pro_name");
        pdetail=request.getParameter("pro_detail");
        pcat=request.getParameter("pro_cat");
        pprice=request.getParameter("pro_price");
        pqty=request.getParameter("pro_qty");
        
        System.out.println("pcat"+pcat);
        
        
        //String contentType = request.getContentType();
        
        if (ServletFileUpload.isMultipartContent(request)){
 
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("c:\\temp"));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
        
         try {
             
             // Apache Commons-Fileupload library classes
           
            // parse request
            List items = upload.parseRequest((RequestContext) request);
            
             FileItem pro_cat = (FileItem) items.get(0);
            pcat = pro_cat.getString();
            
             FileItem pro_name = (FileItem) items.get(1);
            pname = pro_name.getString();

            FileItem pro_detail = (FileItem) items.get(2);
            pdetail = pro_detail.getString();
            
             FileItem pro_price = (FileItem) items.get(3);
            pprice = pro_price.getString();

            FileItem pro_qty = (FileItem) items.get(4);
            pqty = pro_qty.getString();
            
           // File chk = new File();
            
            
        filePath = "C:/Users/Ashish/Documents/NetBeansProjects/Furniture/web/img/" + pcat +"/";
        out.println("Uploaded Filename: " + filePath +" fileName "+ "<br>");
        dbfilepath = "img/"+ pcat +"/";
            

          
            // get uploaded file
            FileItem fi = (FileItem) items.get(5);
            String fileName = fi.getName();
             MimetypesFileTypeMap mime = new MimetypesFileTypeMap();
            String meme =mime.getContentType(fileName);
            file = new File( filePath + fileName ) ;
                fi.write( file ) ;
                out.println("Uploaded Filename: " + filePath + fileName + "<br>");
            
            
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
                ps = con.prepareStatement("insert into product(pro_name,pro_detail,pro_price,pro_qty,catgory_id,pro_img) values(?,?,?,?,?,?)");
                ps.setString(1, pname);
                ps.setString(2, pdetail);
                ps.setString(3, pprice);
                ps.setString(4, pqty);
                ps.setString(5, pcat);
                ps.setString(6, dbfilepath +fileName);
                int i = ps.executeUpdate();
                if (i == 1) {
                  msg="Data successfully Added";
                  request.setAttribute("prmsg", msg);
                  pcat = "";
                  rd.forward(request, response);
                }
                ps.close();
                
            
        }
    
        catch(Exception e)
            {
                out.println(e.getMessage());
            }
        }else{
            
             out.println("Error in accesssing file");
            
            
        }
        
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
        
       
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
