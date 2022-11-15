package com.example.spring02.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.spring02.domain.Post;
import com.example.spring02.dto.PostCreateDto;
import com.example.spring02.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class PostController {
    
    private final PostService postService;
    
    
    @GetMapping("/post/create")
    public void createPost() {}
        
    
    
    @PostMapping("/post/create")
    public String createPost(PostCreateDto dto) {
        log.info("dto = {}", dto);
        Post post = dto.toEntity();
        
        int result = postService.createPost(post);
        log.info("result = {}", result);
        return "redirect:/post/list";
    }
    
    @GetMapping("/post/list")
    public String list(Model model) {
        log.info("list()");
        List<Post> list = postService.read();
        model.addAttribute("list", list);
        return "/post/list";
    }
    
    @GetMapping("/post/detail")
    public String detail(Integer id, Model model) {
        Post post = postService.read(id);
        model.addAttribute("post", post);
        return "/post/detail";
    }
    
    @GetMapping("/post/modify")
    public String modify(Integer id, Model model) {
        Post post = postService.read(id);
        model.addAttribute("post", post);
        return "/post/modify";
    }
    
    @PostMapping("/post/modify")
    public String modify(String title,String content,Integer id, Model model) {
        Post post = Post.builder().title(title).content(content).id(id).build();
        int result = postService.update(post);
        model.addAttribute("id", id);
        log.info("result = {}", result);
        return "redirect:/post/detail";
    }
    
    @PostMapping("/post/delete")
    public String delete(Integer id) {
        int result = postService.delete(id);
        log.info("result = {}", result);
        return "redirect:/post/list";
    }
}
