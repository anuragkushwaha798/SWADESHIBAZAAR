<%@ page import="models.SellerProduct,java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:: Show Products ::</title>

    <link rel="stylesheet" href="static/css/common.css">
    <link rel="stylesheet" href="static/css/form.css">
    <link rel="stylesheet" href="static/css/report.css">
</head>
<body>
    <div id="main_page_body">
        <%@ include file="header.jsp" %> 
        
        <%@ include file="menu.jsp" %> 
        
        <div id="main_body">
            <h1>Seller Product Page</h1>

            <% ArrayList<SellerProduct> sellerProducts = (ArrayList<SellerProduct>)request.getAttribute("seller_products"); %>

                <table class="records_box">
                    <thead>
                        <tr>
                            <th>Id.</th>
                            <th>Product</th>
                            <th>User</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(SellerProduct sellerProduct : sellerProducts) { %>
                            <tr>
                                <td><%= sellerProduct.getSellerProductId() %></td>
                                <td><%= sellerProduct.getProduct().getName() %></td>
                                <td><%= sellerProduct.getUser().getUserName() %></td>
                                <td><%= sellerProduct.getQuantity() %></td>
                                <td><%= sellerProduct.getPrice() %></td>
                                <td>
                                    <a href="edit.do?seller_product_id=<%= sellerProduct.getSellerProductId() %>">
                                        <img src="static/images/edit.png" alt="">
                                    </a>
                                    <a href="delete.do?seller_product_id=<%= sellerProduct.getSellerProductId() %>">
                                        <img src="static/images/delete.png" alt="">
                                    </a>
                                    <a href="upload.do?seller_product_id=<%= sellerProduct.getSellerProductId() %>">
                                        <img src="static/images/upload.png" alt="">
                                    </a>
                                </td>
                            </tr>    
                        <% } %>
                    </tbody>
                </table>
        </div> 
        
        <%@ include file="footer.jsp" %> 
    </div>
</body>
</html>