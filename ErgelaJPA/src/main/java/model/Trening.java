package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the trening database table.
 * 
 */
@Entity
@NamedQuery(name="Trening.findAll", query="SELECT t FROM Trening t")
public class Trening implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTrening;

	@Temporal(TemporalType.DATE)
	private Date datum;

	private String vreme;

	//bi-directional many-to-one association to Jahac
	@ManyToOne
	@JoinColumn(name="idJahac")
	private Jahac jahac;

	//bi-directional many-to-one association to Konj
	@ManyToOne
	@JoinColumn(name="idKonj")
	private Konj konj;

	public Trening() {
	}

	public int getIdTrening() {
		return this.idTrening;
	}

	public void setIdTrening(int idTrening) {
		this.idTrening = idTrening;
	}

	public Date getDatum() {
		return this.datum;
	}

	public void setDatum(Date datum) {
		this.datum = datum;
	}

	public String getVreme() {
		return this.vreme;
	}

	public void setVreme(String vreme) {
		this.vreme = vreme;
	}

	public Jahac getJahac() {
		return this.jahac;
	}

	public void setJahac(Jahac jahac) {
		this.jahac = jahac;
	}

	public Konj getKonj() {
		return this.konj;
	}

	public void setKonj(Konj konj) {
		this.konj = konj;
	}

}