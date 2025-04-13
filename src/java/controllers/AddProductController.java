/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import daos.CategoryDAO;
import daos.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;
import models.*;

/**
 *
 * @author daoducdanh
 */
@WebServlet(name = "AddProductController", urlPatterns = {"/add-product"})
public class AddProductController extends HttpServlet {

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
        CategoryDAO dao = new CategoryDAO();
        List<Category> categorys = dao.GetCategories();
        request.setAttribute("categorys", categorys);
        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        

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
        String productName = request.getParameter("productName");
        String productImage = request.getParameter("productImage");
        String brief = request.getParameter("brief");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String unit = request.getParameter("unit");
        int price = Integer.parseInt(request.getParameter("price"));
        int discount = Integer.parseInt(request.getParameter("discount"));

        Product product = new Product();
        product.setProductName(productName);
        product.setProductImage(productImage);
        product.setBrief(brief);
        product.setTypeId(typeId);
        product.setUnit(unit);
        product.setPrice(price);
        product.setAccount("admin");
        product.setDiscount(discount);

        ProductDAO productDAO = new ProductDAO();
        productDAO.create(product);
        
        response.sendRedirect("/lab/product");

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
