var palavraSecreta = document.getElementById("palavraSecreta").value;
var erros = 0;
var letrasJogadas = [];
var letraInserida; 
var acertos = 0;



function inicio(){
	location.reload();
	// alert("Entrou");
}
function PerdeuGanhou(){
	window.open('../FIRCA/game.jsp');
}

function dica(){
	var dicaJSP = document.getElementById("divDica").style.display="block";
	return true;
}
function validarLetra() {
	if(erros < 6) { 
		inputLetraInserida = document.getElementById("letraEscolhida"); 
		
		if(inputLetraInserida.value == " "){
			alert("Impossivel inserir vazio!");
		}else{
	
				 letraInserida = inputLetraInserida.value;
				inputLetraInserida.value = "";
			
				for(var i = 0; i < letrasJogadas.length; i++) {
					if(letraInserida == letrasJogadas[i]) {
						 alert("Letra já foi jogada");
						return;
					}
				}
			
				letrasJogadas[letrasJogadas.length] = letraInserida;
				document.getElementById("letrasJogadas").value += " - " + letraInserida;
				
				var acertou = false;	
			
				for(var i = 0; i < palavraSecreta.length; i++) {
						if(letraInserida.toUpperCase() == palavraSecreta[i].toUpperCase()) {
							document.getElementById(i).innerHTML = letraInserida;
							acertou = true;
						}			
				}
				
				if(!acertou) {
					erros++; 
			
					var id = document.getElementById("vida" + erros);
					id.style.display = "block";
					   // alert(p);	
					if(erros == 6){
						window.open('../FIRCA/Perdeu.html');	
					}
				} else {
					acertos++;
				}
				
				if(acertos == palavraSecreta.length) {
					window.open('../FIRCA/Ganhou.html');	
				}
							
		}
	} // else {
		//		window.open('http://localhost:8080/FIRCA/Ganhou.html');
	// }
}

function mostrarDica(id) {
	divDica = document.getElementById(id);
	if (divDica.style.display == "block") {
		divDica.style.display = "none";
	} else {
		divDica.style.display="block";
	}
}
	
	/* function gerarID(){
		var gerado,form_save;
		var save =  document.getElementById("hidden_capturaID");
		form_save = document.getElementById("formGerado");
		gerado = Math.floor((Math.random() * 30) + 1);
		save.value = gerado;
		form_save.submit();*/