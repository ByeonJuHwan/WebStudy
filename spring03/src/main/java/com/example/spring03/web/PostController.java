package com.example.spring03.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.spring03.domain.Post;
import com.example.spring03.dto.PostCreateDto;
import com.example.spring03.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {
    private final PostService postService;
    
    @GetMapping("/create")
    public void create() {
        log.info("create()");
    }
    
    @PostMapping("/create")
    public String create(PostCreateDto dto, RedirectAttributes attrs) {
        
        // 새 포스트 작성
        Post entity = postService.create(dto);
        
        // 성된 포스트의 번호(id)를 라다이렉트 되는 페이졸 전달.
        attrs.addFlashAttribute("createdId", entity.getId());
        return "redirect:/";
    }
    
    @GetMapping("/detail")
    public void detail() {
        
    }
}
