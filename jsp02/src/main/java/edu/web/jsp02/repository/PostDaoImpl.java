package edu.web.jsp02.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zaxxer.hikari.HikariDataSource;

import edu.web.jsp02.datasource.HikariDataSourceUtil;
import edu.web.jsp02.domain.Post;
import edu.web.jsp02.dto.PostUpdateDto;
import lombok.Cleanup;
import lombok.extern.slf4j.Slf4j;

// MVC 아키텍쳐에서 Controller의 계층들 중에서 DB 관련 작업을 수행하는 계층.
// Controller 계층 : Web layer(Servlet) - Service layer - Repository layer(DAO)
@Slf4j
public class PostDaoImpl implements PostDao {

    // Singleton
    private static PostDaoImpl instance = null;
    
    private HikariDataSource ds;
    
    private PostDaoImpl () {
        ds = HikariDataSourceUtil.getInstance().getDataSource();
    }
    
    public static PostDaoImpl getInstance() {
        if(instance == null) {
            instance = new PostDaoImpl();
        }
        return instance;
    }
    
    private Post recordToEntity(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("ID"); 
        String title = rs.getString("TITLE"); 
        String content = rs.getString("CONTENT");
        String author = rs.getString("AUTHOR");
        LocalDateTime createdTime = rs.getTimestamp("CREATED_TIME").toLocalDateTime();
        LocalDateTime modifiedTime = rs.getTimestamp("MODIFIED_TIME").toLocalDateTime();
        
        Post entity = Post.builder().
                id(id).
                title(title).
                content(content).
                author(author).
                createdTime(createdTime).
                modifiedTime(modifiedTime).
                build();
        return entity;
    }
    
    public static final String SQL_SELECT="select * from POSTS order by ID desc";
    
    @Override
    public List<Post> select() {
        log.info("select()");
        log.info("SQL: {}",SQL_SELECT);
        
        List<Post> list = new ArrayList<>();
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = ds.getConnection(); // Connection Poll(Data Source) 에서 Connection을 빌려옴.
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            while(rs.next()) { // select 결과에서 row 데이터가 있으면
                Post post = recordToEntity(rs);
                list.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
                stmt.close();
                conn.close(); // Data Source 에서 빌려온 Connection을 반환.
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return list;
    }

    public static final String SQL_INSERT = 
            "insert into POSTS (TITLE,CONTENT,AUTHOR,CREATED_TIME,MODIFIED_TIME)"
            + " values(?,?,?,sysdate,sysdate)";
    
    @Override
    public int insert(Post entity) {
        log.info("insert(entity = {})",entity);
        log.info(SQL_INSERT);

        int result = 0; // DB에 insert 성공하면 1, 실패하면 0
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        
        try {
            conn = ds.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, entity.getTitle());
            stmt.setString(2, entity.getContent());
            stmt.setString(3, entity.getAuthor());
            
            result = stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    
    public static final String SQL_SELECT_BY_ID="select * from POSTS where ID =?";
    @Override
    public Post selectById(Integer id) {
        log.info("selectById(id)");
        log.info("SQL: {}",SQL_SELECT_BY_ID);
        
        // 엔터티 : DB 테이블의 행에 저장된 데이터. 레코드.
        Post entity = null;
        
        try {
            @Cleanup // 리소스 사용이 끝난 후에 close() 메서드를 자동으로 호출.
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setInt(1, id);
            
            @Cleanup
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
               entity = recordToEntity(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return entity;
    }

    public static final String SQL_DELETE ="delete from POSTS where ID =?";
    @Override
    public int delete(Integer id) {
        int result = 0;
        log.info("delete(id)");
        log.info("SQL_DELETE: {}",SQL_DELETE);
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, id);
            
            result = stmt.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }
    
    public static final String SQL_UPDATE = "update POSTS set TITLE=?,CONTENT=?, MODIFIED_TIME = sysdate where ID = ?";

    @Override
    public int update(Post post) {
        int result = 0;
        log.info("update(post)");
        log.info("SQL_UPDATE: {}",SQL_UPDATE);
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_UPDATE);
            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getContent());
            stmt.setInt(3, post.getId());
            
            result = stmt.executeUpdate();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static final String SELECT_BY_TITLE ="select * from POSTS where lower(TITLE) like ? order by ID desc";
    public static final String SELECT_BY_CONTENT ="select * from POSTS where lower(CONTENT) like ? order by ID desc";
    public static final String SELECT_BY_TITLE_OR_CONTENT ="select * from POSTS "
            + "where lower(CONTENT) like ?  and lower(TITLE) like ? "
            + "order by ID desc";
    public static final String SELECT_BY_AUTHOR ="select * from POSTS where lower(AUTHOR) like ? order by ID desc";
    
    @Override
    public List<Post> selectByKeyword(String type, String keyword) {
        log.info("selectByKeyword(type={}, keyword={})", type, keyword);
        
        List<Post> list = new ArrayList<>();
        
        try {
            // 검색에 필요한 SQL 문장을 선택  -> SQL 실행 -> 결과 분석 -> List 생성
            @Cleanup
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = null;
            switch(type) {
            case "t": // 제목으로 검색
                stmt = conn.prepareStatement(SELECT_BY_TITLE);
                stmt.setString(1, "%" + keyword.toLowerCase() + "%");
                break;
            case "c": // 내용으로 검색
                stmt = conn.prepareStatement(SELECT_BY_CONTENT);
                stmt.setString(1, "%" + keyword.toLowerCase() + "%");
                break;
            case "tc": // 제목 + 내용 검색
                stmt = conn.prepareStatement(SELECT_BY_TITLE_OR_CONTENT);
                stmt.setString(1, "%" + keyword.toLowerCase() + "%");
                stmt.setString(2, "%" + keyword.toLowerCase() + "%");
                break;
            case "a": // 작성자 검색
                stmt = conn.prepareStatement(SELECT_BY_AUTHOR);
                stmt.setString(1, "%" + keyword.toLowerCase() + "%");
                break;
            }
            
            @Cleanup
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
                Post entity = recordToEntity(rs);
                list.add(entity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    

}
