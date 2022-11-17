package com.example.spring02.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class UserSearchDto {
    private String type;
    private String keyword;
}
