package ua.lviv.lgs.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import ua.lviv.lgs.domain.Statement;

public interface StatementRepository extends JpaRepository<Statement, Integer> {
}