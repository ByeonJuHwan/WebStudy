package edu.web.jsp02.dto;

import edu.web.jsp02.domain.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class UserJoinDto {
    private Integer id;
    private String userName;
    private String password;
    private String email;
    
    public User toEntity() {
        return User.builder()
                .id(id)
                .userName(userName)
                .password(password)
                .email(email)
                .build();
    }
}
