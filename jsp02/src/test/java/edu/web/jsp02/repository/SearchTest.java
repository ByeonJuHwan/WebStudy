package edu.web.jsp02.repository;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import edu.web.jsp02.domain.Post;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SearchTest {
    
    private PostDao postDao = PostDaoImpl.getInstance();
    
    @Test
    public void test() {
        List<Post> list = new ArrayList<>();
        list = postDao.selectByKeyword("t", "DAO");
        for(Post p : list) {
            Assertions.assertTrue(p.getTitle().toLowerCase().contains("da"));
            // -> argument가 true이면 단위 테스트 성공, false이면 단위 테스트 실패.
            log.info("post = {}",p);
        }
        
        list = postDao.selectByKeyword("tc", "Update");
        for(Post p : list) {
            Assertions.assertTrue(
                    p.getTitle().toLowerCase().contains("up") || p.getTitle().toLowerCase().contains("up")
                );
            
            
        }
    }

}
