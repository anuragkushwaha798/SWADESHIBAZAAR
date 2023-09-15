<%@ page import="models.User" %>

<style>
    body {
        font-family: verdana;
        font-size: 20px;
        margin: 0px auto;
    }
    
    #header {
        margin: 0px auto;
        height: 80px;
        background-color: rgb(213, 235, 251);
        border: 1px solid rgb(160, 188, 206);
        position: relative;
        width: 90%;
        border-bottom-left-radius: 10px;;
        border-bottom-right-radius: 10px;;
    }

    #logo {
        position: absolute;
        left: 20px;
        top: 10px;
        width: 55px;
    }

    #compname {
        position: absolute;
        left: 90px;
        top: 15px;
        font-size: 28px;
        font-weight: bold;
        color: rgb(3, 115, 181);
    }

    .user_actions {        
        border: 1px solid rgb(6, 122, 205);
        color:rgb(3, 115, 181);
        text-decoration: none;
        border-top: none;
        padding: 8px 14px;
        border-bottom-left-radius: 7px;
        border-bottom-right-radius: 7px;
    }

    #control_box {
        position: absolute;
        right: 50px;
        top: 0px;
    }
</style>

<div id="header">
    <a href="index.jsp">
        <img src="static/images/twitter.png" alt="company logo" id="logo">   
    </a>
    
    <span id="compname">E-Cart</span>

    <% User user = (User)session.getAttribute("user"); %>

    <span id="control_box">
        <% if(user != null) { %>
            <a href="logout.do" class="user_actions">Logout</a>
        <% } else  { %>
            <a href="signin.do" class="user_actions">SignIn</a>
            <a href="signup.do" class="user_actions">SignUp</a>
        <% } %>
    </span>
</div>