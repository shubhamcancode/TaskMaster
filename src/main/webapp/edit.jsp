<%@ page import="org.hibernate.Session" %>
<%@ page import="helper.FactoryProvider" %>
<%@ page import="com.entities.Note" %><%--
  Created by IntelliJ IDEA.
  User: Shubham Sakhare
  Date: 02-03-2024
  Time: 10:40 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="all_js_css.jsp" %>

    <title>Update</title>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
    <h1>Edit your note</h1>
    <br>
</div>

<%
    int noteID = Integer.parseInt(request.getParameter("note_id").trim());
    Session s = FactoryProvider.getFactory().openSession();

    Note note = (Note)s.get(Note.class, noteID);
    s.close();
%>



<%--    Edit Notes  --%>
<form action="UpdateServlet" method="post">
<input value="<%= note.getId()%>" name="noteID" type="hidden">
    <div class="form-group">
        <label for="title">Note Title</label>
        <input required name="title" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter here" value="<%= note.getTitle()%>">
        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
        <label for="content">Note Content</label>
        <textarea
                required
                name="content"
                id="content" placeholder="Enter your content here "
                class="form-control"
                style="height: 300px;"><%= note.getContent()%></textarea>
    </div>
    <%--        add button--%>
    <div class="container text-center">
        <button type="submit" class="btn btn-success">Save Your Note </button>
    </div>
</form>


</body>
</html>
