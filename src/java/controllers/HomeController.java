/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.CategoryDAO;
import daos.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;
import models.Product;

/**
 *
 * @author 12345
 */
public class HomeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String action = request.getParameter("action");
            System.out.println(action);
            if (action == null || action.isEmpty()) {
                url = "homepage.jsp";
            } else if (action.equals("Product List")) {
                ProductDAO productDAO = new ProductDAO();
                List<Product> products = productDAO.findAll();
                request.setAttribute("products", products);

                CategoryDAO categoryDAO = new CategoryDAO();
                List<Category> categories = categoryDAO.GetCategories();
                request.setAttribute("categories", categories);

                url = "productList.jsp";
            } else if (action.equals("getProductByCategory")) {
                ProductDAO productDAO = new ProductDAO();
                List<Product> products = productDAO.findAll();

                CategoryDAO categoryDAO = new CategoryDAO();
                List<Category> categories = categoryDAO.GetCategories();
                request.setAttribute("categories", categories);

                String categoryId = request.getParameter("categoryId");
                if (categoryId != null && !categoryId.isEmpty() && !categoryId.equals("all")) {
                    products = productDAO.findProductsByCategory(Integer.parseInt(categoryId));
                } else {
                    products = productDAO.findAll();
                }
                request.setAttribute("products", products);

                url = "productList.jsp";
            } else if ("searchProductByName".equals(action)) {
                String searchKeyword = request.getParameter("search");

                ProductDAO productDAO = new ProductDAO();
                List<Product> filteredProducts = productDAO.searchProductsByName(searchKeyword);

                CategoryDAO categoryDAO = new CategoryDAO();
                List<Category> categories = categoryDAO.GetCategories();
                request.setAttribute("categories", categories);

                request.setAttribute("products", filteredProducts);
                request.setAttribute("search", searchKeyword);
                url = "productList.jsp";
            } else if ("filterByPrice".equals(action)) {
                int minPrice = (request.getParameter("minPrice") != null && !request.getParameter("minPrice").isEmpty()) ? Integer.parseInt(request.getParameter("minPrice")) : 0;
                int maxPrice = (request.getParameter("maxPrice") != null && !request.getParameter("maxPrice").isEmpty()) ? Integer.parseInt(request.getParameter("maxPrice")) : 99999999;
                System.out.println(minPrice + " " + maxPrice);
                ProductDAO productDAO = new ProductDAO();
                List<Product> products = productDAO.getProductsByPriceRange(minPrice, maxPrice);

                CategoryDAO categoryDAO = new CategoryDAO();
                List<Category> categories = categoryDAO.GetCategories();
                request.setAttribute("categories", categories);
                request.setAttribute("products", products);
                url = "productList.jsp";
            } else if (action.equals("Discounted Product List")) {
                ProductDAO productDAO = new ProductDAO();
                List<Product> products = productDAO.findDiscounted();
                request.setAttribute("products", products);

                CategoryDAO categoryDAO = new CategoryDAO();
                List<Category> categories = categoryDAO.GetCategories();
                request.setAttribute("categories", categories);

                url = "productList.jsp";
            } else if (action.equals("Un_Discounted Product List")) {
                ProductDAO productDAO = new ProductDAO();
                List<Product> products = productDAO.findUnDiscounted();
                request.setAttribute("products", products);

                CategoryDAO categoryDAO = new CategoryDAO();
                List<Category> categories = categoryDAO.GetCategories();
                request.setAttribute("categories", categories);

                url = "productList.jsp";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
