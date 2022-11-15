package com.example.spring02.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring02.domain.Post;
import com.example.spring02.mapper.PostMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // final 필드를 argument로 갖는 생성자를 만들어줌.
@Service 
// -> @Service + applicationContext.xml : 스프링 컨테이너에 서비스 컴포넌트로 등록.
// -> 필요한 곳에 Service 컴포넌트로 주입할 수 있음.
public class PostService {
    
    // 의존성 주입:
    // (1) 필드에 의한 의존성 주입: @Autowired
    // (2) 생성자에 의한 의존성 주입: final 필드 + RequiredArgs 생성자
    // 생성자에의한 의존성 주입
    private final PostMapper postMapper;
    

    public List<Post> read(){
        return postMapper.selectOrderByIdDesc();
    }


    public Post read(Integer id) {
        return postMapper.selectById(id);
    }


    public int update(Post post) {
        return postMapper.updateById(post);
    }


    public int delete(Integer id) {
        return postMapper.deleteById(id);
    }


    public int createPost(Post post) {
        return postMapper.insert(post);
    }
    
    
}
