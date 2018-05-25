<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Conversation" %>

<!DOCTYPE html>
<html>
<head>
  <title>Conversations</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <a href="/following">Following</a>
    <% } else{ %>
    <a href="/login">Login</a>
     <% } %>
    <% if(request.getSession().getAttribute("user") != null){ %>
            <a href="/user/<%= request.getSession().getAttribute("user") %>">Profile</a>
        <% } %>
    <a href="/register">Register</a>
    <a href="/about.jsp">About</a>
    <a href="/activityfeed">Activity Feed</a>
    <a href="/search">Search</a>
  </nav>

  <div id="container">
  

    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <% if(request.getSession().getAttribute("user") != null){ %>
      <h1>New Conversation</h1>
      <form action="/conversations" method="POST">
          <div class="form-group">
            <label class="form-control-label">Title:</label>
          <input type="text" name="conversationTitle">
        </div>

        <button type="submit">Create</button>
      </form>

      <hr/>
    <% } %>

    <h1>Conversations</h1>

    <%
    List<Conversation> conversations =
      (List<Conversation>) request.getAttribute("conversations");
      %>
      <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search Conversations by name...">

  <table id="myTable">
    <tr class="header">
      <th style="width:60%;">Conversation Name</th>
      <th style="width:40%;">Tags</th>
    </tr>
    <%
    for (Conversation conversation : conversations) { %>
      <tr>
        <td><a href="/chat/<%= conversation.getTitle() %>">
          <%=conversation.getTitle()%></a></td>
        <% if (!conversation.getTags().isEmpty()) {%>
        <td><%=conversation.getTags().get(0)%></td>
        <%}%>
      </tr>
    <%  
    }
    %>
  </table>
  <hr/>
  </div>

</body>
<script>
  function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i, secondColumn;

  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1){
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>

</html>
