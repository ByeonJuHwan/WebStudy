package edu.web.jsp02.repository;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import edu.web.jsp02.domain.Post;

public class PostDaoTest {

    private static final Logger log = LoggerFactory.getLogger(PostDaoTest.class);
    
    private PostDao postDao  = PostDaoImpl.getInstance();
    
    @Test
    public void testSelect() {
        List<Post> list = postDao.select();
        for(Post p : list) {
            log.info(p.toString());
        }
    }
    
}
