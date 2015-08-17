package com.mms.resources;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mms.conceptualModel.User;
import com.mms.services.UserService;

@Controller
public class UserResource {
	
	private static final Logger logger = LoggerFactory.getLogger(UserResource.class);
	private UserService userService;

	//instantiate user Service
	@Autowired
	public void setService(UserService userService){
		this.userService = userService;
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! ");
		return "home";
	}
	
	@RequestMapping(value = "/getusers", method = RequestMethod.GET )
	public @ResponseBody List<User> getUserDetails() {
		return userService.getListUsers();
	}
	
	@RequestMapping(value = "/adduser", method = RequestMethod.POST )
	public @ResponseBody List<User>  addUser(@RequestBody User user) {
		userService.addUser(user);
		return userService.getListUsers();
	}
}