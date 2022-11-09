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
public class order extends HttpServlet {
    
    String ad1;
   String fnm;
   String lnm;
   String oemail;
   String pho;
   String city;
   String zip;
   String pmode;
   String cmm;
   Connection con;
    PreparedStatement ps ,ps1,ps2;
     
      int[] pro_price = new int[20];
     int[] pro_id = new int[20];
     int[] pro_qty = new int[20];
     int p =0;
     String[] pnmm = new String[20];
     String[] pro_img = new String[20];
    

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");PrintWriter out = response.getWriter();
        
         RequestDispatcher rd=getServletContext().getRequestDispatcher("/home.jsp");
         
         HttpSession session = request.getSession(true);
             String name=session.getAttribute("name").toString();
            String uid=session.getAttribute("user_id").toString();
   
       
          String u_id=session.getAttribute("user_id").toString();
         
        fnm= request.getParameter("fname");
         lnm= request.getParameter("lname");
          oemail= request.getParameter("email");
            ad1= request.getParameter("add"); 
             zip= request.getParameter("zip");
              city= request.getParameter("city");
             cmm= request.getParameter("comment"); 
             pmode= request.getParameter("cod");
             pho =request.getParameter("pho");
             
               out.println(fnm  + lnm + oemail + ad1 + city + zip + cmm  + pho + pmode);
             
             try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
                ps = con.prepareStatement("insert into order_detail(user_id,u_name,umail,uad1,uphone,ucity,uzip,upmode,ucomm) values(?,?,?,?,?,?,?,?,?)");
                //ps.setString(1, "1");
                ps.setString(1, u_id);
                ps.setString(2, fnm + lnm);
                ps.setString(3, oemail);
                ps.setString(4, ad1);
                ps.setString(5, pho);
                ps.setString(6, city);
                ps.setString(7, zip);
                ps.setString(8, "COD");
                ps.setString(9, cmm);
                int ii = ps.executeUpdate();
                {
                    if(ii==1){
                        out.println(" add.  updated");
                    }   
                }
               
                ps.close();
                
                
                 Statement st=con.createStatement();              
                ResultSet rs1 =st.executeQuery("select *from cart where user_id='"+uid+"'");
                 while(rs1.next()){
                    
                  String p_id=rs1.getString("pro_id");
//                   out.println("into select whike "+ u_id +" "+ p_id );
//                       out.println(" value of p" +p);
                   pro_id[p] = Integer.parseInt(p_id);
                   
                   String pnm =rs1.getString("pro_name");
                   pnmm[p] = pnm;
                  // out.println(pnmm[p] + "  "+ pnm);
                
                   String p_qty=rs1.getString("pro_qty");
                   pro_qty[p] = Integer.parseInt(p_id);
                   
                   String p_price=rs1.getString("pro_price");
                   pro_price[p] = Integer.parseInt(p_price);
                   
                   String p_img=rs1.getString("pro_img");
                   pro_img[p]= p_img;
                   p=p+1;
                 }
                 rs1.close();
                 st.close();
                 
                   ps1 = con.prepareStatement("insert into orders (user_id,pro_id,order_qty,order_date,pro_name,pro_price ,pro_img,order_status,del_date) values(?,?,?,?,?,?,?,?,?)");
                
                 int tt=0;
                  if(tt<p){
                      
                 while(tt<p){
                ps1.setString(1, u_id);
                ps1.setInt(2, pro_id[tt]);
                ps1.setInt(3, pro_qty[tt]);
                ps1.setDate(4,new java.sql.Date(System.currentTimeMillis()));
                ps1.setString(5, pnmm[tt]);
                ps1.setInt(6, pro_price[tt]);
                ps1.setString(7, pro_img[tt]);
                ps1.setString(8, "Waiting for delivery");
                ps1.setDate(9, new java.sql.Date(System.currentTimeMillis()));
                ps1.addBatch();
                
                int[] ar = ps1.executeBatch();
                tt=tt+1;
                }
                } 
                 ps1.close();
                 
                 Statement st1=con.createStatement();              
                int j =st1.executeUpdate("delete from cart where user_id='"+uid+"'");
                
                      
                        out.println(" add.  updated");
                         String msg="Order Placed";
                         request.setAttribute("msg", msg);
                         rd.forward(request, response);
                       
             
       
                
                
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
