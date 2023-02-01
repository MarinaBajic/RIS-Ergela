package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the konj database table.
 * 
 */
@Entity
@NamedQuery(name="Konj.findAll", query="SELECT k FROM Konj k")
public class Konj implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idKonj;

	@Temporal(TemporalType.DATE)
	private Date datumRodjenja;

	private String nadimak;

	private String pol;

	private String punoIme;

	//bi-directional many-to-one association to Rasa
	@ManyToOne
	@JoinColumn(name="idRasa")
	private Rasa rasa;

	//bi-directional many-to-one association to Omiljeni
	@OneToMany(mappedBy="konj")
	private List<Omiljeni> omiljenis;

	//bi-directional many-to-one association to Trening
	@OneToMany(mappedBy="konj")
	private List<Trening> trenings;

	public Konj() {
	}

	public int getIdKonj() {
		return this.idKonj;
	}

	public void setIdKonj(int idKonj) {
		this.idKonj = idKonj;
	}

	public Date getDatumRodjenja() {
		return this.datumRodjenja;
	}

	public void setDatumRodjenja(Date datumRodjenja) {
		this.datumRodjenja = datumRodjenja;
	}

	public String getNadimak() {
		return this.nadimak;
	}

	public void setNadimak(String nadimak) {
		this.nadimak = nadimak;
	}

	public String getPol() {
		return this.pol;
	}

	public void setPol(String pol) {
		this.pol = pol;
	}

	public String getPunoIme() {
		return this.punoIme;
	}

	public void setPunoIme(String punoIme) {
		this.punoIme = punoIme;
	}

	public Rasa getRasa() {
		return this.rasa;
	}

	public void setRasa(Rasa rasa) {
		this.rasa = rasa;
	}

	public List<Omiljeni> getOmiljenis() {
		return this.omiljenis;
	}

	public void setOmiljenis(List<Omiljeni> omiljenis) {
		this.omiljenis = omiljenis;
	}

	public Omiljeni addOmiljeni(Omiljeni omiljeni) {
		getOmiljenis().add(omiljeni);
		omiljeni.setKonj(this);

		return omiljeni;
	}

	public Omiljeni removeOmiljeni(Omiljeni omiljeni) {
		getOmiljenis().remove(omiljeni);
		omiljeni.setKonj(null);

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
		trening.setKonj(this);

		return trening;
	}

	public Trening removeTrening(Trening trening) {
		getTrenings().remove(trening);
		trening.setKonj(null);

		return trening;
	}

}