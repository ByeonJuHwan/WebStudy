package com.example.spring03.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.spring03.domain.Post;
import com.example.spring03.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller // 스프링 컨트롤러 컴포넌트
public class HomeController {
    
    private final PostService postService;

    @GetMapping("/") // 요청 URL 매핑.
    public String home(Model model) {
        
        List<Post> list = postService.read();
        model.addAttribute("list", list);
        
        return "/post/list"; // View 이름 -> src/main/resources/templates/파일이름.html
    }
}
