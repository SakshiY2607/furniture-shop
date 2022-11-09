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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class feedback extends HttpServlet {

    String name, email ,msgs, pho;
    int p=0;
    
     Connection con;
    PreparedStatement ps;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         HttpSession session = request.getSession(true);
          RequestDispatcher rd=getServletContext().getRequestDispatcher("/home.jsp");
        
        
        name= request.getParameter("fname");
        email= request.getParameter("email");
        pho= request.getParameter("phone");
        msgs= request.getParameter("message");
        String uid=session.getAttribute("user_id").toString();
        
        
   
        
        
         try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
               ps = con.prepareStatement("insert into feedback(user_id,fu_name, fu_email,fu_phone, fu_msg) values(?,?,?,?,?)");
                ps.setString(1, uid);
                ps.setString(2, name);
                ps.setString(3, email);
                ps.setString(4, pho);
                ps.setString(5, msgs);
                              
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
                String msg="Data not Added";
                  request.setAttribute("msg", msg);
                 // rd.forward(request, response);
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
