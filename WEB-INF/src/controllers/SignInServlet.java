package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

import models.User;

@WebServlet("/signin.do")
public class SignInServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("signin.jsp").forward(request, response);    
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean flag1 = true, flag2 = true;

        Pattern emailPattern = Pattern.compile("\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}");
        Matcher emailMatcher = emailPattern.matcher(email);

        Pattern passwPattern = Pattern.compile("[A-Za-z0-9]{6,12}");
        Matcher passwMatcher = passwPattern.matcher(password);

        if(!emailMatcher.matches()) {
            request.setAttribute("email_error", "Enter Valid Email...");
            flag1 = false;
        }
        
        if(!passwMatcher.matches()) {
            request.setAttribute("passw_error", "Enter Valid Password...");
            flag2 = false;
        }

        String forwardPage = "signin.jsp";
        
        if(flag1 && flag2) {    
            User user = new User(email, password);
            if(user.signinUser()) {
                session.setAttribute("user", user);
                forwardPage = "dashboard.jsp";
            } else {
                request.setAttribute("signin_error", "Either email or password is incorrect..");
            }
        }

        request.getRequestDispatcher(forwardPage).forward(request, response);
    }
}
