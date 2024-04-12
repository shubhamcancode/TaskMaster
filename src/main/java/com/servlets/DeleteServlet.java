package com.servlets;

import com.entities.Note;
import helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteServlet", value = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
//            fetching note_id from url
            int noteID = Integer.parseInt(request.getParameter("note_id").trim());
//            performing delete operation
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();

            Note note = (Note)s.get(Note.class, noteID);
            s.delete(note);
            tx.commit();

            response.sendRedirect("all_notes.jsp");

            s.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}