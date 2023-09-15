package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import models.SellerProduct;

@WebServlet("/delete.do")
public class DeleteSellerProductServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        String forwardPage = "signin.jsp";

        if(user!=null) {
            Integer sellerProductId = Integer.parseInt(request.getParameter("seller_product_id"));

            SellerProduct.deleteSellerProduct(sellerProductId, user.getUserId());

            forwardPage = "show.do";
        }
        
        request.getRequestDispatcher(forwardPage).forward(request, response);    
    }
}
