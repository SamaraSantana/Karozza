<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<link rel="icon" type="image/jpg" href="resources/icon.png" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista negra</title>
</head>
    </head>
    
<body>

<H3>Nova Lista negra</H3>
<form name="form1"  action="adicionaListaNegra" method="get">


        <label for="motivo">Motivo:</label>
        <input type="text" name="motivo" id="motivo" >


    
		<label class="cliente" for="cliente">Cliente:</label>
		<select class="cliente" name="cliente">
		<c:forEach items="${cliente}" var="cliente">
		<option value="${cliente.id}">${cliente.nome}</option>
		</c:forEach>
		</select>

<p>
<input type="submit" name="bt_gravar" id="bt_gravar" value="Adicionar">
</p> 

</form>

</body>
</html>