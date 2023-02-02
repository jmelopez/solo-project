package com.jamielopez.solo.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jamielopez.solo.models.Posting;
import com.jamielopez.solo.models.User;
import com.jamielopez.solo.repository.PostingRepo;
import com.jamielopez.solo.services.PostingService;
import com.jamielopez.solo.services.UserService;

@Controller
@RequestMapping("/listing")
public class PostingController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private PostingService postServ;
	
	@Autowired
	private PostingRepo postRepo;
	
	//view add listing page
	@GetMapping("/create")
	public String newListing(@ModelAttribute("newListing") Posting newListing, Model model, HttpSession session) {
		Long uid = (Long) session.getAttribute("userId");
		if(uid == null) {
			return "error.jsp";
		} else {;
			return "addListing.jsp";
			}
		}
	
	@PostMapping("/add")
	public String newPosting(@Valid @ModelAttribute("newListing") Posting newListing, BindingResult result, Model model, HttpSession session) {
		Long uid = (Long) session.getAttribute("userId");
		if(uid == null) {
			return "error.jsp";
		} else {
			if (result.hasErrors()) {
				return "addListing.jsp";
			} else {
				User loggedUser = userServ.getById(uid);
				newListing.setUser(loggedUser);
				postServ.addListing(newListing, result);
				return "redirect:/dashboard";
			}
		}
	}
	
	//edit listing
	@GetMapping("/edit/{id}")
	public String editListing(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long uid = (Long) session.getAttribute("userId");
		Posting post = postServ.getListing(id);
		User postUser = post.getUser();
		if(uid == null) {
			return "error.jsp";
		} else if(uid != postUser.getId()) {
			return "error.jsp";
		} else {
			model.addAttribute("listing", post);
			model.addAttribute("user", userServ.getById(uid));
			return "editListing.jsp";
		}
	}
	
	@PutMapping("/edit/{id}")
	public String updateListing(@PathVariable("id") Long id, @Valid @ModelAttribute("listing") Posting listing, BindingResult result, HttpSession session) {
		Long uid = (Long) session.getAttribute("userId");
		if(uid == null) {
			return "error.jsp";
		} else {
			if(result.hasErrors()) {
				return "editListing.jsp";
			} else {
				User loggedUser = userServ.getById(uid);
				listing.setUser(loggedUser);
				postServ.updatePosting(listing, result);
				return "redirect:/listing/{id}";
			}
		}
	}
	
	@GetMapping("/search")
	public String searchListings(@RequestParam(value="q", required=false) String searchQuery, Model model, HttpSession session) {
		Long uid = (Long) session.getAttribute("userId");
		if(uid == null) {
			return "error.jsp";
		} else {
			model.addAttribute("user", userServ.getById(uid));
			model.addAttribute("searchResult", postServ.getAllContaining(searchQuery));
			model.addAttribute("allListings", postServ.getAllListings());
			model.addAttribute("searchQuery", searchQuery);
		}
		return "search.jsp";
	}	
	
	@GetMapping("/{id}")
	public String showListing(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long uid = (Long) session.getAttribute("userId");
		Posting post = postServ.getListing(id);
		if(uid == null) {
			return "error.jsp";
		} else {
			String eDate = PostingService.dateFormat(post.getDate());
			String sTime = PostingService.timeFormat(post.getStart());
			String eTime = PostingService.timeFormat(post.getEnd());
			model.addAttribute("user", userServ.getById(uid));
			model.addAttribute("listing", postServ.getListing(id));
			model.addAttribute("date", eDate);
			model.addAttribute("start", sTime);
			model.addAttribute("end", eTime);
			
			
			return "showListing.jsp";
		}
	}
	
	@GetMapping("/upcoming")
	public String upcomingEvents(Model model, HttpSession session) {
		Long uid = (Long) session.getAttribute("userId");
		User user = userServ.getById(uid);
		List<Posting> allPosts = postServ.getAllListings();
		if(uid == null) {
			return "error.jsp";
		} else {
			model.addAttribute("thisWeek", postServ.findByStartDate(user.getZipcode()));
			model.addAttribute("listings", allPosts);
			return "upcoming.jsp";
		}
	}
	
	@GetMapping("/watch/{id}")
	public String watchListing(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long uid = (Long) session.getAttribute("userId");
		User user = userServ.getById(uid);
		Posting post = postServ.getListing(id);
		if(uid == null) {
			return "error.jsp";
		} else {
			post.getUsers().add(user);
			postRepo.save(post);
			model.addAttribute("user", user);
			model.addAttribute("listing", post);			
			return "showListing.jsp";
		}
	}
	
	@GetMapping("/test/{id}")
	public String pullMap(@PathVariable("id") Long id, Model model) {
		model.addAttribute("listing", postServ.getListing(id));
		return "testMap.jsp";
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteListing(@PathVariable("id") Long id) {
		postServ.deleteListing(id);
		return "redirect:/dashboard";
	}
}