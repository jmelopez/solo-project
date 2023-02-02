package com.jamielopez.solo.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jamielopez.solo.models.Posting;

@Repository
public interface PostingRepo extends CrudRepository<Posting, Long> {
	List<Posting> findByZipcode(String zipcode);
	
	List<Posting> findAll();
	
	List<Posting> findByTitleContainingIgnoreCase(String title);
	List<Posting> findByCityContainingIgnoreCase(String city);
	List<Posting> findByStateContainingIgnoreCase(String state);
	List<Posting> findByZipcodeContainingIgnoreCase(String state);
//	List<Posting> findByTagsContainingIgnoreCase(String tags);
	List<Posting> findByDescriptionContainingIgnoreCase(String description);
	
}
