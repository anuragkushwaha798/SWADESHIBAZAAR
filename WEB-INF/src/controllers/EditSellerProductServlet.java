package controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.*;
import java.util.*;

import models.SellerProduct;
import models.User;
import models.Product;

@WebServlet("/edit.do")
public class EditSellerProductServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");
        
        String forwardPage = "signin.jsp";

        if(user != null) {
            Integer sellerProductId = Integer.parseInt(request.getParameter("seller_product_id"));
    
            SellerProduct sellerProduct = new SellerProduct(sellerProductId);
            sellerProduct.getProductDetail();
    
            request.setAttribute("seller_product", sellerProduct);

            ArrayList<Product> products = Product.collectAllProducts();
            request.setAttribute("products", products);

            forwardPage = "add_product.jsp";
        }

        request.getRequestDispatcher(forwardPage).forward(request, response);
    }
}