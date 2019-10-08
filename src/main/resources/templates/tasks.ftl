<#import "parts/common.ftl" as c>

<@c.page>
   <div><h4 style="text-align: center; margin-bottom: 3%" class="text-my-own-color">Your assignments</h4></div>
   <table class="table table-hover">
      <thead>
      <tr style="background-color: #6c1e2e; color: white">
         <th style="width: 55%">Text</th>
         <th style="width: 15%">Tag</th>
         <th style="width: 15%">From</th>
         <th style="width: 15%">Status</th>
         <th style="width: 15%">Change</th>
      </tr>
      </thead>
      <tbody>
      <#list tasks as m>
         <tr>
            <td>${m.text}</td>
            <td>${m.tag}</td>
            <td>@${m.authorName}</td>
            <td>${m.status}</td>
            <td> <a class="text-my-own-color" href="/tasks/${m.id}">
                  change
               </a></td>

         </tr>
      <#else>
         <div class="text-my-own-color mb-2">There are no posts.</div>
      </#list>
      </tbody>
   </table>
</@c.page>