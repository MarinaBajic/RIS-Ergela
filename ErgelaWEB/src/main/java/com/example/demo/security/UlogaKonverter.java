package com.example.demo.security;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import com.example.demo.repository.ErgelaUlogaRepository;

import model.ErgelaUloga;

public class UlogaKonverter implements Converter<String, ErgelaUloga> {

	ErgelaUlogaRepository ulogaRepo;
	
	public UlogaKonverter(ErgelaUlogaRepository ulogaRepo) {
		this.ulogaRepo = ulogaRepo;
	}

	@Override
	public ErgelaUloga convert(String source) {
		int idUloga = -1;
		try {
			idUloga = Integer.parseInt(source);
			
		} catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class),
					TypeDescriptor.valueOf(ErgelaUloga.class), idUloga, null);
		}
		ErgelaUloga role = ulogaRepo.findById(idUloga).get();
		return role;
	}

}
