<#include "common.ftl">
<#macro login path isRegisterForm>
<div class="container">
    <form action="${path}" method="post" class="myform">
        <#if isRegisterForm>
            <div><h4 style="text-align: center" class="text-my-own-color">Create new account!</h4></div></#if>
        <div class="col-sm-9" style="display: inline-block">
            <input required type="text" name="username" class="form-control mt-2" pattern="[0-9a-zA-Z]{1,20}"
                   maxlength="20" size="20" placeholder="User name"/></div>
        <#if isRegisterForm><br><p style="color: #6c1e2e">(numbers, english letters, max - 20 symbols)</p> </#if>
        <div class="col-sm-9 mt-2" style="display: inline-block">
            <input required type="password" id="password" name="password" class="form-control mt-2"
                  pattern="[0-9a-zA-Z]{1,20}"
                   maxlength="8" size="8" placeholder="Password"/>
            <label class="text-my-own-color" style="font-size: small" for="password" onclick="text(this)">show password</label></div>
        <#if isRegisterForm><p style="color: #6c1e2e">(numbers, english letters, max - 8 symbols)</p> </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div>
            <button class="btn mb-3 mt-3" style="background-color: #EEAEB1; border-color: #6c1e2e"
                    type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
            <br></div>
        <#if !isRegisterForm><a class="text-my-own-color" href="/registration">Add new user</a></#if>
    </form>
</div>
    <script type="text/javascript">
        function text(label){
            var input = document.getElementById(label.htmlFor);
            if(input.type === "password"){
                input.type = "text";
                label.innerHTML = "hide password";
            }else{
                input.type = "password";
                label.innerHTML = "show password";
            }
        }
    </script>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn " style="background-color: #EEAEB1" type="submit">Sign Out</button>
    </form>
</#macro>