<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
     HttpSession session1 = request.getSession(false);
    RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminlogin.jsp");
    RequestDispatcher rd1 = getServletContext().getRequestDispatcher("/index.jsp");
    String rmsg;
    
    int adminlog=Integer.parseInt(request.getParameter("key1"));
   
    if(adminlog ==1){
         if (session1 != null && adminlog==1) {
        session1.removeAttribute("aname");
        session1.invalidate();
        rmsg = "You have successfully logged out";
        request.setAttribute("amsg", rmsg);
        rd.forward(request, response);
    }}else{
        int userlog=Integer.parseInt(request.getParameter("key1"));
         if (session1 != null && userlog==2) {
             session1.removeAttribute("uname");
             session1.removeAttribute("uemail");
             session1.invalidate();
             rmsg = "You have successfully logged out";
             request.setAttribute("umsg", rmsg);
             rd1.forward(request, response);
         }
        
        
    }
      
    
    
    
    
    

%>