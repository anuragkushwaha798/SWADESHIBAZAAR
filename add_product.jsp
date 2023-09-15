<%@ page import="java.util.ArrayList,models.Product,models.SellerProduct" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:: Add New Products ::</title>

    <link rel="stylesheet" href="static/css/common.css">
    <link rel="stylesheet" href="static/css/form1.css">
</head>
<body>
    <div id="main_page_body">
        <%@ include file="header.jsp" %> 
        
        <%@ include file="menu.jsp" %>
        
        <div id="main_body">
            <% 
                ArrayList<Product> products = (ArrayList<Product>)request.getAttribute("products"); 
                SellerProduct sellerProduct = (SellerProduct)request.getAttribute("seller_product");   
            %>

            <h1><%= sellerProduct!=null?"Update":"Add New" %> Product</h1>
            <form action="add.do" method="post">
                
                <input type="hidden" name="isupdate" value="<%= sellerProduct!=null?true:false %>">
                
                <% if(sellerProduct != null) { %>
                    <input type="hidden" name="seller_product_id" value="<%= sellerProduct.getSellerProductId() %>">
                <% } %>
                
                <div id="form_box">                    
                    <div>
                        <div class="label_box">
                            <label for="product">Choose Product :</label>
                        </div>
                        <div class="field_box">
                            <select name="product" class="field" required id="product">
                                <option value="0">Select</option>
                                <% for(Product product : products) { %>
                                    <% if(sellerProduct!=null && product.getProductId().equals(sellerProduct.getProduct().getProductId())) { %>
                                        <option selected value="<%= product.getProductId() %>"><%= product.getName() %></option>
                                    <% } else { %>
                                        <option value="<%= product.getProductId() %>"><%= product.getName() %></option>                                
                                    <% } %>
                                <% } %>
                            </select>                        
                            <br><small id="eml_err" class="err_msg">Enter valid email...</small>
                        </div>
                    </div>
                    <div>
                        <div class="label_box">
                            <label for="qt">Quantity :</label>
                        </div>
                        <div class="field_box">
                            <input type="number" class="field" value='<%= sellerProduct!=null?sellerProduct.getQuantity():"" %>' required name="quantity" id="qt">
                            <br><small id="pwd_err" class="err_msg">Enter valid password...</small>
                        </div>
                    </div>  
                    <div>
                        <div class="label_box">
                            <label for="prc">Price :</label>
                        </div>
                        <div class="field_box">
                            <input type="number" class="field" value='<%= sellerProduct!=null?sellerProduct.getPrice():"" %>' required name="price" id="prc">
                            <br><small id="pwd_err" class="err_msg">Enter valid password...</small>
                        </div>
                    </div>  
                    <div>
                        <input type="submit" id="btn" value='<%= sellerProduct!=null?"Update":"Add" %> Product'>
                    </div>                  
                </div>      
            </form> 
        </div> 
        
        <%@ include file="footer.jsp" %> 
    </div>
</body>
</html>