<#import "parts/common.ftl" as c>
<#import "login.ftl" as l>
<#include "parts/security.ftl">

<@c.page>
    <a class="text-my-own-color ml-3" href="/main">back</a><br>

<table class="table table-hover mt-3">
    <thead>
    <tr style="background-color: #6c1e2e; color: white">
        <th style="width: 50%">Name</th>
        <th style="width: 30%">Role</th>
        <th style="width: 20%">Options</th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a class="text-my-own-color" href="/user/${user.id}">edit</a><#if user.username!=name> / <a class="text-my-own-color" href="/user/id/${user.id}">delete</a></#if></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>