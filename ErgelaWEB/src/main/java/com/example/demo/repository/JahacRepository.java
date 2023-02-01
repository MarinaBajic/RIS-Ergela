package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Jahac;

public interface JahacRepository extends JpaRepository<Jahac, Integer> {

//	@Query("select j from Jahac j where j.ime = :ime and j.prezime = :prezime")
//	public Jahac findByImeAndPrezime(@Param("ime") String ime, @Param("prezime") String prezime);
	
	public Jahac findByImeAndPrezime(String ime, String prezime);
}
