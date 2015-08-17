package com.mms.services;

import java.util.List;

import com.mms.conceptualModel.User;

public interface UserService {

	public List<User> getListUsers();
	
	public void addUser(User user);
	
}
