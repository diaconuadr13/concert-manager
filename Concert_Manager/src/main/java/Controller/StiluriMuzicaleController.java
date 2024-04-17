package Controller;

import DAO.StiluriMuzicaleDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.StilMuzical;
import DAOImpl.StiluriMuzicaleDaoImpl;


public class StiluriMuzicaleController extends HttpServlet {

	StilMuzical stilmuzical = new StilMuzical();
	StiluriMuzicaleDaoImpl stilmuzicalDaoImpl = new StiluriMuzicaleDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaStilurimuzicale") != null) {
			String numestil = request.getParameter("numestil");
			String originestil = request.getParameter("originestil");
			String perioadapopularitate = request.getParameter("perioadapopularitate");
			stilmuzical.setNumestil(numestil);
			stilmuzical.setOriginestil(originestil);
			stilmuzical.setPerioadapopularitate(perioadapopularitate);
			stilmuzicalDaoImpl.adaugaStilurimuzicale(stilmuzical);
			List<StilMuzical> listaStilurimuzicale = stilmuzicalDaoImpl.afiseazaStilurimuzicale();
		    request.setAttribute("listaStilurimuzicale", listaStilurimuzicale);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_StiluriMuzicale.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaStilurimuzicale") != null) {
			List<StilMuzical> listaStilurimuzicale = new ArrayList();
			listaStilurimuzicale= stilmuzicalDaoImpl.afiseazaStilurimuzicale();
			request.setAttribute("listaStilurimuzicale", listaStilurimuzicale);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_StiluriMuzicale.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaStilurimuzicale") != null) {
			Long id1 = Long.parseLong(request.getParameter("idstil"));
			String numestil = request.getParameter("numestil");
			String originestil = request.getParameter("originestil");
			String perioadapopularitate = request.getParameter("perioadapopularitate");
			stilmuzicalDaoImpl.modificaStilurimuzicale(id1, numestil, originestil, perioadapopularitate);
		    List<StilMuzical> listaStilurimuzicale = stilmuzicalDaoImpl.afiseazaStilurimuzicale();
		    request.setAttribute("listaStilurimuzicale", listaStilurimuzicale);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_StiluriMuzicale.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeStilmuzical") != null) {
			Long id2 = Long.parseLong(request.getParameter("idstil"));
			stilmuzical.setIdstil(id2);
			stilmuzicalDaoImpl.stergeStilmuzical(stilmuzical);
		    List<StilMuzical> listaStilurimuzicale = stilmuzicalDaoImpl.afiseazaStilurimuzicale();
		    request.setAttribute("listaStilurimuzicale", listaStilurimuzicale);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_StiluriMuzicale.jsp");
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


