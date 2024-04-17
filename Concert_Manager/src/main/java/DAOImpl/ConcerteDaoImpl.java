
package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Concert;
import DAO.ConcerteDao;
import java.util.Date;
import pojo.StilMuzical;
import pojo.Muzician;

public class ConcerteDaoImpl implements ConcerteDao{

    public void adaugaConcert(Concert concert) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(concert);
        transaction.commit();
        session.close();
    }

    public List<Concert> afiseazaConcert() {
        List<Concert> listaConcerte = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Concert");
        listaConcerte = query.list();
        return listaConcerte;
    }

    public void modificaConcert(Long idconcert, Muzician muzician, StilMuzical stilmuzical, Date dataconcert, String locatie, String altedetalii) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Concert detaliiconcert;
        detaliiconcert = (Concert) session.load(Concert.class, idconcert);
        detaliiconcert.setMuzician(muzician);
        detaliiconcert.setStilmuzical(stilmuzical);
        detaliiconcert.setDataconcert(dataconcert);
        detaliiconcert.setLocatie(locatie);
        detaliiconcert.setAltedetalii(altedetalii);
        session.update(detaliiconcert);
        transaction.commit();
        session.close();
    }

    public void stergeConcert(Concert concert) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(concert);
        transaction.commit();
        session.close();
    }
}
