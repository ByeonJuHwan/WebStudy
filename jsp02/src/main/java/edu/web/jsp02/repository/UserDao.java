package edu.web.jsp02.repository;

import java.util.List;

import edu.web.jsp02.domain.User;

public interface UserDao {
    public List<User> select();
    public int insert(User entity);
    public User select(Integer id);
    public int delete(Integer id);
    public int modify(User entity);
    public int signUp(User entity);
    public User selectByUsernameAndPassword(String userName, String password);
    
}
