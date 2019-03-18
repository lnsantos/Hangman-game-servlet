package br.com.lucas.entidade;

public class Palavra {
	private Integer idPalavra;
	private String palavra;
	private String Descricao;
	
	public Palavra(Integer idPalavra, String palavra, String descricao) {
		this.idPalavra = idPalavra;
		this.palavra = palavra;
		this.Descricao = descricao;
	}
	
	public Palavra() {}
	
	public String getDescricao() {
		return Descricao;
	}
	public void setDescricao(String descricao) {
		Descricao = descricao;
	}
	public Integer getIdPalavra() {
		return idPalavra;
	}
	public void setIdPalavra(Integer idPalavra) {
		this.idPalavra = idPalavra;
	}
	public String getPalavra() {
		return palavra;
	}
	public void setPalavra(String palavra) {
		this.palavra = palavra;
	}
	
	

}
