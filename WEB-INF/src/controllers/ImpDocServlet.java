package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebServlet("/imp_doc.do")
public class ImpDocServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        if(user != null) {  //authentication
            if(user.getUserType().getUserTypeId()==2) {  //authorization
                InputStream is = getServletContext().getResourceAsStream("/WEB-INF/uploads/aaa.pdf");
                
                OutputStream os = response.getOutputStream();
    
                int count = 0;
                byte[] arr = new byte[256];
                
                while((count = is.read(arr)) != -1) {
                    os.write(arr);
                }
    
                os.close();
            } else {
                request.getRequestDispatcher("warning.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        }
    }
}
