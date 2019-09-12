<#assign
know = Session.SPRING_SECURITY_CONTEXT??
>
<#if know>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isLogged = true
    isAdmin = user.isAdmin()
    >
<#else>
    <#assign
    name = "no"
    userId = -1
    isLogged = false
    isAdmin = false
    >

</#if>