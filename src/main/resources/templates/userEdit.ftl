<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/user" method="post" class="myform">
        <div><h4 class="text-my-own-color">User Editing</h4></div>
        <div>
            <div class="form-row" style="display: inline-block">
                <input type="text" name="username" class="form-control mt-3"
                       value="${user.username}">



<#--                                <div class="rabs">-->
<#--                    <input required type="radio" id="tab-1" name="radioname"-->
<#--                           value="${roles[0]}" ${user.roles?seq_contains(roles[0])?string("checked", "")} >-->
<#--                    <label for="tab-1">${roles[0]}</label>-->
<#--                    <input required type="radio" id="tab-2" name="radioname"-->
<#--                           value="${roles[1]}" ${user.roles?seq_contains(roles[1])?string("checked", "")}>-->
<#--                    <label for="tab-2">${roles[1]}</label>-->
<#--                </div>-->









<#--3333-->



<#--                <div class="containerOuter">-->
<#--                    <div class="container">-->
<#--                        <input type="radio" class="hidden" id="input1" name="inputs" value="${roles[0]}" ${user.roles?seq_contains(roles[0])?string("checked", "")} >-->
<#--                        <label class="entry" for="input1"><div class="circle"></div><div class="entry-label">${roles[0]}</div></label>-->
<#--                        <input type="radio" class="hidden" id="input2" name="inputs" value="${roles[1]}" ${user.roles?seq_contains(roles[1])?string("checked", "")}>-->
<#--                        <label class="entry" for="input2"><div class="circle"></div><div class="entry-label">${roles[1]}</div></label>-->

<#--                        <div class="highlight"></div>-->
<#--                        <div class="overlay"></div>-->
<#--                    </div>-->
<#--                </div>-->








<#--                <div class="card">-->


<#--                    <ul>-->
<#--                        <li>-->
<#--                            <input type="radio" name="name" id="one" value="${roles[0]}" ${user.roles?seq_contains(roles[0])?string("checked", "")} />-->
<#--                            <label for="one">${roles[0]}</label>-->

<#--                            <div class="check"></div>-->
<#--                        </li>-->

<#--                        <li>-->
<#--                            <input type="radio" name="name" id="two" value="${roles[1]}" ${user.roles?seq_contains(roles[1])?string("checked", "")}/>-->
<#--                            <label for="two">${roles[1]}</label>-->

<#--                            <div class="check"></div>-->
<#--                        </li>-->
<#--                    </ul>-->
<#--                </div>-->






                                <div class="container">


                    <ul>
                        <li>
                            <input type="radio" id="f-option" name="selector" value="${roles[0]}" ${user.roles?seq_contains(roles[0])?string("checked", "")} >
                            <label for="f-option">${roles[0]}</label>

                            <div class="check"></div>
                        </li>

                        <li>
                            <input type="radio" id="s-option" name="selector" value="${roles[1]}" ${user.roles?seq_contains(roles[1])?string("checked", "")}>
                            <label for="s-option">${roles[1]}</label>

                            <div class="check"><div class="inside"></div></div>
                        </li>


                    </ul>
                </div>







            </div>
        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn mt-5" style="background-color: #EEAEB1; border-color: #6c1e2e; width: 40%">Save
        </button>
<#--        <div><a class="text-my-own-color ml-4" href="/main">-->
<#--                home</a></div>-->
    </form>
</@c.page>