/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import utilities.DBContext;
import models.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ProductDAO extends DBContext {

    public List<Product> findAll() {
        String query = "SELECT * FROM products";
        List<Product> products = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> findDiscounted() {
        String query = "SELECT * FROM products where discount > 0";
        List<Product> products = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> findUnDiscounted() {
        String query = "SELECT * FROM products where discount = 0";
        List<Product> products = new ArrayList<>();
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product findById(String productId) {
        String query = "SELECT * FROM products WHERE productId = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToProduct(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean create(Product product) {
        String sql = "INSERT INTO products (productId, productName, productImage, brief, postedDate, typeId, account, unit, price, discount) "
                + "VALUES (?, ?, ?, ?, GETDATE(), ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            String productId = generateProductId();
            System.out.println(productId);
            stmt.setString(1, productId);
            stmt.setString(2, product.getProductName());
            stmt.setString(3, product.getProductImage());
            stmt.setString(4, 'N'+product.getBrief());
            stmt.setInt(5, product.getTypeId());
            stmt.setString(6, product.getAccount());
            stmt.setString(7, product.getUnit());
            stmt.setInt(8, product.getPrice());
            stmt.setInt(9, product.getDiscount());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            String mess = e.getMessage();
            System.out.println(mess);
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteById(String productId) {
        String query = "DELETE FROM products WHERE productId = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, productId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateProduct(String productId, Product product) {
        String query = "UPDATE products SET productName = ?, productImage = ?, brief = ?, typeId = ?, unit = ?, price = ?, discount = ? WHERE productId = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getProductImage());
            ps.setString(3, product.getBrief());
            ps.setInt(4, product.getTypeId());
            ps.setString(5, product.getUnit());
            ps.setInt(6, product.getPrice());
            ps.setInt(7, product.getDiscount());
            ps.setString(8, productId);

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        return new Product(
                rs.getString("productId"),
                rs.getString("productName"),
                rs.getString("productImage"),
                rs.getString("brief"),
                rs.getTimestamp("postedDate").toLocalDateTime(),
                rs.getInt("typeId"),
                rs.getString("account"),
                rs.getString("unit"),
                rs.getInt("price"),
                rs.getInt("discount")
        );
    }

    private String generateProductId() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        String timestamp = LocalDateTime.now().format(formatter);
        String nanoPart = String.valueOf(System.nanoTime()).substring(8);
        String uniquePart = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 4);
        System.out.println(timestamp + " " + nanoPart + " " + uniquePart);
        return "P" + nanoPart.substring(4) + uniquePart;
    }

    public List<Product> findProductsByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE typeId = ?";
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> searchProductsByName(String keyword) {
        List<Product> productList = new ArrayList<>();

        String sql = "SELECT * FROM Products WHERE productName LIKE ?";

        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                productList.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public List<Product> getProductsByPriceRange(int minPrice, int maxPrice) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM products WHERE price BETWEEN ? AND ?";

        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setDouble(1, minPrice);
            stmt.setDouble(2, maxPrice);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                productList.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
}
