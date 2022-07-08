package com.shopme.customer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.shopme.common.exception.CustomerNotFoundException;

@Controller
public class ForgotPasswordController {
	@Autowired private CustomerService customerService;
	
	@GetMapping("/forgot_password")
	public String showRequestForm() {
		return "customer/forgot_password_form";
	}
	
	@PostMapping("/forgot_password")
	public String processRequestForm(HttpServletRequest request, Model model){
		String email = request.getParameter("email");
		try {
			String token = customerService.updateResetPasswordToken(email);
			System.out.println("Email: " + email);
			System.out.println("Token: " + token);
		} catch (CustomerNotFoundException e) {
			model.addAttribute("error", e.getMessage());
		}
		
		return "customer/forgot_password_form";
	}
}










