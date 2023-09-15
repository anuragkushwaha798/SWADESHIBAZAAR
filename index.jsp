<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:: Welcome ::</title>

    <link rel="stylesheet" href="static/css/common.css">
</head>
<body>
    <div id="main_page_body">
        <%@ include file="header.jsp" %> 
        
        <div id="menu"></div> 
        
        <div id="main_body">
            <a href="signin.do" class="btn">SignIn</a>
            <a href="signup.do" class="btn">SignUp</a>
        </div> 
        
        <%@ include file="footer.jsp" %> 
    </div>
</body>
</html>