<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.store.basic.UserStore" %>


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
    <h1>Users</h1>

    <%
    List<User> users =
      (List<User>) request.getAttribute("users");
      %>
      <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search users by name...">

  <table id="myTable">
    <tr class="header">
      <th style="width:60%;">User Name</th>
    </tr>
    <%
    for (User user : users) { %>
      <tr>
        <td><a href="/user/<%= user.getName() %>">
          <%=user.getName()%></a></td>
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
  var input, filter, table, tr, td, i;

  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>
</html>