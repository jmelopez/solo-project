package com.jamielopez.solo.controllers;



import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jamielopez.solo.models.LoginUser;
import com.jamielopez.solo.models.User;
import com.jamielopez.solo.services.PostingService;
import com.jamielopez.solo.services.UserService;




@Controller
public class MainController {

	@Autowired
	private UserService userServ;
	
	@Autowired
	private PostingService postServ;

	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		if(session.getAttribute("session") == null) {
			//bind empty user and loginuser objects to jsp to capture input
			model.addAttribute("newUser", new User());
			model.addAttribute("newLogin", new LoginUser());
			model.addAttribute("invalid", false);
			return "login.jsp";		
		} else {
			model.addAttribute("invalid", true);
			model.addAttribute("newUser", new User());
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		}
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		//TODO call a register method in service
		//TODO some extra validations and create new use
		User inputUser = userServ.register(newUser, result);
		if(result.hasErrors()) {
			if(newUser.getDob() != null) {
				Boolean age = userServ.getAge(newUser.getDob());
				if(age == false) {
					model.addAttribute("newLogin", new LoginUser());
					model.addAttribute("invalid", true);
					return "redirect:/ageError";
				}
			}
			model.addAttribute("newLogin", new LoginUser());
			model.addAttribute("invalid", true);
			return "login.jsp";
			
		} else {
			Boolean age = userServ.getAge(newUser.getDob());
			if(age == false) {
				model.addAttribute("newLogin", new LoginUser());
				model.addAttribute("invalid", true);
				return "redirect:/ageError";
			} else {
				//TODO later: store ID from DB in session (log them in)
				session.setAttribute("userId", inputUser.getId());
				return "redirect:/dashboard";
				}
			}
		}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		User loggedUser = userServ.findUserByEmail(newLogin.getEmail());
		User user = userServ.login(newLogin, result, loggedUser);
		if(user == null) {
			model.addAttribute("invalid", false);
			model.addAttribute("newUser", new User());
			return "login.jsp";
		} else {
			session.setAttribute("userId", user.getId());
			return "redirect:/dashboard";
		}
	}


	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		Long uid = (Long) session.getAttribute("userId");
		User user = userServ.getById(uid);
		if(user == null) {
			return "error.jsp";
		} else  {
			model.addAttribute("newest", postServ.getTopByZip(user.getZipcode()));
			model.addAttribute("user", user);
			model.addAttribute("listings", postServ.getAllListings());
			return "dashboard.jsp";
		}
	}
	
	@RequestMapping("/ageError")
	public String flashMessage(RedirectAttributes redirectAttributes, Model model, HttpSession session) {
		redirectAttributes.addFlashAttribute("ageError", "You must be 13 years old to create an account.");
		model.addAttribute("invalid", true);
		session.setAttribute("session", true);
		return "redirect:/";
	}
	
	@GetMapping("/account/{id}")
	public String accountSettings(@PathVariable("id") Long id, HttpSession session, Model model) {
		Long uid = (Long) session.getAttribute("userId");
		User user = userServ.getById(id);
		if(id == null) {
			return "error.jsp";
		} else if(uid != id) {
			return "error.jsp";
		} else  {
		model.addAttribute("user", user);
		return "accountSettings.jsp";
		}
	}
	
	@PutMapping("/account/update/{id}")
	public String updateAccount(@PathVariable("id") Long id, @Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		Long uid = (Long) session.getAttribute("userId");
		User thisUser = userServ.getById(uid);
		if(uid == null) {
			return "error.jsp";
		} else {
			if(result.hasErrors()) {
				return "accountSettings.jsp";
			} else {
				user.setPassword(thisUser.getPassword());
				userServ.updateUser(user, result);
				return "redirect:/dashboard";
			}
		}
	}
}

