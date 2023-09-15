<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:: Seller Dashboard ::</title>

    <link rel="stylesheet" href="static/css/common.css">
    <link rel="stylesheet" href="static/css/form.css">
</head>
<body>
    <div id="main_page_body">
        <%@ include file="header.jsp" %> 
        
        <div id="menu"></div>
        
        <div id="main_body">
            <table border="0" width="100%">
                <tr>
                    <td width="30%">
                        <img src="my_pic.do" width="200">
                        <br><br>
                        <h2><%= user.getUserName() %></h2>
                    </td>
                    <td width="70%">
                        <h1>Seller DashBoard Page</h1>

                        <a href="show.do">Show My Products</a><br><br>
                        <a href="add.do">Add products</a> <br><br>

                        <% if(user.getUserType().getUserTypeId() == 2) { %>
                            <a href="imp_doc.do">Important Document</a>
                        <% } %>
                    </td>
                </tr>
            </table>            
        </div> 
        
        <%@ include file="footer.jsp" %> 
    </div>
</body>
</html>