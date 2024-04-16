/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Muzician;
import DAO.MuzicieniDao;

/**
 *
 * @author vali
 */
public class MuzicieniDaoImpl implements MuzicieniDao{

    public void adaugaMuzicieni(Muzician muzician) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(muzician);
        transaction.commit();
        session.close();
    }

    public List<Muzician> afiseazaMuzicieni() {
        List<Muzician> listaMuzicieni = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query query = session.createQuery("From Muzician");
        listaMuzicieni = query.list();
        return listaMuzicieni;
    }

    public void modificaMuzicieni(Long idmuzician, String nume, String prenume, Date datanasterii, String taraorigine, String instrumentprincipal) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Muzician detaliimuzicieni = (Muzician) session.load(Muzician.class, idmuzician);
        detaliimuzicieni.setNume(nume);
        detaliimuzicieni.setPrenume(prenume);
        detaliimuzicieni.setDatanasterii(datanasterii);
        detaliimuzicieni.setTaraorigine(taraorigine);
        detaliimuzicieni.setInstrumentprincipal(instrumentprincipal);
        session.update(detaliimuzicieni);
        transaction.commit();
        session.close();
    }

    public void stergeMuzician(Muzician muzician) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(muzician);
        transaction.commit();
        session.close();
    }
}
