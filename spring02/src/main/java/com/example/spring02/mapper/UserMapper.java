package com.example.spring02.mapper;

import java.util.List;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserInsertDto;
import com.example.spring02.dto.UserSearchDto;
import com.example.spring02.dto.UserUpdateDto;

public interface UserMapper {

    
    List<User> selectAllUser();
    User selectById(Integer id);
    Integer updateById(UserUpdateDto dto);
    Integer deleteUser(Integer id);
    Integer insertUser(UserInsertDto dto);
    List<User> searchUser(UserSearchDto dto);
}
