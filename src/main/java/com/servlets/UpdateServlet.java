package com.servlets;

import com.entities.Note;
import helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int noteID = Integer.parseInt(request.getParameter("noteID").trim());

            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();

            Note note = (Note)s.get(Note.class, noteID);

            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());

            response.sendRedirect("all_notes.jsp");
            tx.commit();
            s.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}