<#import "parts/common.ftl" as c>

<@c.page>
    <a class="text-my-own-color ml-3" href="/">back</a><br>

<table class="table table-hover mt-3">
    <thead>
    <tr>
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
        <td><a class="text-my-own-color" href="/user/${user.id}">edit</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>