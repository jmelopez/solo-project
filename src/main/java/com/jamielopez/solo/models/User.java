package com.jamielopez.solo.models;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;




@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "First Name is required.")
	@Size(min = 2, max = 30, message = "First name must be between 2 and 30 characters.")
	private String firstName;
	
	@NotEmpty(message = "Last Name is required.")
	@Size(min = 2, max = 30, message = "Last name must be between 2 and 30 characters.")
	private String lastName;
	
	@Column(updatable = false)
	@Past(message = "Birthdate cannot be in the future.")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate dob;
	
	@NotEmpty(message = "Zip code is required.")
	@Size(min =5, max = 5, message = "Zip code must be 5 digits.")
	private String zipcode;	

	@NotEmpty(message = "Email address is required.")
	@Email(message = "Please enter a valid email address.")
	private String email;
	
	@Column(nullable = false)
	@Size(min = 8, max = 128, message="Password is required and must be at least 8 characters.")
	private String password;
	
	@Transient
	@Size(min = 8, max = 128, message = "Password must be at least 8 characters.")
	private String confirm;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
	@JoinTable(
			name = "saved_posts",
			joinColumns = @JoinColumn(name = "user_id"),
			inverseJoinColumns = @JoinColumn(name = "posting_id")
			)
	@ElementCollection
	private List<Posting> posts;
	
	public User()  {}
	
	public User(String firstName, String lastName, String email, String zipcode) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.zipcode = zipcode;
		this.email = email;
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public List<Posting> getPosts() {
		return posts;
	}

	public void setPosts(List<Posting> posts) {
		this.posts = posts;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}


	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
}
