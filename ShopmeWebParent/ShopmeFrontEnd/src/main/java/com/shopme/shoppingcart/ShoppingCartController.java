package com.shopme.shoppingcart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.shopme.Utility;
import com.shopme.common.entity.CartItem;
import com.shopme.common.entity.Customer;
import com.shopme.common.exception.CustomerNotFoundException;
import com.shopme.customer.CustomerService;

@Controller
public class ShoppingCartController {
	
	@Autowired private ShoppingCartService cartService;
	@Autowired private CustomerService customerService;
	
	@GetMapping("/cart")
	public String viewCart(Model model, HttpServletRequest request) {
		Customer customer = getAuthenticatedCustomer(request);
		List<CartItem> cartItems = cartService.listCartItems(customer);
		
		model.addAttribute("cartItems", cartItems);
		
		return "cart/shopping_cart";
	}

	
	private Customer getAuthenticatedCustomer(HttpServletRequest request) {
		String email = Utility.getEmailOfAuthenticationCustomer(request);
		
		return customerService.getCustomerByEmail(email);
	}

}






