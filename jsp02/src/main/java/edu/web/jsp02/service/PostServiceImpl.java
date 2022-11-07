package edu.web.jsp02.service;

import java.util.List;

import edu.web.jsp02.domain.Post;
import edu.web.jsp02.dto.PostCreateDto;
import edu.web.jsp02.repository.PostDao;
import edu.web.jsp02.repository.PostDaoImpl;
import lombok.extern.slf4j.Slf4j;

// Request --> Controller --> Service --> Repository
// Service(Business) 계층을 담당하는 클래스
@Slf4j // Slf4j의 Logger 객체가 생성됨.
public class PostServiceImpl implements PostService {
    
    private PostDao postDao; // DB select, insert, update, delete 기능
    
    private static PostServiceImpl instance;
    private PostServiceImpl() {
        postDao = PostDaoImpl.getInstance();
    }
    public static PostServiceImpl getInstance() {
        if(instance == null) {
            instance = new PostServiceImpl();
        }
        return instance;
    }
    
    @Override
    public List<Post> read() {
        log.info("read()");
        return postDao.select();
    }

    @Override
    public int create(PostCreateDto dto) {
        log.info("create(dto={})", dto);
        return postDao.insert(dto.toEntity());
    }

}
