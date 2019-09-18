<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <@l.login "/registration" true/>
    <div class="text-my-own-color" style="text-align: center">
        ${message!}</div>
</@c.page>