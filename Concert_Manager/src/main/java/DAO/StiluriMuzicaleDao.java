    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import pojo.StilMuzical;

/**
 *
 * @author vali
 */
public interface StiluriMuzicaleDao {
    public void adaugaStilurimuzicale (StilMuzical stilmuzical);
    public List<StilMuzical> afiseazaStilurimuzicale();
    public void modificaStilurimuzicale (Long idstil, String numestil, String oiginestil, String perioadapopularitate);
    public void stergeStilmuzical (StilMuzical stilmuzical);
}

    
