package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;
import java.util.List;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import models.User;
import models.UserType;

@WebServlet("/signup.do")
public class SignUpServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String forwardURL = "signup.jsp";

        if(ServletFileUpload.isMultipartContent(request)) {
            ServletContext context = getServletContext();

            try {
                List<FileItem> list = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                String uploadPath = context.getRealPath("/WEB-INF/uploads");

                User user = new User();

                for(FileItem item : list) {
                    if(item.isFormField()) {
                        String fieldName = item.getFieldName();

                        if(fieldName.equals("user_name")) {
                            user.setUserName(item.getString());
                        } else if(fieldName.equals("email")) {
                            user.setEmail(item.getString());                            
                        } else if(fieldName.equals("password")) {
                            user.setPassword(item.getString());
                        } else if(fieldName.equals("user_type")) {
                            user.setUserType(new UserType(Integer.parseInt(item.getString())));
                        } 
                    } else {    
                        File myFolderPath = new File(uploadPath, user.getEmail());
                        myFolderPath.mkdir();

                        String originalFileName = item.getName();
                        File file = new File(myFolderPath, originalFileName);
                        user.setMyPic(originalFileName);

                        try {
                            item.write(file); 
                        } catch(Exception e) {
                            e.printStackTrace();
                        }
                    }
                }

                if(user.signupUser()) {
                    forwardURL = "signin.jsp";
                }
            } catch(FileUploadException e) {
                e.printStackTrace();
            }
        }        
        
        request.getRequestDispatcher(forwardURL).forward(request, response);
    }   
}
// public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    
//     String userName = request.getParameter("user_name");
//     String email = request.getParameter("email");
//     String password = request.getParameter("password");
    
//     String forwardURL = "signup.jsp";
//     boolean f1, f2, f3;

//     f1 = f2 = f3 = true;

//     Pattern p1 = Pattern.compile("[A-Za-z ]{2,10}");
//     Matcher unmMatcher = p1.matcher(userName);
    
//     Pattern p2 = Pattern.compile("\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}");
//     Matcher emlMatcher = p2.matcher(email);
    
//     Pattern p3 = Pattern.compile("[A-Za-z0-9]{6,12}");
//     Matcher pwdMatcher = p3.matcher(password);

//     if(!unmMatcher.matches()) {
//         request.setAttribute("unm_err", "Please enter valid User Name...!");
//         f1 = false;
//     }
    
//     if(!emlMatcher.matches()) {
//         request.setAttribute("eml_err", "Please enter valid Email...!");
//         f2 = false;
//     }
    
//     if(!pwdMatcher.matches()) {
//         request.setAttribute("pwd_err", "Please enter valid Password...!");
//         f3 = false;
//     }
    
//     if(f1 && f2 && f3) {
//         User user  = new User(userName, email, password);
//         if(user.signupUser()) {
//             forwardURL = "signin.jsp";
//         }
//     } else {
//         System.out.println(f1);
//         System.out.println(f2);
//         System.out.println(f3);
//     }
    
//     // request.getRequestDispatcher(forwardURL).forward(request, response);
//     response.sendRedirect(forwardURL);
// } 