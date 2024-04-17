package pojo;

import java.util.HashSet;
import java.util.Set;

public class StilMuzical implements java.io.Serializable {

    private Long idstil;
    private String numestil;
    private String originestil;
    private String perioadapopularitate;
    private Set<Concert> concertes = new HashSet<>(0); 

    public StilMuzical() {
    }

    public StilMuzical(String numestil, String originestil, String perioadapopularitate, Set<Concert> concertes) {
        this.numestil = numestil;
        this.originestil = originestil;
        this.perioadapopularitate = perioadapopularitate;
        this.concertes = concertes;
    }

    public Long getIdstil() {
        return this.idstil;
    }

    public void setIdstil(Long idstil) {
        this.idstil = idstil;
    }

    public String getNumestil() {
        return this.numestil;
    }

    public void setNumestil(String numestil) {
        this.numestil = numestil;
    }

    public String getOriginestil() {
        return this.originestil;
    }

    public void setOriginestil(String originestil) {
        this.originestil = originestil;
    }

    public String getPerioadapopularitate() {
        return this.perioadapopularitate;
    }

    public void setPerioadapopularitate(String perioadapopularitate) {
        this.perioadapopularitate = perioadapopularitate;
    }

    public Set<Concert> getConcertes() {
        return this.concertes;
    }

    public void setConcertes(Set<Concert> concertes) {
        this.concertes = concertes;
    }
}
