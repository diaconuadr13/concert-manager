
package DAO;

import java.util.List;
import pojo.Concert;
import java.util.Date;
import pojo.StilMuzical;
import pojo.Muzician;


public interface ConcerteDao {
    public void adaugaConcert (Concert consultatie);
    public List<Concert> afiseazaConcert();
    public void modificaConcert (Long idconcert, Muzician muzician, StilMuzical stilmuzical, Date dataconcert, String locatie, String altedetalii);
    public void stergeConcert (Concert consultatie);
}

    
