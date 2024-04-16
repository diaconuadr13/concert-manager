package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Muzician;
import pojo.StilMuzical;
import pojo.Concert;
import DAOImpl.ConcerteDaoImpl;
import DAOImpl.HibernateUtil;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.hibernate.Session;

/**
 *
 * @author vali
 */
public class ConcerteController extends HttpServlet {

	Concert concert = new Concert();
	ConcerteDaoImpl concertDaoImpl = new ConcerteDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaConcert") != null) {
			// preluarea parametrilor de interes
			Long idmuzician = java.lang.Long.parseLong(request.getParameter("idmuzician"));
			Long idstil = java.lang.Long.parseLong(request.getParameter("idstil"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Muzician muzician = (Muzician) session.get(Muzician.class, idmuzician);
			StilMuzical stilmuzical = (StilMuzical) session.get(StilMuzical.class, idstil);

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date dataconcert = null;
			try {
				dataconcert = df.parse(request.getParameter("dataconcert"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String locatie = request.getParameter("locatie");
			String altedetalii = request.getParameter("altedetalii");

			concert.setMuzician(muzician);
			concert.setStilmuzical(stilmuzical);
			concert.setDataconcert(dataconcert);
			concert.setLocatie(locatie);
			concert.setAltedetalii(altedetalii);

			concertDaoImpl.adaugaConcert(concert);
			List<Concert> listaConcerte = new ArrayList();
			listaConcerte = concertDaoImpl.afiseazaConcert();
			request.setAttribute("listaConcerte", listaConcerte);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Concerte.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaConcert") != null) {
			List<Concert> listaConcerte = new ArrayList();
			listaConcerte = concertDaoImpl.afiseazaConcert();
			request.setAttribute("listaConcerte", listaConcerte);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Concerte.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaConcert") != null) {
			Long id1 = Long.parseLong(request.getParameter("idconcert"));
			// preluarea parametrilor de interes
			Long idmuzician = java.lang.Long.parseLong(request.getParameter("idmuzician"));
			Long idstil = java.lang.Long.parseLong(request.getParameter("idstil"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Muzician muzician = (Muzician) session.get(Muzician.class, idmuzician);
			StilMuzical stilmuzical = (StilMuzical) session.get(StilMuzical.class, idstil);

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date dataconcert = null;
			try {
				dataconcert = df.parse(request.getParameter("dataconcert"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String locatie = request.getParameter("locatie");
			String altedetalii = request.getParameter("altedetalii");

			concertDaoImpl.modificaConcert(id1, muzician, stilmuzical, dataconcert, locatie, altedetalii);
			List<Concert> listaConcerte = new ArrayList();
			listaConcerte = concertDaoImpl.afiseazaConcert();
			request.setAttribute("listaConcerte", listaConcerte);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Concerte.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeConcert") != null) {
			Long id2 = Long.parseLong(request.getParameter("idconcert"));
			concert.setIdconcert(id2);
			concertDaoImpl.stergeConcert(concert);
			List<Concert> listaConcerte = new ArrayList();
			listaConcerte = concertDaoImpl.afiseazaConcert();
			request.setAttribute("listaConcerte", listaConcerte);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Concerte.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}


