package com.example.spring02.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserInsertDto;
import com.example.spring02.dto.UserSearchDto;
import com.example.spring02.dto.UserUpdateDto;
import com.example.spring02.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    
    @GetMapping("/list")
    public String userList(Model model) {
        List<User> list = new ArrayList<>();
        list = userService.list();
        model.addAttribute("list", list);
        return "/user/list";
    }
    
    @GetMapping("/detail")
    public String userDetail(Integer id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "/user/detail";
    }
    
    @GetMapping("/modify")
    public String userModify(Integer id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user",user);
        return "/user/modify";
    }
    
    @PostMapping("/modify")
    public String userModify(UserUpdateDto dto,Model model) {
        int result = userService.updateUser(dto);
        log.info("result = {}", result);
        model.addAttribute("id", dto.getId());
        return "redirect:/user/detail";
    }
    
    @PostMapping("/delete")
    public String userDelete(Integer id) {
        int result = userService.deleteUser(id);
        log.info("result = {}", result);
        return "redirect:/user/list";
    }
    
    @GetMapping("/join")
    public String insertUser() {
        return "/user/join";
    }
    
    
    @PostMapping("/join")
    public String insertUser(UserInsertDto dto) {
        int result = userService.insertUser(dto);
        log.info("result = {}", result);
        return "redirect:/user/list";
    }
    
    @GetMapping("/search")
    public String searchUser(UserSearchDto dto, Model model) {
        List<User>list = new ArrayList<>();
        list = userService.search(dto);
        model.addAttribute("list", list);
        return "/user/list";
    }
}
