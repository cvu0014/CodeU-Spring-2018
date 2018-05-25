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
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
  <title><%= conversation.getTitle() %> Tags</title>
  <link rel="stylesheet" href="/css/main.css" type="text/css">
</head>
<body onload="scrollChat()">

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

    <h1><%= conversation.getTitle() %> Tags
      <a href="" style="float: right">&#8635;</a></h1>

    <hr/>

    <div id="tags">
      <ul>
    <%
      for (String tag : conversation.getTags()) {
        
    %>
      <li><strong><%= tag %></strong></li>
    <%
      }
    %>
      </ul>
    </div>

    <hr/>

    <% if (request.getSession().getAttribute("user") != null) { %>
    <form action="/tag/<%= conversation.getTitle() %>" method="POST">
        <input type="text" name="tag">
        <br/>
        <button type="submit">Add a Tag</button>
    </form>
    <% } else { %>
      <p><a href="/login">Login</a> to send a message.</p>
    <% } %>

    <hr/>

  </div>

</body>
</html>