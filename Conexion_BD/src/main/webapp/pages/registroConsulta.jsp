<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>consulta trabajador</title>
</head>
<body>
  <s:form action = "RegistroConsulta"> 
   <s:textfield label="Codigo" name="cod"  ></s:textfield>
    <s:textfield label="Nombres" name="nombte"  ></s:textfield>
    <s:textfield label="Apellidos" name="apellido"  ></s:textfield>
     <s:textfield label="Edad" name="edad"  ></s:textfield>
    <s:radio label="Género"  name="genero_cod" list="#{'1':'Femenino', '2':'Masculino'}"></s:radio>
    
    <s:select label="Departamento" name="departamento_cod" list="#{'1':'Lima','2':'Ancash','3':'Tacna','4':'Arequia', '5':'Piura'}" headerKey="-1" headerValue="-Seleccionar-"></s:select>
   
    <s:submit value="Registro"></s:submit>
    <s:reset value="Borrar"></s:reset>
    
  
  </s:form>
</body>
</html>