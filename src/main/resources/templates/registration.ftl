<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <h3 class="mb-3">Create new account</h3>
    <@l.login "/registration" true/>
    <div class="text-danger">
        ${message!}</div>
</@c.page>