package com.mms.services.impl;

import java.util.ArrayList;
import java.util.List;

import com.mms.conceptualModel.User;
import com.mms.services.UserService;

public class MMSUserService implements UserService {

	private final static List<User> users = new ArrayList<User>();

	@Override
	public List<User> getListUsers() {
		return users;
	}

	@Override
	public void addUser(User user) {
		users.add(user);
	}

}
