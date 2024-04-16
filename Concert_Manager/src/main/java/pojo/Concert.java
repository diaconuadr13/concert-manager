package pojo;



import java.util.Date;

public class Concert  implements java.io.Serializable {

	private Long idconcert;
	private StilMuzical stilurimuzicale;
	private Muzician muzicieni;
	private Date dataconcert;
	private String locatie;
	private String altedetalii;

	public Concert() {
	}

	public Concert(StilMuzical stilurimuzicale, Muzician muzicieni, Date dataconcert, String locatie, String altedetalii) {
		this.stilurimuzicale = stilurimuzicale;
		this.muzicieni = muzicieni;
		this.dataconcert = dataconcert;
		this.locatie = locatie;
		this.altedetalii = altedetalii;
	}

	public Long getIdconcert() {
		return this.idconcert;
	}

	public void setIdconcert(Long idconcert) {
		this.idconcert = idconcert;
	}
	public StilMuzical getStilmuzical() {
		return this.stilurimuzicale;
	}

	public void setStilmuzical(StilMuzical stilurimuzicale) {
		this.stilurimuzicale = stilurimuzicale;
	}
	public Muzician getMuzician() {
		return this.muzicieni;
	}

	public void setMuzician(Muzician muzicieni) {
		this.muzicieni = muzicieni;
	}
	public Date getDataconcert() {
		return this.dataconcert;
	}

	public void setDataconcert(Date dataconcert) {
		this.dataconcert = dataconcert;
	}
	public String getLocatie() {
		return this.locatie;
	}

	public void setLocatie(String locatie) {
		this.locatie = locatie;
	}
	public String getAltedetalii() {
		return this.altedetalii;
	}

	public void setAltedetalii(String altedetalii) {
		this.altedetalii = altedetalii;
	}
}




