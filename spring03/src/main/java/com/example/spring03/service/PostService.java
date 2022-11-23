package com.example.spring03.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.spring03.domain.Post;
import com.example.spring03.dto.PostCreateDto;
import com.example.spring03.dto.PostUpdateDto;
import com.example.spring03.repository.PostRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // final 필드를 초기화하는 생성자.
@Service // 스프링 컨텍스트에 Service 컴포넌트로 등록.
public class PostService {

    private final PostRepository postRepository; // 생성자에 의한 의존성 주입.
    
    @Transactional(readOnly = true) // 속도가 빨리짐 데이터베이스의 변경을 추적하지 않기 때문에
    public List<Post> read(){
        log.info("read()");
        return postRepository.findByOrderByIdDesc();
    }

    public Post create(PostCreateDto dto) {
        Post entity = postRepository.save(dto.toEntity());
        return entity;
    }
    
    @Transactional(readOnly = true)
    public Post read(Integer id) {
        return postRepository.findById(id).get();
    }

    public Integer delete(Integer id) {
       postRepository.deleteById(id);
        return id;
    }
    
    @Transactional // readOnly = false(기본값)
    public Integer modify(PostUpdateDto dto) {
        
        // 메서드에 @Transactional 애너테이션을 사용하고, 
        // (1) 수정하기 전의 엔터티 객체를 검색한 후에
        // (2) 검색된 엔터티 객체를 수정하면
        // 메서드가 종료될 때 데이터베이스 테이블에 자동으로 update SQL이 실행됨.
        // PostRepository의 save() 메서드를 명시적으ㅗㄹ 호출하지 않아도됨.
        Post entity = postRepository.findById(dto.getId()).get(); // (1)
        entity.update(dto.getTitle(), dto.getContent()); // (2)
        
        return entity.getId();
    }

    public List<Post> search(String type, String keyword) {
        List<Post> list = new ArrayList<>();
        switch(type) {
        case "t": // 제목 검색
            list = postRepository.findByTitleIgnoreCaseContainingOrderByIdDesc(keyword);
            break;
        case "c": // 내용 검색
            list = postRepository.findByContentIgnoreCaseContainingOrderByIdDesc(keyword);
            break;
        case "tc": // 제목 + 내용 검색
            list = postRepository.searchByKeyword(keyword);
            break;
        case "a": // 작성자만 검색
            list = postRepository.findByAuthorIgnoreCaseContainingOrderByIdDesc(keyword);
            break;
        }
        
        return list;
    }
    

}
