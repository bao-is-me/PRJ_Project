package controllers;

import daos.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import models.Account;

public class AccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list") || action.equals("")) {
            AccountDAO dao = new AccountDAO();
            List<Account> accs = dao.GetUsers();
            request.setAttribute("acc", accs);
            request.getRequestDispatcher("listAccount.jsp").forward(request, response);
        } else if (action.equals("add")) {
            request.getRequestDispatcher("addAccount.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();

        String action = request.getParameter("action");
        if (action.equals("update")) {
            String accountq = request.getParameter("account");
            System.out.println(accountq);
            String password = request.getParameter("password");
            System.out.println(password);
            String lastName = request.getParameter("lastName");
            String firstName = request.getParameter("firstName");
            String phoneNumber = request.getParameter("phoneNumber");
            String birthDay = request.getParameter("birthDay");
            boolean gender = "male".equals(request.getParameter("gender"));
            System.out.println(request.getParameter("role"));
            String roleS = request.getParameter("role");
            int role = 0;
            if(roleS.equals("administrator")){
                role = 1;
            }
            boolean isActive = request.getParameter("isActive") != null;
            LocalDate birthDay2 = LocalDate.parse(birthDay, DateTimeFormatter.ISO_LOCAL_DATE);

            Account account = new Account(accountq, password, lastName, firstName, birthDay2, gender, phoneNumber, isActive, role);
            dao.UpdateAccount(account);
        } else if (action.equals("delete")) {
            String accountq = request.getParameter("account");
            dao.DeleteAccount(accountq);
        } else if (action.equals("deactive")) {
            String accountq = request.getParameter("account");
            Account findAccount = dao.GetByAccount(accountq);
            if (findAccount != null) {
                findAccount.setIsUse(!findAccount.isIsUse());
                dao.UpdateAccount(findAccount);
            }
        } else {
            String accountq = request.getParameter("account");
            String password = request.getParameter("password");
            String lastName = request.getParameter("lastName");
            String firstName = request.getParameter("firstName");
            String phoneNumber = request.getParameter("phoneNumber");
            String birthDay = request.getParameter("birthDay");
            boolean gender = "male".equals(request.getParameter("gender"));
            int role = request.getParameter("role") == "administrator" ? 1 : 0;
            boolean isActive = request.getParameter("isActive") != null;
            LocalDate birthDay2 = LocalDate.parse(birthDay, DateTimeFormatter.ISO_LOCAL_DATE);

            Account account = new Account(accountq, password, lastName, firstName, birthDay2, gender, phoneNumber, isActive, role);
            try {
                dao.AddAccount(account);
                request.setAttribute("message", "Add successfully");
            } catch (Exception ex) {
                request.setAttribute("message", "Add failed");
            }
        }
        List<Account> accs = dao.GetUsers();
        request.setAttribute("acc", accs);
        request.getRequestDispatcher("listAccount.jsp").forward(request, response);
    }

}
