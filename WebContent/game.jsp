<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.lucas.JDBC.ConnectionDB"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.lucas.DAO.PalavraDAO"%>
<%@page import="br.com.lucas.entidade.Palavra"%>
<%@page import="br.com.lucas.DAO.JogadorDAO"%>
<%@page import="br.com.lucas.DAO.Util"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/css.css">
		<link rel="stylesheet" href="css/boneco.css">
		<link rel="stylesheet" href="css/game.css">
		<link rel="stylesheet" href="css/alertas.css">
		<title>Insert title here</title>
	</head>
<body>

<div class="boneco_esquerda">
	<h1>JOGO DA FORCA | 3°INF</h1>
		<img id="vida1" class="imgFrame" alt="" src="imgFrame/vida1.png">
		<img id="vida2" class="imgFrame" alt="" src="imgFrame/vida2.png">
		<img id="vida3" class="imgFrame" alt="" src="imgFrame/vida3.png">
		<img id="vida4" class="imgFrame" alt="" src="imgFrame/vida4.png">
		<img id="vida5" class="imgFrame" alt="" src="imgFrame/vida5.png">
		<img id="vida6" class="imgFrame" alt="" src="imgFrame/vida6.png">
</div>
<div class="paiRais">
	<div class="centro">
		<div class="tudo">
			<% 
				// Scanner s = new Scanner();
				// Scanner sc = new Scanner(System.in);
				String letraInserida;
				String RevelaLetra;
				// String vazia = " ";	
				// String descricao;
				PalavraDAO dao = new PalavraDAO();
				HashMap<Integer, Palavra> listaPalavras = dao.listaPalavra();
				
				int numLetras = 0;
				
			    JogadorDAO J = new JogadorDAO();
			    Random random = new Random(listaPalavras.size());
			    
			    Integer idPalavra = 0;
			    if(Util.palavrasJogadas.size() < listaPalavras.size() && listaPalavras.size() > 0) {
			    	do {
			    		idPalavra = random.nextInt(listaPalavras.size());
			    	} while(Util.palavrasJogadas.contains(idPalavra));
			    	Util.palavrasJogadas.add(idPalavra);
			    } else {
			    	String msg = "ADICIONE MAIS PALAVRAS";
					request.setAttribute("msg", msg);	
					RequestDispatcher rd = request.getRequestDispatcher("cadastrarPalavra.jsp");
					rd.forward(request, response);
			    }
			    
			    Palavra palavra = listaPalavras.get(idPalavra);
			    
			    %>
	    		<input type="hidden" value="<%=palavra.getPalavra() %>" id="palavraSecreta">
	    		<%
	    	// for(int i = 0; i < palavra.getPalavra.le)	
	    	int j = 0;
			for(char letra : palavra.getPalavra().toCharArray()) {
	    			
				if(letra == ' '){
			%>	
	    				<h1 class="escondida">&nbsp</h1>    	        
			<%
	    			}else{
			%>
					<h1 class="escondida" id="<%=j%>">_</h1>		
			<%			 
					j++;
	    			}
			}
			%>

		</div>
		<div class="tudo" id="divPlay">
			     <input class="input_jogadas" type="text" id="letrasJogadas" disabled>
	
			     <div style="display:none" id="divDica" class="dicas"><%=palavra.getDescricao() %></div>
	
			     <input requered class="input" type="text" id="letraEscolhida"> 
			     <br>
			     <input class="button" type="button" value="ARISCAR" id="ariscarLetra" name="ariscaLetra" onclick="validarLetra()">
			     <br>
				 <input class="button2" type="button" value="NOVA PALAVRA" id="inicioBtn" class="inicia" onclick="inicio()">
				 <br>
				 <input class="button2" type="button" value="DICA" id="inicioBtn" class="inicia" onclick="dica()">	     
		</div>
	</div>
</div>
	<br>	 
	<form action="VerificaID" method="post" id="formGerado" onsubmit="return gerarID">
		<input type="hidden" id="hidden_capturaID" name="gameID" value="">
	</form>
	<img disabled width="100px" height="100px" src="photoshop/vida_01" id="corpo">

<script src="script/js.js"></script>
</body>
</html>