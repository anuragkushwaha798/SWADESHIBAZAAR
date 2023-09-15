package models;

import java.util.ArrayList;
import java.sql.*;

public class Product {
    private Integer productId;
    private String name;    

    public Product(Integer productId, String name) {
        this.productId = productId;
        this.name = name;
    }

    public Product(Integer productId) {
        this.productId = productId;
    }

    public static ArrayList<Product> collectAllProducts() {
        ArrayList<Product> products = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecartdb?user=root&password=1234");

            String query = "select * from products";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                products.add(new Product(rs.getInt(1), rs.getString(2)));
            }

            con.close();
        } catch(SQLException|ClassNotFoundException e) {
            e.printStackTrace();
        }

        return products;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
