package edu.web.jsp02.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zaxxer.hikari.HikariDataSource;

import edu.web.jsp02.datasource.HikariDataSourceUtil;
import edu.web.jsp02.domain.User;
import lombok.Cleanup;
import oracle.jdbc.proxy.annotation.Pre;

public class UserDaoImpl implements UserDao {
    private static UserDaoImpl instance = null;

    private HikariDataSource ds;

    private UserDaoImpl() {
        ds = HikariDataSourceUtil.getInstance().getDataSource();
    }

    public static UserDaoImpl getInstance() {
        if (instance == null) {
            instance = new UserDaoImpl();
        }
        return instance;
    }

    private static final String SELECT_ALL = "select * from USERS";

    @Override
    public List<User> select() {
        List<User> list = new ArrayList<>();
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
            @Cleanup
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User entity = recordToEntity(rs);
                list.add(entity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    private User recordToEntity(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("ID");
        String userName = rs.getString("USERNAME");
        String password = rs.getString("PASSWORD");
        String email = rs.getString("EMAIL");
        Integer points = rs.getInt("POINTS");

        User entity = User.builder().id(id).userName(userName).password(password).email(email).points(points).build();
        return entity;
    }

    public static final String INSERT = "insert into USERS (USERNAME,PASSWORD,EMAIL)" + " values(?,?,?)";

    @Override
    public int insert(User entity) {
        int result = 0;
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(INSERT);
            stmt.setString(1, entity.getUserName());
            stmt.setString(2, entity.getPassword());
            stmt.setString(3, entity.getEmail());

            result = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static final String SQL_SELECT_BY_ID = "select * from USERS where ID =?";

    @Override
    public User select(Integer id) {
        User entity = null;

        try {
            @Cleanup
            Connection conn = ds.getConnection();
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setInt(1, id);
            @Cleanup
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                entity = recordToEntity(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return entity;
    }

    private static final String DELETE = "delete from USERS where ID =?";

    @Override
    public int delete(Integer id) {
        int result = 0;
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(DELETE);
            stmt.setInt(1, id);
            result = stmt.executeUpdate();
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public static final String UPDATE = "update USERS set USERNAME=?,PASSWORD=?, EMAIL = ? where ID = ?";
    @Override
    public int modify(User entity) {
        int result = 0;
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(UPDATE);
            stmt.setString(1, entity.getUserName());
            stmt.setString(2, entity.getPassword());
            stmt.setString(3, entity.getEmail());
            stmt.setInt(4, entity.getId());
            
            result = stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
