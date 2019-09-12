<#import "parts/common.ftl" as c>

<@c.page>
    <h3 class="mb-3">User Editing</h3>

<form action="/user" method="post">
    <input type="text" name="username" class="form-control mt-3" value="${user.username}">
    <#list roles as role>
    <div>
        <label><input type="checkbox"  class="form-check-label mt-3" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
    </div>
</#list>
<input type="hidden" value="${user.id}" name="userId">
<input type="hidden" value="${_csrf.token}" name="_csrf">
<button type="submit" class="btn btn-outline-danger mb-3">Save</button>
</form>
    <a class="text-my-own-color ml-1" href="/">home</a>

</@c.page>