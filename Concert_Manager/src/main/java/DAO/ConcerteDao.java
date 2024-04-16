    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import pojo.Concert;
import java.util.Date;
import pojo.StilMuzical;
import pojo.Muzician;

/**
 *
 * @author vali
 */
public interface ConcerteDao {
    public void adaugaConcert (Concert consultatie);
    public List<Concert> afiseazaConcert();
    public void modificaConcert (Long idconcert, Muzician muzician, StilMuzical stilmuzical, Date dataconcert, String locatie, String altedetalii);
    public void stergeConcert (Concert consultatie);
}

    
