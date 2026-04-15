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

<title>Vacantes de secundaria</title>
<style type="text/css">
#logo{
    position: absolute;
    right:10px;
    bottom: 10px;
}
body{
    margin: 0;
    padding: 0;
    font-size: 15px;
    font-family: "Lucida Grande", "Helvetica Nueue", Arial, sans-serif;
}
nav {
    background-color: #5b0909;
    border: 1px solid #5b0909;
    color: #fff;
    display: block;
    margin: 0;
    overflow: hidden;
}
nav ul{
    margin: 0;
    padding: 0;
    list-style: none;
}
nav ul li {
    margin: 0;
    display: inline-block;
    list-style-type: none;
    transition: all 0.2s;
}

nav > ul > li > a {
    color: #fdf6ef;  
    display: block;
    line-height: 2em;
    padding: 0.5em 2em;
    text-decoration: none;

}

nav li > ul{
    display : none;
    margin-top:1px;
    background-color: #fdf6ef;  

}

nav li > ul li{
    display: block;
}

nav  li > ul li a {
    color: #5b0909;
    display: block;
    line-height: 2em;
    padding: 0.5em 2em;
    text-decoration: none;
}

nav li:hover {
    background-color: #f2edd5;
}
nav li:hover > ul{
    position:absolute;
    display : block;
}
nav li > ul > li ul  {
    display: none;
    background-color: #888;
}
nav li > ul > li:hover > ul  {
    position:absolute;
    display : block;
    margin-left:100%;
    margin-top:-3em;
}

nav ul > li.sub{
    background: url(ic_keyboard_arrow_down_white_18dp.png) right center no-repeat;
}

nav ul > li.sub li.sub{
    background: url(ic_keyboard_arrow_right_white_18dp.png) right center no-repeat;
}

</style>


</head>




<body>
   <nav>

    <ul >

    <s:iterator value="modulosAUX" id="modulosAUX" status="stat">     
					<s:if test='nompadre=="S"'>				  
						  <li class="sub"> <a
						    href="#"><s:property value="nommodulo" />
						   </a> 
						   	<ul >
								<s:iterator value="modulosAUXP" id="modulosAUXP" status="stat">
									<s:if test='cvemodulo==nompadre1'>
								
									<li><a
											href="Javascript:guarda('<s:property value="action1"/>')">
											<s:property value="nommodulo1" />
										</a></li>                                  
									</s:if>	
								</s:iterator>
                            </ul>	
                            </li>					
					</s:if>
				</s:iterator>  
    </ul>
  </nav>
 </body>
</html>