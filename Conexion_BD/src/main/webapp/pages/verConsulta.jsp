<html lang="es">
<head>
<link rel="shortcut icon" href="images/edomex.png" />
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib prefix="s" uri="/struts-tags"%>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.*, java.util.*"%>


 <!-- bootstrra -->
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- bootstapl -->	

<title>Visualizar  Documentacion</title>
</head>

<body>
 <s:form name="altaPetiForm" id="altaPetiForm"
		enctype="multipart/form-data">
  <h2>Consulta total: <s:property value="%{lisTrab.size()}" /></h2>

  
  <!-- inicio de la tabla -->
<s:if test="lisTrab.size()>0">

	 <div class="col-sm-12" align="center">
	
	<div class="row">
			<div class="col">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>No. de Código</th>
							<th>Nombre</th>
							<th>Apellido</th>
						    <th>Edad</th>
						    <th>Genero</th>
						     <th>Departamento</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="lisTrab" id="lisTrab" status="stat">
							              <tr>
											<td align="center"><s:property value="cod" /></td>
											<td align="left"><s:property value="nombte" /></td>
											<td align="left"><s:property value="apellido" /></td>
											<td align="left"><s:property value="edad" /></td>
											<td align="left"><s:property value="genero_cod" /></td>
											<td align="left"><s:property value="departamento_cod" /></td>
											
										</tr>	
										<!-- hidden -->
										<s:hidden name="lisTrab[%{#stat.index}].cod" 	id="cod"></s:hidden>
										<s:hidden name="lisTrab[%{#stat.index}].nombte" 	id="nombte"></s:hidden>
										<s:hidden name="lisTrab[%{#stat.index}].apellido" 	id="apellido"></s:hidden>
										<s:hidden name="lisTrab[%{#stat.index}].edad" 	id="edad"></s:hidden>
										<s:hidden name="lisTrab[%{#stat.index}].genero_cod" 	id="genero_cod"></s:hidden>
										<s:hidden name="lisTrab[%{#stat.index}].departamento_cod" 	id="departamento_cod"></s:hidden>
									
							      </s:iterator>
					</tbody>
				</table>
			</div>
	
    </div>
    </div>
</s:if>
<!-- fin de la tabla -->

  
  </s:form>
</body>
</html>