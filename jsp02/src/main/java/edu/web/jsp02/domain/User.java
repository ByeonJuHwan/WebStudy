package edu.web.jsp02.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@Builder
@NoArgsConstructor
public class User {
    private Integer id;
    private String userName;
    private String password;
    private String email;
    private Integer points;
}
