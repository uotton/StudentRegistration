package ua.lviv.lgs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.RegisteredEntrantRepository;
import ua.lviv.lgs.domain.RegisteredEntrant;

@Service
public class RegisteredEntrantService {

	@Autowired
	private RegisteredEntrantRepository registeredEntrantRepository;

	public void save(RegisteredEntrant statement) {
		registeredEntrantRepository.save(statement);
	}

	public RegisteredEntrant findById(Integer id) {
		return registeredEntrantRepository.findById(id).get();
	}

	public List<RegisteredEntrant> findAllRegisteredEntrants() {
		return registeredEntrantRepository.findAll();
	}

	public void deleteById(Integer id) {
		registeredEntrantRepository.deleteById(id);
	}
}