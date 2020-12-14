package ua.lviv.lgs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.lviv.lgs.dao.StatementRepository;
import ua.lviv.lgs.domain.Statement;

@Service
public class StatementService {

	@Autowired
	private StatementRepository statementRepository;

	public void save(Statement statement) {
		statementRepository.save(statement);
	}

	public Statement findById(Integer id) {
		return statementRepository.findById(id).get();
	}

	public List<Statement> findAllStatements() {
		return statementRepository.findAll();
	}
}
