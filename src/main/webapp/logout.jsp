<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%
    //進行登出，並轉址到 index.jsp (20%)
    session.invalidate();
    response.sendRedirect("index.jsp");
    ///////////////////////////
%>
