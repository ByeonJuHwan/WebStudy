package com.example.spring03.repository;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.spring03.domain.Post;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest // 스프링 부트 컨텍스트 설정들을 이용한 단위테스트
@TestMethodOrder(value = MethodOrderer.OrderAnnotation.class)
// -> @Order 애너테이션을 사용해서 테스트 메서드의 실행 순서를 지정.
public class PostRepositoryTest {

    
    @Autowired
    private PostRepository postRepository;
    
    
    @Test
    @Order(1)
    public void tetsSave() {
        // JpaRepository의 save() 메서드:
        // (1) 엔터티가 테이블에 없는 경우, insert
        // (2) 엔터티가 테이블에 있는 경우(테이블에서 검색한 경우), update
        Post entity = Post.builder()
                .title("Spring JPA")
                .content("Java Persistence API")
                .author("admin")
                .build();
        log.info("save 전: {} | {} | {}", entity, entity.getCreatedTime(), entity.getModifiedTime());
        postRepository.save(entity); // insert 문장 실행
        log.info("save 후: {} | {} | {}", entity, entity.getCreatedTime(), entity.getModifiedTime());
    }
    
    
    @Test // 테스트 메서드
    @Order(2)
    public void testFindAll() {
        Assertions.assertNotNull(postRepository);
        
        // 데이터베이스 테이블 전체 검색: select * form POSTS
        // List<Post>list = postRepository.findAll();
        List<Post>list = postRepository.findByOrderByIdDesc();
        Assertions.assertTrue(list.size()>0);
        for(Post p : list) {
            log.info("{} | {} | {} ",p.toString(),p.getCreatedTime(), p.getModifiedTime());
        }
    }
    
}
