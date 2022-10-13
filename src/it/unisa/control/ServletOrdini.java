package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.beans.Albero;
import it.unisa.beans.Indirizzo;
import it.unisa.beans.Utente;
import it.unisa.beans.Ordine;
import it.unisa.beans.ProdottoCarrello;
import it.unisa.beans.ProdottoOrdine;
import it.unisa.model.AlberoDAO;
import it.unisa.model.Carrello;

import it.unisa.model.IndirizzoDAO;
import it.unisa.model.OrdineDAO;

/**
 * Servlet implementation class Ordine
 */
@WebServlet("/Ordini")
public class ServletOrdini extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletOrdini() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		var action = request.getParameter("action");

		Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
		String redirectPage = "/pages/checkout.jsp";
		if (action != null) {

			if (action.equals("checkout")) {
				if (carrello == null || ((Carrello) carrello).getQuantitàTotaleProdotti() <= 0) {
					response.sendError(500);
					return;
				}
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher(redirectPage);
			dispatcher.forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action != null) {
			if (action.equals("compra")) {
				if (request.getParameter("preferredAddress") != null)
					salvaIndirizzo(request, response);
				compra(request, response);
				return;
			}
		}
	}

	private void salvaIndirizzo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Utente utente = (Utente) (request.getSession().getAttribute("utente"));
		Indirizzo indirizzo = new Indirizzo();
		IndirizzoDAO model = new IndirizzoDAO();

		indirizzo.setNome(request.getParameter("nome"));
		indirizzo.setCognome(request.getParameter("cognome"));
		indirizzo.setCAP(request.getParameter("cap"));
		indirizzo.setCittà(request.getParameter("citta"));
		indirizzo.setVia(request.getParameter("via"));
		indirizzo.setProvincia(request.getParameter("provincia"));
		indirizzo.setUid(utente.getId());
		indirizzo.setCivico(request.getParameter("civico"));
		indirizzo.setPreferred(true);

		try {
			model.doSave(indirizzo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.getSession().setAttribute("indirizzo", indirizzo);
	}

	private void compra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
		Utente utente = (Utente) (request.getSession().getAttribute("utente"));

		if (carrello == null) {
			response.sendError(500);
			return;
		}

		Ordine ordine = new Ordine();
		double totaleOrdine = carrello.getPrezzoTotaleProdotti();

		ordine.setTotalePagato(totaleOrdine);
		ordine.setTotaleProdotti(carrello.getQuantitàTotaleProdotti());
		ordine.setUtente(utente);

		if (request.getParameter("regalo") != null) {
			ordine.setRegalo(true);
			ordine.setMessaggioRegalo(request.getParameter("messaggioRegalo"));
			ordine.setDestinatarioRegalo(request.getParameter("mailRegalo"));
		} else {
			ordine.setRegalo(false);
			ordine.setMessaggioRegalo("");
			ordine.setDestinatarioRegalo("");
		}

		for (ProdottoCarrello prod : carrello.getProdotti()) {
			ProdottoOrdine bean = new ProdottoOrdine();
			bean.setDescrizione(prod.getProdotto().getDescrizione());
			bean.setSaldo(prod.getProdotto().getSaldo());
			bean.setNome(prod.getProdotto().getNome());
			bean.setPrezzo(prod.getProdotto().getPrezzo());
			bean.setQuantità(prod.getQuantità());
			bean.setBreveDescrizione("Paese:" + prod.getProdotto().getPaeseDiOrigine() + ", Categorie:"
					+ prod.getProdotto().getCategorie().size());
			bean.setTasse(prod.getProdotto().getTasse());
			bean.setStato("seme");

			Albero a = prod.getProdotto();
			a.setQuantità(a.getQuantità() - prod.getQuantità());
			if (a.getQuantità() == 0)
				a.setDisponibile(false);

			AlberoDAO dao1 = new AlberoDAO();
			try {
				dao1.updateQuantità(a);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			ordine.aggiungiPrdotto(bean);
		}

		OrdineDAO dao = new OrdineDAO();

		try {
			dao.doSave(ordine);

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(500);
			return;
		}
		request.getSession().setAttribute("carrello", new Carrello());
		request.getSession().removeAttribute("codice");
		request.getSession().removeAttribute("ordineUtente");
		try {
			Iterator<Ordine> it3 = dao.doRetriveAll("id DESC").iterator();
			ordine = it3.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(ordine);
		request.getSession().setAttribute("ordineUtente", ordine);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/ordineEffettuato.jsp");
		dispatcher.forward(request, response);
		return;
	}

}