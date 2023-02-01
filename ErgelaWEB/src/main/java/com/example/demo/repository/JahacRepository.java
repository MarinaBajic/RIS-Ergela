package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Jahac;

public interface JahacRepository extends JpaRepository<Jahac, Integer> {

	public Jahac findByImeAndPrezime(String ime, String prezime);
}
