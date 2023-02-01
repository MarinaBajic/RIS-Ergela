package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the jahac database table.
 * 
 */
@Entity
@NamedQuery(name="Jahac.findAll", query="SELECT j FROM Jahac j")
public class Jahac implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idJahac;

	private String adresa;

	@Temporal(TemporalType.DATE)
	private Date datumRodjenja;

	@Temporal(TemporalType.DATE)
	private Date datumUpisa;

	private String ime;

	private String prezime;

	//bi-directional many-to-one association to Trener
	@ManyToOne
	@JoinColumn(name="idTrener")
	private Trener trener;

	//bi-directional many-to-one association to Omiljeni
	@OneToMany(mappedBy="jahac")
	private List<Omiljeni> omiljenis;

	//bi-directional many-to-one association to Trening
	@OneToMany(mappedBy="jahac")
	private List<Trening> trenings;

	public Jahac() {
	}

	public int getIdJahac() {
		return this.idJahac;
	}

	public void setIdJahac(int idJahac) {
		this.idJahac = idJahac;
	}

	public String getAdresa() {
		return this.adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	public Date getDatumRodjenja() {
		return this.datumRodjenja;
	}

	public void setDatumRodjenja(Date datumRodjenja) {
		this.datumRodjenja = datumRodjenja;
	}

	public Date getDatumUpisa() {
		return this.datumUpisa;
	}

	public void setDatumUpisa(Date datumUpisa) {
		this.datumUpisa = datumUpisa;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public Trener getTrener() {
		return this.trener;
	}

	public void setTrener(Trener trener) {
		this.trener = trener;
	}

	public List<Omiljeni> getOmiljenis() {
		return this.omiljenis;
	}

	public void setOmiljenis(List<Omiljeni> omiljenis) {
		this.omiljenis = omiljenis;
	}

	public Omiljeni addOmiljeni(Omiljeni omiljeni) {
		getOmiljenis().add(omiljeni);
		omiljeni.setJahac(this);

		return omiljeni;
	}

	public Omiljeni removeOmiljeni(Omiljeni omiljeni) {
		getOmiljenis().remove(omiljeni);
		omiljeni.setJahac(null);

		return omiljeni;
	}

	public List<Trening> getTrenings() {
		return this.trenings;
	}

	public void setTrenings(List<Trening> trenings) {
		this.trenings = trenings;
	}

	public Trening addTrening(Trening trening) {
		getTrenings().add(trening);
		trening.setJahac(this);

		return trening;
	}

	public Trening removeTrening(Trening trening) {
		getTrenings().remove(trening);
		trening.setJahac(null);

		return trening;
	}

}