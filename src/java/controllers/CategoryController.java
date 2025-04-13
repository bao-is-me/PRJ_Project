package controllers;

import daos.AccountDAO;
import daos.CategoryDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import models.Account;

import models.Category;

public class CategoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list") || action.equals("")) {
            CategoryDAO dao = new CategoryDAO();
            List<Category> accs = dao.GetCategories();
            request.setAttribute("acc", accs);
            request.getRequestDispatcher("listCategory.jsp").forward(request, response);
        } else if (action.equals("add")) {
            request.getRequestDispatcher("addCategory.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO dao = new CategoryDAO();
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String memo = request.getParameter("memo");
            System.out.println(memo);
            dao.UpdateCategory(new Category(id, name, memo));
            List<Category> accs = dao.GetCategories();
            request.setAttribute("acc", accs);
            request.getRequestDispatcher("listCategory.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.DeleteCategory(id);
            List<Category> accs = dao.GetCategories();
            request.setAttribute("acc", accs);
            request.getRequestDispatcher("listCategory.jsp").forward(request, response);
        } else {
            try {
                String name = request.getParameter("name");
                String memo = request.getParameter("memo");
                dao.AddCategory(new Category(0, name, memo));
                request.setAttribute("message", "Add successfully");
            } catch (Exception ex) {
                request.setAttribute("message", "Add failed");
            }
            request.getRequestDispatcher("addCategory.jsp").forward(request, response);
        }
    }

}
