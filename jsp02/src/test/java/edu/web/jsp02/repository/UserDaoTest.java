package edu.web.jsp02.repository;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import edu.web.jsp02.domain.User;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserDaoTest {

    private UserDao userDao = UserDaoImpl.getInstance();
    
    @Test
    public void 회원정보출력() {
        List<User> list = new ArrayList<>();
        list = userDao.select();
        Assertions.assertNotNull(list);
    }
    
    @Test
    public void 회원가입() {
        User entity = User.builder()
                .userName("변주환").password("123").email("test@naver.com").build();
        int result = userDao.insert(entity);
        Assertions.assertEquals(1, result);
        log.info("result = {}", result);
    }
    
    @Test
    public void 아이디로찾기() {
        User entity = userDao.select(1);
        Assertions.assertNotNull(entity);
        log.info("entity = {}" , entity);
    }
    @Test
    public void 회원탈퇴() {
        int result = userDao.delete(2);
        Assertions.assertEquals(1, result);
        log.info("result = {}", result);
    }
    
    @Test
    public void 회원수정() {
        User entity = User.builder()
                .userName("변주환").password("1234").email("test@naver.com").id(1).build();
        int result = userDao.modify(entity);
        Assertions.assertEquals(1, result);
        log.info("modify = {}",result);
    }
}
