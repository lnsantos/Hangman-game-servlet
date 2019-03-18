<%@page import="java.util.HashMap"%>
<%@page import="br.com.lucas.entidade.Palavra"%>
<%@page import="java.util.List"%>
<%@page import="br.com.lucas.DAO.PalavraDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/css.css">
	<title>ADD PALAVRA</title>
</head>
<body>
<div class="msgServlet">
<% 
		if(session.getAttribute("msg") != null) {
			out.println(session.getAttribute("msg"));
		}
%>
</div>
<div style="width: 100%;
					height: 50px;
					color: #fff;
					background-color: #000;
					text-align: center;
					font-size: 40px;"> <div ><a class="voltaPag" href="index.jsp">PÁGINA INICIAL</a></div></div>
					
	<div  style="width: 1060px;background-color: #b9b9b9;border: 5px solid black;padding: 10px;margin: 0 auto;">
	<form style="width: 960px;font-size: 32px;margin: 0 auto;" 
												action="AdicionaPalavra" method="get">
		<input style="border: 2px solid black;font-size: 30px" type="text" name="palavra" placeholder="Palavra">
		<input style="border: 2px solid black;font-size: 30px" type="text" name="descricao" placeholder="Dica">
		<input style="border: 2px solid black;font-size: 30px" type="submit" value="ADICIONA">   
	</form>
	<br>
		<br>
			<table style="width: 960px;font-size: 32px;margin: 0 auto;" class="tabela">
				<th style="border: 2px solid black"  style="font-size: 50px" > ID </th>
				<th style="border: 2px solid black"  style="font-size: 50px" > PALAVRA </th>
					<%
						PalavraDAO listP = new PalavraDAO();
						HashMap<Integer, Palavra> list = listP.listaPalavra();
						for(Palavra p : list.values() ){
					 %>
				<tr>
					<td  style="border: 2px solid black;font-size: 30px" ><%= p.getIdPalavra() %></td>
					<td  style="border: 2px solid black;font-size: 30px" ><%= p.getPalavra() %></td>
					<td><input class="ninja" type="button" value="DICA" onclick="mostrarDica(<%=p.getIdPalavra()%>)"></td>
					<td><input class="ninja" type="button" value="DELETE" ></td>			
				</tr>
				<tr style="border: 2px solid black;font-size: 30px">  
						<div  class="descricao" id="<%=p.getIdPalavra() %>" style="border: 2px solid black;font-size: 30px;display: none"> <%= p.getDescricao() %></div> 
				</tr>
					<% 
						 } 
					%>
			</table>
		</div>
		</div>
			<p> Volta para <a href="index.jsp">página inicial !</a></p>
</body>
<script type="text/javascript" src="script/js.js"></script>
</html>