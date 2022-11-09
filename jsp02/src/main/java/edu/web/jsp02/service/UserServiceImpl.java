package edu.web.jsp02.service;

import java.util.List;

import edu.web.jsp02.domain.User;
import edu.web.jsp02.dto.UserJoinDto;
import edu.web.jsp02.repository.UserDao;
import edu.web.jsp02.repository.UserDaoImpl;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserServiceImpl implements UserService {
    private UserDao userDao;
    
    private static UserServiceImpl instance;
    private UserServiceImpl() {
        userDao = UserDaoImpl.getInstance();
    }
    public static UserServiceImpl getInstance() {
        if(instance == null) {
            instance = new UserServiceImpl();
        }
        return instance;
    }
    @Override
    public List<User> read() {
        return userDao.select();
    }
    @Override
    public int create(UserJoinDto dto) {
        return userDao.insert(dto.toEntity());
    }
    @Override
    public User read(Integer id) {
        return userDao.select(id);
    }
    @Override
    public int delete(Integer id) {
        return userDao.delete(id);
    }
    @Override
    public int modify(UserJoinDto entity) {
        return userDao.modify(entity.toEntity());
    }
    
    
}
