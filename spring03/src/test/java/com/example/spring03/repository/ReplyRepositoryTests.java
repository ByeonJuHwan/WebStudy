package com.example.spring03.repository;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.spring03.domain.Post;
import com.example.spring03.domain.Reply;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class ReplyRepositoryTests {
    
    
    
    @Autowired
    private PostRepository postRepository;
    
    @Autowired
    private ReplyRepository replyRepository;
    
    @Test
    public void testFindAll() {
        Post post = postRepository.findById(1).get();
        Reply reply = Reply.builder()
                .post(post)
                .replyText("댓글 작성 테스트")
                .writer("admin")
                .build();
        
        log.info("save 전 : {} | {}", reply, reply.getCreatedTime());
        reply = replyRepository.save(reply);
        log.info("save 후 : {} | {}", reply, reply.getCreatedTime());
        
        List<Reply> list = replyRepository.findAll();
        log.info("# of list = {}", list.size());
        for(Reply r : list) {
            log.info(r.toString());
        }
    }
}
