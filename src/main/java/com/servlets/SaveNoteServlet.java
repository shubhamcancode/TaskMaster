package com.servlets;

import com.entities.Note;
import helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "SaveNoteServlet", value = "/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html");
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Note note = new Note(title, content, new Date());

            System.out.println(note.getId()+" : "+note.getTitle());

//            hibernate : save();
            Session session = FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();

            session.save(note);
            transaction.commit();
            PrintWriter out = response.getWriter();
            out.println("<h1 style='text-align:center;' >Note is addded successfully !!</h1>");
            out.println("<h1 style='text-align:center;' ><a href='all_notes.jsp'>View All Notes</a> </h1>");

//            closing session
            session.close();


        }catch (Exception e){
            e.printStackTrace();
        }

    }
}