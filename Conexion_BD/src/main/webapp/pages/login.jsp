<!DOCTYPE html>
<html lang="es">
<head>
<title>vacante secundaria</title>
<meta charset="UTF-8">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.*, java.util.*"%>
<link rel="shortcut icon" href="images/edomex.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.12/css/all.css"
	integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="/js/codigo.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
<!-- Font Awesome -->
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
	
<style type="text/css">
*{
  -ms-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
  margin: 0;
  padding: 0;
  border: 0;
}



// Start styles in form

.login{
  position: relative;
  top: 50%;
	width: 250px;
  display: table;
  margin: -150px auto 0 auto;
  background: #fff;
  border-radius: 4px;
}

.legend{
  position: static;
  
  margin-left: 400px;
  width: 40%;
  display: block;
  background: #941f06;
  padding: 15px;
  color: #fff;
  font-size: 20px;
  

}

.input{
  position: relative;
  width: 30%;
  margin: 15px auto;
  
  span{
    position: absolute; 
    display: block;
    color: darken(#EDEDED, 10%);
    left: 10px;
    top: 8px;
    font-size: 20px;
  }
  
  input{
    width: 100%;
    padding: 10px 5px 10px 40px;
    display: block;
    border: 1px solid #EDEDED;
    border-radius: 4px;
    transition: 0.2s ease-out;
    color: darken(#EDEDED, 30%);
    
    &:focus{
      padding: 10px 5px 10px 10px;
      outline: 0;
      border-color: #941f06;
    }
  }
}

.submit{
  width: 45px;
  height: 45px;
  display: block;
  margin: 0 auto -15px auto;
  background: #fff;
  border-radius: 100%;
  border: 1px solid #941f06;
  color: #941f06;
  font-size: 24px;
  cursor: pointer;
  box-shadow: 0px 0px 0px 7px #fff;
  transition: 0.2s ease-out;
  
  &:hover, &:focus{
    background: #941f06;
    color: #fff;
    outline: 0;
  }
}

.feedback{
  position: absolute;
  bottom: -70px;
  width: 100%;
  text-align: center;
  color: #fff;
  background: #2ecc71;
  padding: 10px 0;
  font-size: 12px;
  display: none;
  opacity: 0;
  
 
    
  }
}
</style>
	
	
</head>


<body>
<img style="width:100%; align-self: center;"   src="images/bannerSecu.png" alt="DTI"  />
 <span> &nbsp;</span>
<form class="login"  action="acccesoUser" method="post">
 
  <fieldset>
    
  	<legend class="legend"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ingrese datos</legend>
    
    <div class="input">
        <span><i class="fa fa-user"></i></span> 
    	<input type="text" id="idusuario" name="idusuario" placeholder="Usuario" required  />
    
    </div>
    
    <div class="input">
        
    	<input type="password" placeholder="Contraseña" id="idcontrasena" name="idcontrasena" required />
      <span><i class="fa fa-lock"></i></span>
    </div>
    
    <button type="submit" class="submit" ><i class="fa fa-long-arrow-right"></i></button>
    
  </fieldset>
  <br>
  <!-- MENSAJES DE ERROR -->			 			
        <s:if test="hasActionMessages()">
		   <div style="background: #FBD5DB; width:90%; text-align: center; margin-left: 50px" >
		      <s:actionmessage />
		      <s:actionerror/> 
	          <s:fielderror ></s:fielderror>
		   </div>
		</s:if>
  <!-- FIN --> 

   <br><br>
 <img style="width:100%; align-self: center;"  src="images/footSecu.png" alt="UDAI" align="center" />
</form>
</body>
</html>