<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       
    <%@ taglib uri="/struts-tags" prefix="s" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exito</title>
</head>
<body>
   <div align="center">
   <h2>EL proceso terminó exitosamente</h1>
   <h4>Código: <s:property value="objTra.cod" /> </h4>
   <h4>Nombre: <s:property value="objTra.nombte" /> </h4>
   <h4>Apellido: <s:property value="objTra.apellido" /> </h4>
   <h4>Edad: <s:property value="objTra.edad" /> </h4>
   <h4>Género: <s:property value="objTra.genero_cod" /> </h4>
   <h4>Departamento: <s:property value="objTra.departamento_cod" /> </h4>
   
     href = '<s:url action="inicio">Registro Nuevo</s:url>
     
   </div>
 
</body>
</html>