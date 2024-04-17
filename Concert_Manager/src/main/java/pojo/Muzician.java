package pojo;

import java.util.HashSet;
import java.util.Set;
import java.util.Date; 

public class Muzician implements java.io.Serializable {

    private Long idmuzician;
    private String nume;
    private String prenume;
    private Date datanasterii;
    private String taraorigine;
    private String instrumentprincipal;
    private Set<Concert> concertes = new HashSet<>(0);

    public Muzician() {
    }

    public Muzician(String nume, String prenume, Date datanasterii, String taraorigine, String instrumentprincipal, Set<Concert> concertes) {
        this.nume = nume;
        this.prenume = prenume;
        this.datanasterii = datanasterii;
        this.taraorigine = taraorigine;
        this.instrumentprincipal = instrumentprincipal;
        this.concertes = concertes;
    }

    public Long getIdmuzician() {
        return this.idmuzician;
    }

    public void setIdmuzician(Long idmuzician) {
        this.idmuzician = idmuzician;
    }

    public String getNume() {
        return this.nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getPrenume() {
        return this.prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public Date getDatanasterii() {
        return this.datanasterii;
    }

    public void setDatanasterii(Date datanasterii) {
        this.datanasterii = datanasterii;
    }

    public String getTaraorigine() {
        return this.taraorigine;
    }

    public void setTaraorigine(String taraorigine) {
        this.taraorigine = taraorigine;
    }

    public String getInstrumentprincipal() {
        return this.instrumentprincipal;
    }

    public void setInstrumentprincipal(String instrumentprincipal) {
        this.instrumentprincipal = instrumentprincipal;
    }

    public Set<Concert> getConcertes() {
        return this.concertes;
    }

    public void setConcertes(Set<Concert> concertes) {
        this.concertes = concertes;
    }
}
