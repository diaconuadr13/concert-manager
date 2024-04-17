
package DAO;

import java.util.List;
import pojo.StilMuzical;


public interface StiluriMuzicaleDao {
    public void adaugaStilurimuzicale (StilMuzical stilmuzical);
    public List<StilMuzical> afiseazaStilurimuzicale();
    public void modificaStilurimuzicale (Long idstil, String numestil, String oiginestil, String perioadapopularitate);
    public void stergeStilmuzical (StilMuzical stilmuzical);
}

    
