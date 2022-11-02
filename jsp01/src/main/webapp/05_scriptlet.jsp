<%@page import="edu.web.jsp01.domain.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style>
    table{
        border: 1px solid gray;
    }
</style>
</head>
<body>
    
    <h1>JSP scriptlet을 사용한 테이블 작성</h1>
    <%-- 테이블을 작성하기 위한 Contact 더미 데이터 생성 --%>
    <%
    ArrayList<Contact> data = new ArrayList<>();
    for(int i=1; i<11; i++){
        String name = "이름 " + i;
        String phone = "전화번호 " + i;
        String email = "이메일 " + i;  
        Contact c = new Contact(name,phone,email);
        data.add(c);
    }
    %>
    
    <table>
        <caption><strong>연락처</strong></caption>
        <thead>
            <tr>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
            </tr>        
        </thead>
        <tbody>
        <%
        for(Contact c : data){
            out.print("<tr>");
            out.print("<td>"+c.getName()+"</td>");
            out.print("<td>"+c.getPhone()+"</td>");
            out.print("<td>"+c.getEmail()+"</td>");
            out.print("</tr>");
        }
        %>
        </tbody>
    </table>
    
    <br>
    <hr>
    <br>
    
    <table>
        <caption><strong>연락처</strong></caption>
        <thead>
            <tr>
                <th>이름</th>
                <th>전화번호</th>
                <th>이메일</th>
            </tr>        
        </thead>
        <tbody>
        <% for(Contact c : data){ %>
            <tr>
                <td><%=c.getName() %></td>
                <td><%=c.getPhone() %></td>
                <td><%=c.getEmail() %></td>
            </tr>
        <%} %>
        </tbody>
    </table>
</body>
</html>