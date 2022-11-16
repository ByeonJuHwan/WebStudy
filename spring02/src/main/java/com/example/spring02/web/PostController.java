package com.example.spring02.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring02.domain.Post;
import com.example.spring02.dto.PostCreateDto;
import com.example.spring02.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller // 스프링 컨테이너가 Bean으로 생성, 관리
@RequiredArgsConstructor
@RequestMapping("/post")
// -> 클래스에 @RequestMapping 애너테이션을 사용하면, 
// 그 클래스의 모든 메서드들의 매핑 주소는 @RequestMapping 에서 설정된 URL로 시작함.
public class PostController {
    
    private final PostService postService; // 생성자에 의한 의존성 주입
    
    
    @GetMapping("/create")
    public void createPost() {}
        
    
    
    @PostMapping("/create")
    public String createPost(PostCreateDto dto) {
        log.info("dto = {}", dto);
        int result = postService.createPost(dto.toEntity());
        log.info("result = {}", result);
        return "redirect:/post/list"; 
    }
    
    @GetMapping("/list")
    public void list(Model model) {
        log.info("list()");
        List<Post> list = postService.read();
        model.addAttribute("list", list);
        // /WEB-INF/views/post/list.jsp
    }
    
    @GetMapping("/detail")
    public void detail(Integer id, Model model) {
        Post post = postService.read(id);
        model.addAttribute("post", post);
    }
    
    @GetMapping("/modify")
    public String modify(Integer id, Model model) {
        Post post = postService.read(id);
        model.addAttribute("post", post);
        return "/post/modify";
    }
    
    @PostMapping("/modify")
    public String modify(String title,String content,Integer id, Model model) {
        Post post = Post.builder().title(title).content(content).id(id).build();
        int result = postService.update(post);
        model.addAttribute("id", id);
        log.info("result = {}", result);
        return "redirect:/post/detail";
    }
    
    @PostMapping("/delete")
    public String delete(Integer id) {
        int result = postService.delete(id);
        log.info("result = {}", result);
        return "redirect:/post/list";
    }
}
