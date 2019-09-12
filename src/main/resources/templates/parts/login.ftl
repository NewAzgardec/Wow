<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-6">
            <input type="text" name="username" class="form-control" placeholder="User name"/> </div></div>
        <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Password:  </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password"/></div></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-outline-danger mb-3" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button><br>
        <#if !isRegisterForm><a class="text-my-own-color" href="/registration">Add new user</a></#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn btn-danger" type="submit">Sign Out</button>
    </form>
</#macro>

<#--<#macro delete>-->
<#--    <form action="/delete/${message.id}" method="post">-->
<#--        <input type="hidden" name="_csrf" value="${_csrf.token}" />-->
<#--        <button class="btn btn btn-danger" type="submit">Delete</button>-->
<#--    </form>-->
<#--</#macro>-->