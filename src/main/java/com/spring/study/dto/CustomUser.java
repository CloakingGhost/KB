package com.spring.study.dto;

public class CustomUser {
	private String name;
	private String password;
	private int age;

	private Address address;
	
	public CustomUser() {
	}

//	public CustomUser(String name, String password, int age) {
//		this.name = name;
//		this.password = password;
//		this.age = age;
//	}

	// Getters and Setters
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
}
