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
  	<img style="width:100%; align-self: center;" src="images/bannerSecu.png" />
 
 

<s:form name="altaPetiForm" id="altaPetiForm" >
	<%@ include file="acceso.jsp"%>


<!-- INICIO CONTENIDO -->
	
	<div class="table-responsive-sm">
	  <table class="table" align="right" style="width: 30%">	    
	    <tr>
	       <td style="font-size: 11px;">Asesor(a): <s:property value="objUsuario.nomusuario" /> </td>
	    </tr>
	  </table>
	</div>


			
 <p >&nbsp;</p>
 <p >&nbsp;</p>
 <p >&nbsp;</p>
 <br/>  
    
		<!-- MENSAJES DE ERROR -->			 			
        <s:if test="hasActionMessages()">
		   <div style="background: #FBD5DB; width:90%; text-align: center; margin-left: 50px" >
		      <s:actionmessage />
		      <s:actionerror/>
	          <s:fielderror ></s:fielderror>
		   </div>
		</s:if>
	     <!-- FIN --> 

 <!--PERSISTIENDO LA LISTA DEL MENU     INICIO  -->

        <s:iterator value="modulosAUX" id="modulosAUX" status="stat">
            <s:hidden  name = "modulosAUX[%{#stat.index}].cvemodulo" id="cvemodulo"></s:hidden>
            <s:hidden  name = "modulosAUX[%{#stat.index}].nommodulo" id="nommodulo"></s:hidden>
            <s:hidden  name = "modulosAUX[%{#stat.index}].action" id="action"></s:hidden>
            <s:hidden  name = "modulosAUX[%{#stat.index}].nompadre" id="nompadre"></s:hidden>
            <s:hidden  name = "modulosAUX[%{#stat.index}].orden" id="orden"></s:hidden>
        </s:iterator>
        <s:iterator value="modulosAUXP" id="modulosAUXP" status="stat">                        
            <s:hidden  name = "modulosAUXP[%{#stat.index}].cvemodulo1" id="cvemodulo1"></s:hidden>
            <s:hidden  name = "modulosAUXP[%{#stat.index}].nommodulo1" id="nommodulo1"></s:hidden>
            <s:hidden  name = "modulosAUXP[%{#stat.index}].action1" id="action1"></s:hidden>
            <s:hidden  name = "modulosAUXP[%{#stat.index}].nompadre1" id="nompadre1"></s:hidden>
            <s:hidden  name = "modulosAUXP[%{#stat.index}].orden1" id="orden1"></s:hidden>
        </s:iterator>

<!-- FIN  -->
 <br><br>
 <div>
	<img alt="secundaria" style="width:100%; align-self: center;"  src="images/footSecu.png" >
    </div>
    
</s:form>
  
</body>
</html>