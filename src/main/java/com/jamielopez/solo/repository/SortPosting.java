package com.jamielopez.solo.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jamielopez.solo.models.Posting;

@Repository
public interface SortPosting extends JpaRepository<Posting, Long>{
	List<Posting> findTop3ByZipcodeOrderByCreatedAtDesc(String zipcode);
	
	List<Posting> findByZipcodeAndDateBetween(String zipcode, LocalDate today, LocalDate oneWeek);
}
