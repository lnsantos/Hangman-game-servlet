package br.com.lucas.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import br.com.lucas.JDBC.ConnectionDB;
import br.com.lucas.entidade.Palavra;


public class PalavraDAO {
	
	public boolean excluir(int idPalavra){
		String sql = "DELETE FROM palavra WHERE id = ?";
		Connection conexao = ConnectionDB.getConnection();
		try {
			PreparedStatement ps = conexao.prepareStatement(sql);
			ps.setInt(1, idPalavra);
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean inserirPalavra(Palavra palavra) {
		String sql = "insert into palavra(p_palavra,discicao) values (?,?)";
		Connection conexao = ConnectionDB.getConnection();
		
		try {
			PreparedStatement preparaSQL = conexao.prepareStatement(sql);
			preparaSQL.setString(1, palavra.getPalavra());
			preparaSQL.setString(2, palavra.getDescricao());
			if(preparaSQL.executeUpdate()==1) {
				System.out.println("PALAVRA ADICIONADA");
			}
			return true;
		} catch (SQLException e) {
				System.out.println("PROBLEMA AO ADICIONAR A PALAVRA");
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public HashMap<Integer, Palavra> listaPalavra(){
		HashMap<Integer, Palavra> list = new HashMap<>();
		
		int id = 0;
		
		//List<Palavra> list = new ArrayList<>();
		String sql = "SELECT * FROM palavra";
		Connection conexao = ConnectionDB.getConnection();
		
		try {
			PreparedStatement preparaSQL = conexao.prepareStatement(sql);
			ResultSet returnLista = preparaSQL.executeQuery();
			
			while(returnLista.next()) {
				Palavra p = new Palavra();
				p.setIdPalavra(returnLista.getInt("id"));
				p.setPalavra(returnLista.getString("p_palavra"));
				p.setDescricao(returnLista.getString("discicao"));
				list.put(id, p);
				id++;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
