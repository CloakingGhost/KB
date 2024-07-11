package com.spring.study.dto;

import java.util.List;

public class UserListWrapper {
	private List<CustomUser> users;

	public List<CustomUser> getUsers() {
		return users;
	}

	public void setUsers(List<CustomUser> users) {
		this.users = users;
	}

}
