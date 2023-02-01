package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.ErgelaKorisnik;

public interface ErgelaKorisnikRepository extends JpaRepository<ErgelaKorisnik, Integer> {
	
	public ErgelaKorisnik findByKorisnickoIme(String korisnickoIme);
}
