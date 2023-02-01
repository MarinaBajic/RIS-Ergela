package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the omiljeni database table.
 * 
 */
@Entity
@NamedQuery(name="Omiljeni.findAll", query="SELECT o FROM Omiljeni o")
public class Omiljeni implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idOmiljeni;

	//bi-directional many-to-one association to Jahac
	@ManyToOne
	@JoinColumn(name="idJahac")
	private Jahac jahac;

	//bi-directional many-to-one association to Konj
	@ManyToOne
	@JoinColumn(name="idKonj")
	private Konj konj;

	public Omiljeni() {
	}

	public int getIdOmiljeni() {
		return this.idOmiljeni;
	}

	public void setIdOmiljeni(int idOmiljeni) {
		this.idOmiljeni = idOmiljeni;
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