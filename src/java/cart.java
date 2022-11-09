/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ashish
 */
public class cart extends HttpServlet {
    
    String qty;
     Connection con;
    PreparedStatement ps;
    String  pro_nm;
    String pro_img;
    String qtyyy="";
    int pro_p;

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         RequestDispatcher rd=getServletContext().getRequestDispatcher("/home.jsp");
        
            HttpSession session = request.getSession(true);
             String name=session.getAttribute("name").toString();
            String uid=session.getAttribute("user_id").toString();
        
         String pro_id=request.getParameter("proid");
         System.out.println("proo id" + pro_id);
         qtyyy =request.getParameter("quantity");
         
         
         
         
         try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select *from product where pro_id = '"+pro_id+"'");
                while (rs.next()) {
                pro_nm =rs.getString("pro_name");
                pro_p = rs.getInt("pro_price");
                pro_img = rs.getString("pro_img");
                out.println("db  "+ pro_nm);          
             }
                
                st.close();
                rs.close();
                
                
                ps = con.prepareStatement("insert into cart(user_id,pro_id,pro_name,pro_qty,pro_price,pro_img) values(?,?,?,?,?,?)");
                ps.setString(1, uid);
                ps.setString(2, pro_id);
                ps.setString(3, pro_nm);
                ps.setString(4, "1");
                ps.setInt(5, pro_p);
                ps.setString(6, pro_img);
                
                int i = ps.executeUpdate();
                if (i == 1) {
                   String msg="Data successfully Added";
                  request.setAttribute("msg", msg);
                  rd.forward(request, response);
                 // out.println("ADDED");
                }
                ps.close();
                
            }catch(Exception e)
            {
                out.println(e.getMessage());
            }
         
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
