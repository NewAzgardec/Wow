<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/user" method="post" class="myform">
        <div><h4 class="text-my-own-color">User Editing</h4></div>
        <div>
            <div class="form-row" style="display: inline-block">
                <input type="text" name="username" class="form-control mt-3"
                       value="${user.username}">
                <div class="rabs">
                    <input required type="radio" id="tab-1" name="radioname"
                           value="${roles[0]}" ${user.roles?seq_contains(roles[0])?string("checked", "")} >
                    <label for="tab-1">${roles[0]}</label>
                    <input required type="radio" id="tab-2" name="radioname"
                           value="${roles[1]}" ${user.roles?seq_contains(roles[1])?string("checked", "")}>
                    <label for="tab-2">${roles[1]}</label>
                </div>
            </div>
        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn mb-3 ml-3" style="background-color: #EEAEB1; border-color: #6c1e2e">Save
        </button>
        <div><a class="text-my-own-color ml-4" href="/main">home</a></div>
    </form>
</@c.page>