package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import models.Account;
import utilities.DBContext;

public class AccountDAO extends DBContext {

    public void AddAccount(Account account) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;

        String sqlCommand = "INSERT INTO [dbo].[accounts]\n"
                + "           ([account]\n"
                + "           ,[pass]\n"
                + "           ,[lastName]\n"
                + "           ,[firstName]\n"
                + "           ,[birthday]\n"
                + "           ,[gender]\n"
                + "           ,[phone]\n"
                + "           ,[isUse]\n"
                + "           ,[roleInSystem])\n"
                + "     VALUES\n"
                + "           (?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,?"
                + "           ,? "
                + "           ,?)";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sqlCommand);
            ps.setString(1, account.getAccount());
            ps.setString(2, account.getPass());
            ps.setString(3, account.getLastName());
            ps.setString(4, account.getFirstName());
            ps.setDate(5, java.sql.Date.valueOf(account.getBirthday()));
            ps.setBoolean(6, account.isGender());
            ps.setString(7, account.getPhone());
            ps.setBoolean(8, account.isIsUse());
            ps.setInt(9, account.getRoleInSystem());

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Errors occur in get user DAO: " + ex.getMessage());
        } finally {

        }

    }

    public Account checkLogin(String account, String password) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;
        Account acc = null;
        String sqlCommand = "SELECT * FROM accounts where account = ? and pass = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sqlCommand);
            ps.setString(1, account);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                acc = new Account(rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("lastName"),
                        rs.getString("firstName"),
                        rs.getDate("birthday").toLocalDate(),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("isUse"),
                        rs.getInt("roleInSystem"));
            }

        } catch (SQLException ex) {
            System.out.println("Errors occur in check login DAO: " + ex.getMessage());
        } finally {

        }
        return acc;
    }

    public void DeleteAccount(String account) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;

        String sqlCommand = " DELETE FROM accounts WHERE account = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sqlCommand);
            ps.setString(1, account);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Errors occur in delete account DAO: " + ex.getMessage());
        } finally {

        }
    }

    public void UpdateAccount(Account account) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;

        String sqlCommand = "Update [dbo].[accounts]\n"
                + "SET "
                + "           [pass]\n = ?"
                + "           ,[lastName] = ?\n"
                + "           ,[firstName] = ?\n"
                + "           ,[birthday] = ?\n"
                + "           ,[gender] = ?\n"
                + "           ,[phone] = ?\n"
                + "           ,[isUse] = ?\n"
                + "           ,[roleInSystem] = ? WHERE account = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sqlCommand);
            ps.setString(1, account.getPass());
            ps.setString(2, account.getLastName());
            ps.setString(3, account.getFirstName());
            ps.setDate(4, java.sql.Date.valueOf(account.getBirthday()));
            ps.setBoolean(5, account.isGender());
            ps.setString(6, account.getPhone());
            ps.setBoolean(7, account.isIsUse());
            ps.setInt(8, account.getRoleInSystem());
            ps.setString(9, account.getAccount());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Errors occur in update account DAO: " + ex.getMessage());
        } finally {

        }

    }

    public List<Account> GetUsers() {
        String query = "SELECT [account]\n"
                + "      ,[pass]\n"
                + "      ,[lastName]\n"
                + "      ,[firstName]\n"
                + "      ,[birthday]\n"
                + "      ,[gender]\n"
                + "      ,[phone]\n"
                + "      ,[isUse]\n"
                + "      ,[roleInSystem]\n"
                + "  FROM [dbo].[accounts]";
        List<Account> accouns = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Account acc = new Account(rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("lastName"),
                        rs.getString("firstName"),
                        rs.getDate("birthday").toLocalDate(),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("isUse"),
                        rs.getInt("roleInSystem"));
                accouns.add(acc);
            }
        } catch (SQLException ex) {

        }
        return accouns;
    }

    public Account GetByAccount(String account) {
        String query = "SELECT * FROM accounts WHERE account = ?";
        Account acc = null;
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, account);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                acc = new Account(rs.getString("account"),
                        rs.getString("pass"),
                        rs.getString("lastName"),
                        rs.getString("firstName"),
                        rs.getDate("birthday").toLocalDate(),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("isUse"),
                        rs.getInt("roleInSystem"));
            }
        } catch (SQLException ex) {

        }
        return acc;
    }
}
