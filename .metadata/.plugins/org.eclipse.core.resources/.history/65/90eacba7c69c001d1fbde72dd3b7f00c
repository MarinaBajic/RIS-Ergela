package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the rasa database table.
 * 
 */
@Entity
@NamedQuery(name="Rasa.findAll", query="SELECT r FROM Rasa r")
public class Rasa implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idRasa;

	private String boja;

	private String naziv;

	//bi-directional many-to-one association to Konj
	@OneToMany(mappedBy="rasa")
	private List<Konj> konjs;

	public Rasa() {
	}

	public int getIdRasa() {
		return this.idRasa;
	}

	public void setIdRasa(int idRasa) {
		this.idRasa = idRasa;
	}

	public String getBoja() {
		return this.boja;
	}

	public void setBoja(String boja) {
		this.boja = boja;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Konj> getKonjs() {
		return this.konjs;
	}

	public void setKonjs(List<Konj> konjs) {
		this.konjs = konjs;
	}

	public Konj addKonj(Konj konj) {
		getKonjs().add(konj);
		konj.setRasa(this);

		return konj;
	}

	public Konj removeKonj(Konj konj) {
		getKonjs().remove(konj);
		konj.setRasa(null);

		return konj;
	}

}