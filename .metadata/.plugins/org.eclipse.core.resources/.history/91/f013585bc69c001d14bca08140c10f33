package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the trener database table.
 * 
 */
@Entity
@NamedQuery(name="Trener.findAll", query="SELECT t FROM Trener t")
public class Trener implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTrener;

	private int godIskustva;

	private String ime;

	private String prezime;

	//bi-directional many-to-one association to Jahac
	@OneToMany(mappedBy="trener")
	private List<Jahac> jahacs;

	public Trener() {
	}

	public int getIdTrener() {
		return this.idTrener;
	}

	public void setIdTrener(int idTrener) {
		this.idTrener = idTrener;
	}

	public int getGodIskustva() {
		return this.godIskustva;
	}

	public void setGodIskustva(int godIskustva) {
		this.godIskustva = godIskustva;
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

	public List<Jahac> getJahacs() {
		return this.jahacs;
	}

	public void setJahacs(List<Jahac> jahacs) {
		this.jahacs = jahacs;
	}

	public Jahac addJahac(Jahac jahac) {
		getJahacs().add(jahac);
		jahac.setTrener(this);

		return jahac;
	}

	public Jahac removeJahac(Jahac jahac) {
		getJahacs().remove(jahac);
		jahac.setTrener(null);

		return jahac;
	}

}