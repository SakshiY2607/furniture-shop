

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class user extends HttpServlet {

    String lnm, lpswd;
      HttpSession session;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
                
         lnm = request.getParameter("email");
         lpswd = request.getParameter("password");

        
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db","root","sakshi");

       PreparedStatement ps = con.prepareStatement("Select *from user where email='"+lnm+"' and pass='"+lpswd+"'");
        

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String uname =rs.getString("name");
            String u_id =rs.getString("user_id");
            session=request.getSession(true);
            session.setAttribute("name", uname);
            session.setAttribute("user_id", u_id);
            session.setMaxInactiveInterval(60000);
            response.sendRedirect("home.jsp");
          
        } else {
              out.println("Invalid Email or password");
        }
//        ps.close();
//        con.close();

    } catch (Exception e) {
        out.println(e+"msg");
        e.printStackTrace();
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
