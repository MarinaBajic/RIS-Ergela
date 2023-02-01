package model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


/**
 * The persistent class for the ergela_korisnik database table.
 * 
 */
@Entity
@Table(name="ergela_korisnik")
@NamedQuery(name="ErgelaKorisnik.findAll", query="SELECT e FROM ErgelaKorisnik e")
public class ErgelaKorisnik implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idKorisnik;

	private String email;

	private String ime;

	private String korisnickoIme;

	@Temporal(TemporalType.DATE)
	private Date datumRodjenja;

	private String lozinka;

	private String prezime;
	
	@ManyToMany(fetch = FetchType.EAGER, mappedBy="korisniks")
	private Set<ErgelaUloga> ulogas = new HashSet<>();

	public ErgelaKorisnik() {
	}

	public int getIdKorisnik() {
		return this.idKorisnik;
	}

	public void setIdKorisnik(int idKorisnik) {
		this.idKorisnik = idKorisnik;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getKorisnickoIme() {
		return this.korisnickoIme;
	}

	public void setKorisnickoIme(String korisnickoIme) {
		this.korisnickoIme = korisnickoIme;
	}

	public String getLozinka() {
		return this.lozinka;
	}

	public void setLozinka(String lozinka) {
		this.lozinka = lozinka;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}
	
	public Set<ErgelaUloga> getUlogas() {
		return ulogas;
	}

	public Date getDatumRodjenja() {
		return this.datumRodjenja;
	}

	public void setDatumRodjenja(Date datumRodjenja) {
		this.datumRodjenja = datumRodjenja;
	}

	public void setUlogas(Set<ErgelaUloga> ulogas) {
		this.ulogas = ulogas;
	}

	public void setRoles(Set<ErgelaUloga> uloge) {
		this.ulogas = uloge;
	}
	
	public void addRole(ErgelaUloga r) {
		this.ulogas.add(r);
	}

}