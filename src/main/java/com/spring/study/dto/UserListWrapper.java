package com.spring.study.dto;

import java.util.List;

public class UserListWrapper {
	private int id;
	private List<CustomUser> users;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<CustomUser> getUsers() {
		return users;
	}

	public void setUsers(List<CustomUser> users) {
		this.users = users;
	}



	
}
