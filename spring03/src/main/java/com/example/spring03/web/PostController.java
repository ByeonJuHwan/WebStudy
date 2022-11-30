package com.example.spring03.web;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.spring03.domain.Post;
import com.example.spring03.dto.PostCreateDto;
import com.example.spring03.dto.PostUpdateDto;
import com.example.spring03.service.PostService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {
    private final PostService postService;
    
    @PreAuthorize("hasRole('USER')")
    @GetMapping("/create")
    public void create() {
        log.info("create()");
    }
    
    @PreAuthorize("hasRole('USER')")
    @PostMapping("/create")
    public String create(PostCreateDto dto, RedirectAttributes attrs) {
        
        // 새 포스트 작성
        Post entity = postService.create(dto);
        
        // 성된 포스트의 번호(id)를 라다이렉트 되는 페이졸 전달.
        attrs.addFlashAttribute("createdId", entity.getId());
        return "redirect:/";
    }
    
    @PreAuthorize("hasRole('USER')")
    @GetMapping({"/detail", "/modify"})
    // 컨트롤러 메서드가 2개 이상의 요청 주소를 처리할 때는 mapping에서 요청 주소를 배열로 설정.
    public void detail(Integer id, Model model) {
        log.info("detail={}", id);
        Post post = postService.read(id);
        model.addAttribute("post", post);
    }
    
    @PreAuthorize("hasRole('USER')")
    @PostMapping("/delete")
    public String delete(Integer id, RedirectAttributes attrs) {
        
        Integer postId = postService.delete(id);
        attrs.addFlashAttribute("deletedPostId", postId);
        
        return "redirect:/";
    }
    
    @PreAuthorize("hasRole('USER')")
    @PostMapping("/modify")
    public String modify(PostUpdateDto dto,RedirectAttributes attrs) {
        Integer id = postService.modify(dto);
        attrs.addAttribute("id", id);
        return "redirect:/post/detail";
    }
    
    @GetMapping("/search")
    public String search(String type, String keyword, Model model) {
        log.info("type = {} | keyword = {}", type,keyword);
        
        List<Post>list = postService.search(type, keyword);
        model.addAttribute("list", list);
        return "/post/list";
    }
}
