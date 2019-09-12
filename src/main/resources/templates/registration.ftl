<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<h3 class="mb-3">Create new account</h3>
${message!}
<@l.login "/registration" true/>
</@c.page>