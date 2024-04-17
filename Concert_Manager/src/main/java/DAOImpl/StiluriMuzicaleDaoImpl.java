
package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.StilMuzical;
import DAO.StiluriMuzicaleDao;


public class StiluriMuzicaleDaoImpl implements StiluriMuzicaleDao{

    public void adaugaStilurimuzicale(StilMuzical stilmuzical) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(stilmuzical);
        transaction.commit();
        session.close();
    }

    public List<StilMuzical> afiseazaStilurimuzicale() {
        List<StilMuzical> listaStilurimuzicale = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From StilMuzical");
        listaStilurimuzicale= query.list();
        return listaStilurimuzicale;
    }

    public void modificaStilurimuzicale(Long idstil, String numestil, String originestil, String perioadapopularitate) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        StilMuzical detaliistilmuzical = (StilMuzical) session.load(StilMuzical.class, idstil);
        detaliistilmuzical.setNumestil(numestil);
        detaliistilmuzical.setOriginestil(originestil);
        detaliistilmuzical.setPerioadapopularitate(perioadapopularitate);
        session.update(detaliistilmuzical);
        transaction.commit();
        session.close();
    }

    public void stergeStilmuzical(StilMuzical stilmuzical) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(stilmuzical);
        transaction.commit();
        session.close();
    }
}
