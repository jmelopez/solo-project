package com.jamielopez.solo.services;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.jamielopez.solo.models.Posting;
import com.jamielopez.solo.repository.PostingRepo;
import com.jamielopez.solo.repository.SortPosting;

@Service
public class PostingService {

	@Autowired
	private PostingRepo postingRepo;
	
	@Autowired
	private SortPosting sortPostingRepo;
	
	public List<Posting> getAllListings() {
		return postingRepo.findAll();
	}
	
	//view single listing
	public Posting getListing(Long id) {
		Optional<Posting> isPost = postingRepo.findById(id);
		if(isPost.isPresent()) {
			return isPost.get();
		} else {
			return null;
		}
	}
	
	//get listings by zipcode
	public List<Posting> getAllPostingsByZip(String zipcode) {
		return postingRepo.findByZipcode(zipcode);
	}
	
	public List<Posting> getTopByZip(String zipcode) {
		return sortPostingRepo.findTop3ByZipcodeOrderByCreatedAtDesc(zipcode);
	}
	
	public List<Posting> getAllContaining(String myInput) {
		List<Posting> list = new ArrayList();
		list.addAll(postingRepo.findByCityContainingIgnoreCase(myInput));
		list.addAll(postingRepo.findByStateContainingIgnoreCase(myInput));
		list.addAll(postingRepo.findByZipcodeContainingIgnoreCase(myInput));
		list.addAll(postingRepo.findByTitleContainingIgnoreCase(myInput));
		list.addAll(postingRepo.findByDescriptionContainingIgnoreCase(myInput));
//		list.addAll(postingRepo.findByTags(query));
		System.out.print(list);
		return list;
	}
	
	public List<Posting> findByStartDate(String zipcode) {
		LocalDate today = LocalDate.now();
		LocalDate oneWeek = today.plusDays(7);
		return sortPostingRepo.findByZipcodeAndDateBetween(zipcode, today, oneWeek);
		
	}
	
	//add listing
	public Posting addListing(Posting newListing, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		} else {
			return postingRepo.save(newListing);
		}
	}
	
	public Posting updatePosting(Posting listing, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		} else {
			return postingRepo.save(listing);			
		}
	}
	
	//delete posting
	public void deleteListing(Long id) {
		postingRepo.deleteById(id);
	}
	
	public static Boolean checkDate(LocalDate event) {
		LocalDate eventDate = event;
		LocalDate today = LocalDate.now();
		Period period = Period.between(today, eventDate);
		
		System.out.println(period.getMonths() + " month(s) " + period.getDays() + " days");
		return false;
	}
	
	public static long timeTillEvent(LocalDate date, String time) {
		LocalDate eDate = date;
		LocalTime eTime = LocalTime.parse(time);
		LocalDateTime thisEvent = LocalDateTime.of(eDate, eTime);
		LocalDateTime todayTime = LocalDateTime.now();
		

		 LocalDateTime difference = LocalDateTime.from(todayTime);
	        long years = difference.until(thisEvent, ChronoUnit.YEARS);
	        difference = difference.plusYears(years);

	        long months = difference.until(thisEvent, ChronoUnit.MONTHS);
	        difference = difference.plusMonths(months);

	        long days = difference.until(thisEvent, ChronoUnit.DAYS);
	        difference = difference.plusDays(days);

	        long hours = difference.until(thisEvent, ChronoUnit.HOURS);
	        difference = difference.plusHours(hours);

	        long minutes = difference.until(thisEvent, ChronoUnit.MINUTES);
	        difference = difference.plusMinutes(minutes);

	        long seconds = difference.until(thisEvent, ChronoUnit.SECONDS);
	        difference = difference.plusSeconds(seconds);

	        System.out.printf("The difference is %s years, %s months, %s days, " +
	                        "%s hours, %s minutes, %s seconds",
	                years, months, days, hours, minutes, seconds);	
	        
	        return days;
		
	}
	
	public static String dateFormat(LocalDate date) {
		
		 String eDate = date.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.LONG));
		 return eDate;
	}
	
	public static LocalTime convertStringTime(String time) {
		LocalTime eTime = LocalTime.parse(time);
		return eTime;
	}
		
	public static String timeFormat(String time) {
		LocalTime eTime = LocalTime.parse(time);
		String eventTime = eTime.format(DateTimeFormatter.ofLocalizedTime(FormatStyle.SHORT));
		return eventTime;
	}
	
	
}
