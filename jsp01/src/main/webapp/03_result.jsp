<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
    <% request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String name = request.getParameter("username");
    %>
    
    
    <h1><%=name %> 님 안녕하세요!!</h1>
    
    <%-- JSP 내장 객체 :
    JSP가 Java 파일로 변환될 때 _jspService 메서드 안에서 선언되는 변수들.
    JSP에서 별도의 변수 선언 없이 언제든지 사용할 수 있는 (메섣를 호출할 수 있는)객체들.
        o. request: HttpServletReqeust. 서블릿이 처리하는 요청에 대한 정보/기능을 갖고 있는 객체.
        o. response: HttpServletResponse. 서블릿이 응답을 만들 때 필요한 정보/기능을 갖고 있는 객체.
        o. pageContext: PageContext. JSP 페이지의 정ㅂ들을 갖는 객체.
        o. session: HttpSession. 세션 관리에 필요한 객체
        o. application: ServletContext. 서블릿의 정보들을 갖는 객체.
        o. config: ServletConfig. 서블릿 환경 설정 정보 객체.
        o. out: JspWriter. 동적으로 HTML을 작성하는 객체.
     --%>
</body>
</html>