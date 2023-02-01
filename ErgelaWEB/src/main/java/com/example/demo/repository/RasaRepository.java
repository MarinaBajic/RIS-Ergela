package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Rasa;

public interface RasaRepository extends JpaRepository<Rasa, Integer> {

	public Rasa findByNaziv(String rasa);
}
