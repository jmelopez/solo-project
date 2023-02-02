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
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


	@Entity
	@Table(name = "postings")
	public class Posting {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Long id;

		@NotEmpty(message = "Title is required.")
		@Size(min = 2, max = 30, message = "Title must be between 2 and 30 characters.")
		private String title;
		
		@NotEmpty(message = "Address is required.")
		private String address;
		
		@NotEmpty(message = "City is required.")
		private String city;
		
		@NotEmpty(message = "State is required")
		@Size(max = 2, message="Please use 2 character state abbreviation")
		private String state;		
		
		@NotEmpty(message = "Zip code is required.")
		@Size(min =5, max = 5, message = "Zip code must be 5 digits.")
		private String zipcode;	
		
		@Future(message = "Event date cannot be in the past.")
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private LocalDate date;
		
		@NotEmpty(message = "Start time is required")
		private String start;
		
		@NotEmpty(message = "End time is required")
		private String end;

		@NotEmpty(message = "Description is required.")
		@Size(min = 2, max = 200, message="Description must be between 2 and 200 characters.")
		private String description;
		
		@Column(nullable = true)
		private String[] tags;
		
		private String lat;
		
		private String lng;

		@Column(updatable = false)
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date createdAt;

		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date updatedAt;
		
		@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
		@JoinTable(
				name = "saved_posts",
				joinColumns = @JoinColumn(name = "posting_id"),
				inverseJoinColumns = @JoinColumn(name = "user_id")
				)
		@ElementCollection
		private List<User> users;
		
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "userId")
		private User user;
		

		public Posting()  {}

		@PrePersist
		protected void onCreate() {
			this.createdAt = new Date();
		}

		@PreUpdate
		protected void onUpdate() {
			this.updatedAt = new Date();
		}

		public Date getCreatedAt() {
			return createdAt;
		}

		public List<User> getUsers() {
			return users;
		}

		public void setUsers(List<User> users) {
			this.users = users;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getZipcode() {
			return zipcode;
		}

		public void setZipcode(String zipcode) {
			this.zipcode = zipcode;
		}

		public LocalDate getDate() {
			return date;
		}

		public void setDate(LocalDate date) {
			this.date = date;
		}

		public String getStart() {
			return start;
		}

		public void setStart(String start) {
			this.start = start;
		}

		public String getEnd() {
			return end;
		}

		public void setEnd(String end) {
			this.end = end;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String[] getTags() {
			return tags;
		}

		public void setTags(String[] tags) {
			this.tags = tags;
		}

		public String getLat() {
			return lat;
		}

		public void setLat(String lat) {
			this.lat = lat;
		}

		public String getLng() {
			return lng;
		}

		public void setLng(String lng) {
			this.lng = lng;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
		
}