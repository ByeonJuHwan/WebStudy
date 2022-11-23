package com.example.spring03.dto;

import com.example.spring03.domain.Post;

import lombok.Data;

@Data
public class PostUpdateDto {
    private Integer id;
    private String title;
    private String content;
    
    public Post toEntity() {
        return Post.builder()
                .title(title).content(content).id(id).build();
    }
}
