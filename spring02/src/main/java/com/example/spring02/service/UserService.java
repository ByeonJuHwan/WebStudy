package com.example.spring02.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserInsertDto;
import com.example.spring02.dto.UserSearchDto;
import com.example.spring02.dto.UserUpdateDto;
import com.example.spring02.mapper.UserMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserMapper userMapper;
    
    
    public List<User> list() {
        return userMapper.selectAllUser();
    }


    public User findById(Integer id) {
        return userMapper.selectById(id);
    }
    
    public Integer updateUser(UserUpdateDto dto) {
        return userMapper.updateById(dto);
    }
    
    public Integer deleteUser(Integer id) {
        return userMapper.deleteUser(id);
    }
    
    public Integer insertUser(UserInsertDto dto) {
        return userMapper.insertUser(dto);
    }
    
    public List<User>search(UserSearchDto dto){
        dto.setKeyword("%"+dto.getKeyword().toLowerCase()+"%");
        return userMapper.searchUser(dto);
    }

}
