<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:: SignUp ::</title>

    <link rel="stylesheet" href="static/css/common.css">
    <link rel="stylesheet" href="static/css/form.css">
</head>
<body>
    <div id="main_page_body">
        <%@ include file="header.jsp" %> 
        
        <div id="menu"></div> 
        
        <div id="main_body">
            <%
                String unmErr = (String)request.getAttribute("unm_err");
                String emlErr = (String)request.getAttribute("eml_err");
                String pwdErr = (String)request.getAttribute("pwd_err");
            %>

            <% if(unmErr!=null || emlErr!=null || pwdErr!=null) { %>
                <div id="server_err_msg">

                    <% if(unmErr != null) { %>
                        <span><%= unmErr %></span><br>
                    <% } %>

                    <% if(emlErr != null) { %>
                        <span><%= emlErr %></span><br>
                    <% } %>
                    
                    <% if(pwdErr != null) { %>
                        <span><%= pwdErr %></span>
                    <% } %>
                </div>
            <% } %>

            <div id="err_box">
                <small class="err_msg" id="unm_err">Invalid User Name...</small><br>
                <small class="err_msg" id="eml_err">Invalid Email...</small><br>
                <small class="err_msg" id="pwd_err">Invalid Password...</small>
            </div>
            
            <form action="signup.do" method="post" enctype="multipart/form-data">
                <table id="form_box">
                    <tr>
                        <th>
                            <label for="unm">User Name :</label>
                        </th>
                        <td class="field_box">
                            <input type="text" id="unm" required name="user_name">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label for="eml">Email :</label>
                        </th>
                        <td class="field_box">
                            <input type="text" id="eml" name="email">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label for="pwd">Password :</label>
                        </th>
                        <td class="field_box">
                            <input type="password" required id="pwd" name="password">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label for="my_pic">My Pic :</label>
                        </th>
                        <td class="field_box">
                            <input type="file" required size="50" id="my_pic" name="my_pic">
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <label for="user_type">User Type :</label>
                        </th>
                        <td class="field_box">
                            General User: <input type="radio" checked name="user_type" value="1"><br>
                            Manager User: <input type="radio" name="user_type" value="2">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="btn_box">
                            <input type="submit" value="SignUp">
                        </td>
                    </tr>
                </table>
            </form>
        </div> 

        <%@ include file="footer.jsp" %> 
    </div>

    <script>
        const user_name = document.getElementById('unm');
        const email = document.querySelector('#eml');
        const password = document.getElementById('pwd');

        const unm_err = document.querySelector('#unm_err');
        const eml_err = document.querySelector('#eml_err');
        const pwd_err = document.querySelector('#pwd_err');

        const forms = document.forms;

        function validateForm() {
            let f1, f2, f3;
            
            f1 = f2 = f3 = true;
            
            let regexExpUserName = new RegExp('^[A-Za-z ]{2,10}$');
            let regexExpEmail = new RegExp(/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/);
            let regexExpPassw = new RegExp(/^[A-Za-z0-9]{6,12}$/);
        
            f1 = regexExpUserName.test(user_name.value);
            if(!f1)
                unm_err.style.display = 'inline';

            f2 = regexExpEmail.test(email.value);
            if(!f2)
                eml_err.style.display = 'inline';
            
                f3 = regexExpPassw.test(password.value);
            if(!f3)
                pwd_err.style.display = 'inline';
            
            if(!(f1 && f2 && f3)) 
                err_box.style.display = 'block';

            return f1 && f2 && f3;
        }

        //forms[0].onsubmit = validateForm;

        function fieldOnFocus() {
            err_box.style.display = 'none';
            unm_err.style.display = 'none';
            eml_err.style.display = 'none';
            pwd_err.style.display = 'none';
        }

        user_name.onfocus = email.onfocus = password.onfocus = fieldOnFocus; 
    </script>
</body>
</html>