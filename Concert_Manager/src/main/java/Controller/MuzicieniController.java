
package Controller;

import DAO.MuzicieniDao;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Muzician;
import DAOImpl.MuzicieniDaoImpl;


public class MuzicieniController extends HttpServlet {

	Muzician muzician = new Muzician();
	MuzicieniDaoImpl muzicianDaoImpl = new MuzicieniDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaMuzicieni") != null) {
			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date datanasterii=null;
			try {
				datanasterii = df.parse(request.getParameter("datanasterii"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String taraorigine = request.getParameter("taraorigine");
			String instrumentprincipal = request.getParameter("instrumentprincipal");
			muzician.setNume(nume);
			muzician.setPrenume(prenume);
			muzician.setDatanasterii(datanasterii);
			muzician.setTaraorigine(taraorigine);
			muzician.setInstrumentprincipal(instrumentprincipal);
			muzicianDaoImpl.adaugaMuzicieni(muzician);
			List<Muzician> listaMuzicieni = muzicianDaoImpl.afiseazaMuzicieni();
			request.setAttribute("listaMuzicieni", listaMuzicieni);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Muzicieni.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaMuzicieni") != null) {
			List<Muzician> listaMuzicieni = muzicianDaoImpl.afiseazaMuzicieni();
			request.setAttribute("listaMuzicieni", listaMuzicieni);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Muzicieni.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaMuzicieni") != null) {
			Long id1 = Long.parseLong(request.getParameter("idmuzician"));
			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");
			Date datanasterii=null;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				datanasterii = df.parse(request.getParameter("datanasterii"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String taraorigine = request.getParameter("taraorigine");
			String instrumentprincipal = request.getParameter("instrumentprincipal");
			muzicianDaoImpl.modificaMuzicieni(id1, nume, prenume, datanasterii, taraorigine, instrumentprincipal);
			List<Muzician> listaMuzicieni = muzicianDaoImpl.afiseazaMuzicieni();
			request.setAttribute("listaMuzicieni", listaMuzicieni);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Muzicieni.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeMuzician") != null) {
			Long id2 = Long.parseLong(request.getParameter("idmuzician"));
			muzician.setIdmuzician(id2);
			muzicianDaoImpl.stergeMuzician(muzician);
			List<Muzician> listaMuzicieni = muzicianDaoImpl.afiseazaMuzicieni();
			request.setAttribute("listaMuzicieni", listaMuzicieni);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Muzicieni.jsp");
			rd.forward(request, response);
		}
	}


	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}


