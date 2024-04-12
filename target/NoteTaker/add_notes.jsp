<%--
  Created by IntelliJ IDEA.
  User: Shubham Sakhare
  Date: 01-03-2024
  Time: 01:08 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Notes</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
    <br>
    <h1>
        Please fill your note details
    </h1>
    <br>
<%--    add-form--%>
    <form action="SaveNoteServlet" method="post">

        <div class="form-group">
            <label for="title">Note Title</label>
            <input required name="title" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter here">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <label for="content">Note Content</label>
            <textarea
                    required
                    name="content"
                    id="content" placeholder="Enter your content here "
                    class="form-control"
                    style="height: 300px;"
            ></textarea>
        </div>
<%--        add button--%>
        <div class="container text-center">
            <button type="submit" class="btn btn-primary">Add </button>
        </div>
    </form>
</div>
</body>
</html>
