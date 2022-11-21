package com.example.spring03.domain;

import java.time.LocalDateTime;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Getter;

// 대부분의 테이블들은 데이터 생성/수정 시간을 컬럼으로 갖는 경우가 많음.
// 여러 테이블에서 공통으로 사용되는 시간(생성,수정) 컬럼들만 갖는 상위 클래스를 정의하고,
// 다른 엔터티 클래스들에서 상위 클래스를 상속받는 구조로 만들기 위함.
// 엔터티(데이터) 들이 생성/수정 이벤트가 발생됐을 때 자동으로 시간을 기록하기 위해서.
@MappedSuperclass // 다른 엔터티 클래스들의 상위 클래스.
@Getter
@EntityListeners(value = {AuditingEntityListener.class})
// -> 엔터티의 변화(생성, 수정)가 생기면 동작하는 객체.
// -> 엔터티가 생성/수정 되는 시간 정보를 테이블에 자동으로 기록(insert, update)하기 위해서.
// -> AuditingEntityListener를 활성화하기 위해서는 메인 클래스에서 설정이 필요.
public class BaseTimeEntity {
    // 엔터티 클래스에서 @MappedSuperclass로 설정된 클래스를 상속하면
    // 상위 클래스의 필드들도 하위 클래스의 테이블에 컬럼으로 작성됨.
    
    @CreatedDate
    // 엔터티 클래스의 필드 일므은 자바의 관습(camel 표기법)으로 작성
    // 테이블의 컬럼 이름은 데이터베이스의 관습(snake 표기법)으로 생성됨.
    private LocalDateTime createdTime;
    
    @LastModifiedDate
    private LocalDateTime modifiedTime;
}
