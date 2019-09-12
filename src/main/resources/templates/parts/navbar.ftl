<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#6c1e2e">
    <#if !isLogged><a class="navbar-brand mb-2 mt-2" href="/login">WOW</a>
        <#else>
    <p class="navbar-brand  mb-2 mt-2">WOW</p>
    </#if>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Messages</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">Users</a>
            </li>
            </#if>
        </ul>
        <div class="navbar-text mr-3"><b>${name}</b></div>
        <#if isLogged><@l.logout/></#if>
    </div>
</nav>