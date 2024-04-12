<%@ page import="org.hibernate.Session" %>
<%@ page import="helper.FactoryProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.entities.Note" %>
<%--
  Created by IntelliJ IDEA.
  User: Shubham Sakhare
  Date: 01-03-2024
  Time: 08:21 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="all_js_css.jsp" %>
    <title>All Notes : Note Taker</title>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
        <br>
        <h1 class="text-uppercase">All Notes</h1>

    <div class="row">
        <div class="col-12">
    <%
        Session session1 = FactoryProvider.getFactory().openSession();
        Query q = session1.createQuery("from Note ");
        List<Note> list = q.list();

        for (Note note : list){
    %>
            <div class="card mt-3">
                <img class="card-img-top m-4 mx-auto" style="max-width: 100px;" src="img/notepad.png" alt="Card image cap">
                <div class="card-body px-5">
                    <h5 class="card-title"><%= note.getTitle()%></h5>
                    <p class="card-text"><%= note.getContent()%></p>

                    <div class="container text-center mt-2">
                        <a href="DeleteServlet?note_id=<%= note.getId()%>" class="btn btn-danger">Delete</a>
                        <a href="edit.jsp?note_id=<%= note.getId()%>" class="btn btn-primary">Update</a>
                    </div>
                </div>
            </div>

    <%
        }
        session1.close();
    %>
        </div>
    </div>





</div>
</body>
</html>
