package edu.web.jsp02.dto;

import edu.web.jsp02.domain.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class UserSignUpDto {
    private String userName;
    private String password;
    private String email;
    
    // Dto를 Entity로 변환하는 메서드
    public User toEntity() {
        return User.builder()
                .userName(userName).password(password).email(email).build();
    }
}
