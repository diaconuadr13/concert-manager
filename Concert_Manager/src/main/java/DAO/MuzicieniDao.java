    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.Date;
import java.util.List;
import pojo.Muzician;

/**
 *
 * @author vali
 */
public interface MuzicieniDao {
    public void adaugaMuzicieni (Muzician muzician);
    public List<Muzician> afiseazaMuzicieni();
    public void modificaMuzicieni (Long idmuzician, String nume, String prenume, Date datanasterii, String taraorigine, String instrumentprincipal);
    public void stergeMuzician (Muzician muzician);
}

    
