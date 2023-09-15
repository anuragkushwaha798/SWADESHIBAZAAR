package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;

import models.User;

@WebServlet("/my_pic.do")
public class MyPicServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        ServletContext context = getServletContext();

        System.out.println("/WEB-INF/uploads/"+user.getEmail()+"/"+user.getMyPic() + " ~~~~~~~!!!!!!!~~~~~");
        InputStream is = context.getResourceAsStream("/WEB-INF/uploads/"+user.getEmail()+"/"+user.getMyPic());
    
        OutputStream os = response.getOutputStream();

        int count = 0;
        byte[] arr = new byte[512];

        while((count = is.read(arr)) != -1) {
            os.write(arr);
        }

        os.flush();
        os.close();
    } 
}
