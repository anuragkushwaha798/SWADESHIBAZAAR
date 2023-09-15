<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:: SignIn ::</title>

    <link rel="stylesheet" href="static/css/common.css">
    <link rel="stylesheet" href="static/css/form1.css">
</head>
<body>
    <div id="main_page_body">
        <%@ include file="header.jsp" %> 
        
        <div id="menu"></div> 
        
        <div id="main_body">
            <form action="signin.do" method="post">
                <%
                    String emailError = (String)request.getAttribute("email_error");
                    String passwError = (String)request.getAttribute("passw_error");
                    String signinError = (String)request.getAttribute("signin_error");
                %>
                
                <% if(emailError!=null || passwError!=null || signinError!=null) { %>
                    <div id="error_box">
                        <%= emailError!=null?emailError+"<br><br>":"" %>
                        <%= passwError!=null?passwError:"" %>
                        <%= signinError!=null?signinError:"" %>
                    </div>
                <% } %>

                <div id="form_box">                    
                    <div>
                        <div class="label_box">
                            <label for="eml">Email :</label>
                        </div>
                        <div class="field_box">
                            <input type="text" class="field" required name="email" id="eml">
                            <br><small id="eml_err" class="err_msg">Enter valid email...</small>
                        </div>
                    </div>
                    <div>
                        <div class="label_box">
                            <label for="pwd">Password :</label>
                        </div>
                        <div class="field_box">
                            <input type="password" class="field" required name="password" id="pwd">
                            <br><small id="pwd_err" class="err_msg">Enter valid password...</small>
                        </div>
                    </div>  
                    <div>
                        <input type="submit" id="btn" value="SignIn">
                    </div>                  
                </div>                
            </form>
        </div> 
        
        <%@ include file="footer.jsp" %> 
    </div>


    <script>
        // ----------------------------------------------------
        const emailField = document.querySelector('#eml');
        const passwordField = document.getElementById('pwd');

        const eml_err = document.querySelector('#eml_err');
        const pwd_err = document.querySelector('#pwd_err');

        let emailRegex = new RegExp(/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/);
        let passwRegex = new RegExp(/^[A-Za-z0-9]{6,12}$/);

        let f1 = true, f2 = true;

        const signInForm = document.forms[0];

        // -----------------------------------------------------


        function validateSignInForm() {
            if(!emailRegex.test(emailField.value)) {
                eml_err.style.display = 'inline';
                f1 = false;
            } 
            
            if(!passwRegex.test(passwordField.value)) {
                pwd_err.style.display = 'inline';
                f2 = false;
            }
            
            return f1 && f2;
        }
        
        function hideErrorMessage() {
            eml_err.style.display = 'none';
            pwd_err.style.display = 'none';            
        }

        signInForm.onsubmit = validateSignInForm;
        emailField.onfocus = passwordField.onfocus = hideErrorMessage;
    </script>
</body>
</html>