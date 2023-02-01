package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Jahac;
import model.Omiljeni;

public interface OmiljeniRepository extends JpaRepository<Omiljeni, Integer> {

	public List<Omiljeni> findAllByJahac(Jahac j);
}
