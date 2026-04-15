<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <noscript>
        <p><a href="<%=request.getContextPath()%>/inventarioReactivos.action">Ir al inventario de reactivos</a></p>
     </noscript>
     <script type="text/javascript">
        window.location = "<%=request.getContextPath()%>/inicio.action"
     </script>
</body>
</html>