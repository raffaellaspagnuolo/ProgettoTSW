package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.KitAlberiDAO;

/**
 * Servlet per recuperare una foto
 */
@WebServlet("/GetFotoKit")
public class ServletGetFotoKit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletGetFotoKit() {
		super();

	}

	/**
	 * Metodo recupera la foto del kit dal database
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = (String) request.getParameter("idKit");
		if (id != null) {
			byte[] bt = KitAlberiDAO.load(id);

			
			ServletOutputStream out = response.getOutputStream();
			if (bt != null) {
				System.out.print(bt);
				out.write(bt);
				response.setContentType("image/jpeg");
			}
			out.close();
		}
	}

	/**
	 * Metodo Post che richiama il metodo doGet
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
