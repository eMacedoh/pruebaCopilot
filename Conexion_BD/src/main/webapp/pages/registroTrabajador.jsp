<!DOCTYPE html>
<html lang="es">
<head>
<title>vacante secundaria</title>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@page import="java.text.*, java.util.*"%>
<link rel="shortcut icon" href="images/edomex.png" />



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<!-- Font Awesome -->
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- alertas -->



    <script type="text/javascript">

        function guarda(accion){
        	
            document.altaPetiForm.action = accion;
            document.altaPetiForm.submit();
        }
       
      
        //PARA REGRESAR EN DONDE SE QUEDO...........
        window.onload = function() {
      	  var pos = window.name || 0;
    	  window.scrollTo(0, pos);
    	
    	 }
    	 window.onunload = function() {
    	  window.name = self.pageYOffset
    	    || (document.documentElement.scrollTop + document.body.scrollTop);
    	 }
        	
        	 $(function() {  
                 $('#numeroReg').datepicker({inline: true  });
                
          	});   	
    </script>

</head>
<body>
<img style="width:100%; align-self: center;"   src="images/bannerSecu.png" alt="UDAI"  />

  <s:form name="altaPetiForm" id="altaPetiForm" action="RegistroNuevo" >
   
   <%@ include file="acceso.jsp"%>
   
   <div  class="container "  style="line-height:normal">
      <div class="row"></div>
     <div class="table-responsive">	
     <table class="table" border="1" style="width: 50%; margin-left: 300px">
     <thead>
     
     <thead>
     <tbody>
     <tr><s:textfield label="Código"   name="cod1"  ></s:textfield></tr>
     <tr><s:textfield label="Nombre"  name="nombte1"  ></s:textfield></tr>
     <tr><s:textfield label="Apellidos" name="apellido1"></s:textfield></tr>
     <tr><s:textfield label="Edad" name="edad1"  ></s:textfield></tr>
     <tr><s:radio label="Género"  name="genero_cod1" list="#{'1':'Femenino', '2':'Masculino'}"></s:radio></tr>  
    <tr><s:select label="Departamento" name="departamento_cod1" list="#{'1':'Lima','2':'Ancash','3':'Tacna','4':'Arequia', '5':'Piura'}" headerKey="-1" headerValue="-Seleccionar-"></s:select></tr>
    </table>
    
    <s:submit value="Registro"></s:submit>
    <s:reset value="Borrar"></s:reset>
    
  
 <br><br>
 
  
<!-- FIN  -->
   
   </div>
			 
 </div>    <!--container  -->
       
   
  	<!-- MENSAJES DE ERROR -->			 			
        <s:if test="hasActionMessages()">
		   <div style="background: #FBD5DB; width:90%; text-align: center; margin-left: 50px" >
		      <s:actionmessage />
		      <s:actionerror/>
	          <s:fielderror ></s:fielderror>
		   </div>
		</s:if>
	     <!-- FIN -->
  </s:form>
  

	<img alt="secundaria" style="width:100%; align-self: center;"  src="images/footSecu.png" >

    
</body>
</html>