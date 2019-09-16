<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row mt-2">
            <label class="col-sm-2 col-form-label"> User Name:<#if isRegisterForm><br><p style="color: #6c1e2e">(numbers, english letters, max - 20 symbols)</p> </#if></label>
            <div class="col-sm-6">
            <input required type="text" name="username" class="form-control mt-2" pattern="[0-9a-zA-Z]{1,20}" maxlength="20" size="20" placeholder="User name"/> </div></div>
        <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Password:<#if isRegisterForm><p style="color: #6c1e2e">(numbers, english letters, max - 8 symbols)</p> </#if> </label>
            <div class="col-sm-6">
                <input required type="password" name="password" class="form-control mt-2" pattern="[0-9a-zA-Z]{1,20}"maxlength="8" size="8" placeholder="Password"/></div></div>
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