package br.com.lucas.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.lucas.DAO.PalavraDAO;
import br.com.lucas.entidade.Palavra;

/**
 * Servlet implementation class AdicionaPalavra
 * @param <RequestDispatcher>
 */
@WebServlet("/AdicionaPalavra")
public class AdicionaPalavra extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdicionaPalavra() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Palavra p = new Palavra();
		p.setPalavra(request.getParameter("palavra"));
		p.setDescricao(request.getParameter("descricao"));
		
		String msg;
		PalavraDAO  pDAO = new PalavraDAO();
		if(pDAO.inserirPalavra(p)) {
			msg = "PALAVRA ADICIONADO COM SUCESSO";
			request.setAttribute("mensagem", msg);
			RequestDispatcher rd = request.getRequestDispatcher("cadastrarPalavra.jsp");
			rd.forward(request, response);
		}else {
			msg = "OCORREU ALGUM PROBLEMA";
			request.setAttribute("mensagem", msg);
			RequestDispatcher rd = request.getRequestDispatcher("cadastrarPalavra.jsp");
			rd.forward(request, response);
		}
		
		
		
		// RequestDispatcher rd = request.getRequestDispatcher("cadastrarPalavra.jsp");
		// rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
