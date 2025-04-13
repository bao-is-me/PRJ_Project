package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Category;
import utilities.DBContext;

public class CategoryDAO extends DBContext {

    public void AddCategory(Category cate) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;

        String sqlCommand = "INSERT INTO [dbo].[categories]\n"
                + "           ([categoryName]\n"
                + "           ,[memo])\n"
                + "     VALUES\n"
                + "           (?"
                + "           ,?)";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sqlCommand);
            ps.setString(1, cate.getCategoryName());
            ps.setString(2, cate.getMemo());

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Errors occur in get category DAO: " + ex.getMessage());
        } finally {

        }

    }

    public void UpdateCategory(Category cate) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;

        String sqlCommand = "UPDATE [dbo].[categories] SET categoryName = ?, memo = ? where typeId = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sqlCommand);
            ps.setString(1, cate.getCategoryName());
            ps.setString(2, cate.getMemo());
            ps.setInt(3, cate.getTypeId());

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Errors occur in update category DAO: " + ex.getMessage());
        } finally {

        }

    }

    public void DeleteCategory(int id) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection connection = null;

        String sqlCommand = "DELETE FROM [dbo].[categories] where typeId = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sqlCommand);
            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Errors occur in delete category DAO: " + ex.getMessage());
        } finally {

        }

    }

    public List<Category> GetCategories() {
        String query = "SELECT [typeId]\n"
                + "      ,[categoryName]\n"
                + "      ,[memo]\n"
                + "  FROM [dbo].[categories]";
        List<Category> categories = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
                categories.add(cate);
            }
        } catch (SQLException ex) {

        }
        return categories;
    }
}
