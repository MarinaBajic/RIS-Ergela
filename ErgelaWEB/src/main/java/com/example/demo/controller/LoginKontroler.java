package com.example.demo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.ErgelaKorisnikRepository;
import com.example.demo.repository.ErgelaUlogaRepository;
import com.example.demo.repository.JahacRepository;
import com.example.demo.repository.KonjRepository;
import com.example.demo.repository.TrenerRepository;

import model.ErgelaKorisnik;
import model.ErgelaUloga;
import model.Jahac;

@Controller
@RequestMapping("/auth")
public class LoginKontroler {

	@Autowired
	ErgelaKorisnikRepository korisnikRepo;

	@Autowired
	ErgelaUlogaRepository ulogaRepo;

	@Autowired
	KonjRepository konjRepo;
	
	@Autowired
	TrenerRepository trenerRepo;
	
	@Autowired
	JahacRepository jahacRepo;

	@ModelAttribute
	public void getUloge(Model model) {
		List<ErgelaUloga> uloge = ulogaRepo.findAll();
		model.addAttribute("uloge", uloge);
	}

	@GetMapping("/loginPage")
	public String loginPage() {
		return "login";
	}

	@PostMapping("/login")
	public String loginHello() {
		return "index";
	}

	@GetMapping("/registerUser")
	public String newUser(Model model) {
		ErgelaKorisnik korisnik = new ErgelaKorisnik();
		model.addAttribute("korisnik", korisnik);
		return "register";
	}

	@PostMapping("/register")
	public String saveUser(@ModelAttribute("korisnik") ErgelaKorisnik korisnik, HttpServletRequest request) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		korisnik.setLozinka(passwordEncoder.encode(korisnik.getLozinka()));

		boolean jeJahac = false;
		for (ErgelaUloga uloga : korisnik.getUlogas()) {
			uloga.addKorisnik(korisnik);
			if (uloga.getNaziv().equalsIgnoreCase("JAHAC"))
				jeJahac = true;
		}
		korisnikRepo.save(korisnik);
	
		if (jeJahac) {
			Jahac j = new Jahac();
			j.setIme(korisnik.getIme());
			j.setPrezime(korisnik.getPrezime());
			j.setDatumRodjenja(korisnik.getDatumRodjenja());
			j.setDatumUpisa(new Date());
			j.setTrener(trenerRepo.findById(1).get());
			jahacRepo.save(j);
		}
		
		return "login";
	}

	@GetMapping("/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:/auth/loginPage";
	}

	@GetMapping("/index")
	public String getPocetna() {
		return "index";
	}
	
	@GetMapping("/error")
	public String getError() {
		return "error";
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}
