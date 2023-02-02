package com.jamielopez.solo.services;


import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.jamielopez.solo.models.LoginUser;
import com.jamielopez.solo.models.User;
import com.jamielopez.solo.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;

	public User register(User newUser, BindingResult result) {
		Optional<User> inputUser = userRepo.findByEmail(newUser.getEmail());
		if(result.hasErrors()) {
			return null;
		} else {
			if(inputUser.isPresent()) {
				result.rejectValue("email", "duplicate", "An account is already registered with this email address. Please log in.");
				return null;
			} else if (!newUser.getPassword().equals(newUser.getConfirm())) {
				result.rejectValue("confirm", "matches", "The passwords entered do not match.");
				return null;
			} else {
				String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
				newUser.setPassword(hashed);
				return userRepo.save(newUser);
			}
		}
	}

	public User login(LoginUser newLoginObject, BindingResult result, User user) {
		if(result.hasErrors()) {
			return null;
		} else if(user == null) {
			result.rejectValue("email", "matches", "The email/password entered is invalid.");
			return null;
		} else {
			if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
				result.rejectValue("password", "matches", "You have entered an invalid username or password.");
				return null;
			} else {
				return user;
			}
		}
	}

	public User findUserByEmail(String email) {
		Optional<User> user = userRepo.findByEmail(email);
		if(user.isPresent()) {
			return user.get();
		} else {
			return null;
		}
	}

	public User getById(Long id) {
		Optional<User> user = userRepo.findById(id);
		if(user.isPresent()) {
			return user.get();
		} else {
			return null;
		}
	}
	
	public Boolean getAge(LocalDate dob1) {
		LocalDate today = LocalDate.now();
		int age = (int) ChronoUnit.YEARS.between(dob1, today);
		if(age < 13) {
			System.out.print(age);
			return false;
		} else {
			return true;
		}
	}
	
	public User updateUser(User user, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		} else {
			return userRepo.save(user);	
		}
	}
	
}
