package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import models.SellerProduct;

import java.util.ArrayList;

@WebServlet("/show.do")
public class ShowProductsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        if(user != null) {
            ArrayList<SellerProduct> sellerProducts = SellerProduct.collectSellerProducts(user);

            request.setAttribute("seller_products", sellerProducts);

            request.getRequestDispatcher("show_products.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        }
    }
}
