package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Konj;
import model.Rasa;

public interface KonjRepository extends JpaRepository<Konj, Integer> {

	public Konj findByNadimak(String nadimak);
	
	public List<Konj> findByRasa(Rasa rasa);
}
