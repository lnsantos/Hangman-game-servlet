package br.com.lucas.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.lucas.JDBC.ConnectionDB;
import br.com.lucas.entidade.Jogador;
import br.com.lucas.entidade.Palavra;
import javafx.scene.control.ResizeFeaturesBase;

public class JogadorDAO {
	
	public void ariscaLetra(String letra) {
		
			Jogador JG = new Jogador();
			JG.setLetraEscolhida(letra);
			
			
	}
	
	public Palavra buscaPal(int idPal) {		
		String sql = "SELECT * FROM palavra WHERE id = ?";
		Connection conexao = ConnectionDB.getConnection();
		
		try {
			PreparedStatement ps = conexao.prepareStatement(sql);
			ps.setInt(1, idPal);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				Palavra p = new Palavra();
				p.setIdPalavra(rs.getInt("id"));
				p.setPalavra(rs.getString("p_palavra"));
				p.setDescricao(rs.getString("discicao"));
				
				return p;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return null;
	}
	
	public List<Palavra> listaPeloID(int id){
		List<Palavra> lista = new ArrayList<>();
		String sql = "SELECT * FROM palavra WHERE id = ?";
		
		Connection conexao = ConnectionDB.getConnection();
		
		try {
			PreparedStatement preparaSQL = conexao.prepareStatement(sql);
			ResultSet returnLista = preparaSQL.executeQuery();
			
			while(returnLista.next()) {
				Palavra p = new Palavra();
				p.setPalavra(returnLista.getString("p_palavra"));		
				lista.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;
	}
}
