package com.example.demo.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.ErgelaKorisnikRepository;
import com.example.demo.repository.JahacRepository;
import com.example.demo.repository.KonjRepository;
import com.example.demo.repository.OmiljeniRepository;
import com.example.demo.repository.TrenerRepository;
import com.example.demo.repository.TreningRepository;

import model.ErgelaKorisnik;
import model.Jahac;
import model.Konj;
import model.Omiljeni;
import model.Trening;

@Controller
@RequestMapping("/jahaci")
public class JahacKontroler {

	@Autowired
	JahacRepository jahacRepo;

	@Autowired
	TrenerRepository trenerRepo;

	@Autowired
	TreningRepository treningRepo;

	@Autowired
	KonjRepository konjRepo;

	@Autowired
	OmiljeniRepository omiljeniRepo;

	@Autowired
	ErgelaKorisnikRepository korisnikRepo;

	@GetMapping("/getJahacAndKonji")
	public String getJahacAndKonji(HttpServletRequest request, Principal principal) {
		getUlogovaniJahac(request, principal);
		List<Konj> konji = konjRepo.findAll();

		request.getSession().setAttribute("sviKonji", konji);

		return "unos/UnosTreninga";
	}

	@PostMapping("/unesiTrening")
	public String unesiTrening(Integer idJahac, Integer idKonj, Date datum, String vreme, HttpServletRequest request) {
		Jahac jahac = null;
		if (idJahac == null)
			jahac = (Jahac) request.getSession().getAttribute("ulogovaniJahac");
		else
			jahac = jahacRepo.findById(idJahac).get();
		
		Konj konj = konjRepo.findById(idKonj).get();

		if (!konjJeSlobodan(konj, datum, vreme)) {
			request.setAttribute("porukaUnosTreninga", "Konj je zauzet u to vreme. Nije moguce zakazati trening!");
		} 
		else {
			Trening t = new Trening();
			t.setDatum(datum);
			t.setVreme(vreme);
			jahac.addTrening(t);
			konj.addTrening(t);

			Trening trening = treningRepo.save(t);
			request.setAttribute("trening", trening);
		}

		return "unos/UnosTreninga";
	}

	private boolean konjJeSlobodan(Konj konj, Date datum, String vreme) {
		List<Trening> treninzi = treningRepo.findAll();
		for (Trening t : treninzi)
			if (t.getKonj().equals(konj) && t.getDatum().equals(datum) && t.getVreme().equals(vreme))
				return false;
		return true;
	}

	@GetMapping("/getMojiTreninzi")
	public String getMojiTreninzi(HttpServletRequest request, Principal principal) {
		Jahac jahac = getUlogovaniJahac(request, principal);
		List<Trening> treninzi = treningRepo.findAllByJahac(jahac);

		if (treninzi == null || treninzi.isEmpty())
			request.setAttribute("porukaMojiTreninzi", "Nema treninga za prikaz!");
		else
			request.setAttribute("mojiTreninzi", treninzi);
		
		return "prikaz/PrikazMojihTreninga";
	}

	@GetMapping("/dodajKonjaUOmiljene")
	public String dodajKonjaUOmiljene(Integer idKonj, HttpServletRequest request, Principal principal) {
		Jahac jahac = getUlogovaniJahac(request, principal);
		Konj konj = konjRepo.findById(idKonj).get();

		String porukaOmiljeni = "";
		boolean vecDodat = false;
		for(Omiljeni o : jahac.getOmiljenis()) {
			if (o.getJahac().equals(jahac) && o.getKonj().equals(konj)) {
				vecDodat = true;
				porukaOmiljeni = "Konj je vec u omiljenima!";
			}
		}
		
		if (!vecDodat) {
			Omiljeni o = new Omiljeni();
			jahac.addOmiljeni(o);
			konj.addOmiljeni(o);
			
			Omiljeni omiljeni = omiljeniRepo.save(o);
			if (omiljeni != null)
				porukaOmiljeni = "Konj uspesno dodat u omiljene!";
		}
		request.setAttribute("porukaOmiljeni", porukaOmiljeni);
		
		return "prikaz/PrikazSvihKonja";
	}

	@GetMapping("/getOmiljeniKonji")
	public String getOmiljeniKonji(HttpServletRequest request, Principal principal) {
		Jahac jahac = getUlogovaniJahac(request, principal);
		List<Omiljeni> omiljeni = omiljeniRepo.findAllByJahac(jahac);
		
		if (omiljeni == null || omiljeni.isEmpty())
			request.setAttribute("porukaPrikazOmiljeni", "Nema omiljenih konja za prikaz!");
		
		request.setAttribute("omiljeni", omiljeni);
		return "prikaz/OmiljeniKonji";
	}
	
	private Jahac getUlogovaniJahac(HttpServletRequest request, Principal principal) {
		ErgelaKorisnik korisnik = korisnikRepo.findByKorisnickoIme(principal.getName());
		Jahac jahac = jahacRepo.findByImeAndPrezime(korisnik.getIme(), korisnik.getPrezime());
		request.getSession().setAttribute("ulogovaniJahac", jahac);
		
		return jahac;
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}