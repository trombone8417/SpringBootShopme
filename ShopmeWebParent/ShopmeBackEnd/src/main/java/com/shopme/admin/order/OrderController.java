package com.shopme.admin.order;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopme.admin.paging.PagingAndSortingHelper;
import com.shopme.admin.paging.PagingAndSortingParam;
import com.shopme.admin.setting.SettingService;
import com.shopme.common.entity.Country;
import com.shopme.common.entity.order.Order;
import com.shopme.common.entity.order.OrderDetail;
import com.shopme.common.entity.product.Product;
import com.shopme.common.entity.setting.Setting;

@Controller
public class OrderController {
	private String defaultRedirectURL = "redirect:/orders/page/1?sortField=orderTime&sortDir=desc";
	
	@Autowired private OrderService orderService;
	@Autowired private SettingService settingService;

	@GetMapping("/orders")
	public String listFirstPage() {
		return defaultRedirectURL;
	}
	
	@GetMapping("/orders/page/{pageNum}")
	public String listByPage(
			@PagingAndSortingParam(listName = "listOrders", moduleURL = "/orders") PagingAndSortingHelper helper,
			@PathVariable(name = "pageNum") int pageNum,
			HttpServletRequest request) {

		orderService.listByPage(pageNum, helper);
		loadCurrencySetting(request);
		
		return "orders/orders";
	}
	
	private void loadCurrencySetting(HttpServletRequest request) {
		List<Setting> currencySettings = settingService.getCurrencySettings();
		
		for (Setting setting : currencySettings) {
			request.setAttribute(setting.getKey(), setting.getValue());
		}	
	}	
	
	@GetMapping("/orders/detail/{id}")
	public String viewOrderDetails(@PathVariable("id") Integer id, Model model, 
			RedirectAttributes ra, HttpServletRequest request) {
		try {
			Order order = orderService.get(id);
			loadCurrencySetting(request);			
			model.addAttribute("order", order);
			
			return "orders/order_details_modal";
		} catch (OrderNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
			return defaultRedirectURL;
		}
		
	}
	
	@GetMapping("/orders/delete/{id}")
	public String deleteOrder(@PathVariable("id") Integer id, Model model, RedirectAttributes ra) {
		try {
			orderService.delete(id);;
			ra.addFlashAttribute("message", "The order ID " + id + " has been deleted.");
		} catch (OrderNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
		}
		
		return defaultRedirectURL;
	}
	
	@GetMapping("/orders/edit/{id}")
	public String editOrder(@PathVariable("id") Integer id, Model model, RedirectAttributes ra,
			HttpServletRequest request) {
		try {
			Order order = orderService.get(id);;
			
			List<Country> listCountries = orderService.listAllCountries();
			
			model.addAttribute("pageTitle", "Edit Order (ID: " + id + ")");
			model.addAttribute("order", order);
			model.addAttribute("listCountries", listCountries);
			
			return "orders/order_form";
			
		} catch (OrderNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
			return defaultRedirectURL;
		}
		
	}	
	
	@PostMapping("/order/save")
	public String saveOrder(Order order, HttpServletRequest request, RedirectAttributes ra) {
	    String countryName = request.getParameter("countryName");
	    order.setCountry(countryName);
	    
	    updateProductDetails(order, request);	    
	    
	    orderService.save(order);
	    
	    ra.addFlashAttribute("message", "The order ID " + order.getId() + " has been updated successfully");
	    
	    return defaultRedirectURL;
	}

    private void updateProductDetails(Order order, HttpServletRequest request) {
        String[] detailIds = request.getParameterValues("detailId");
        String[] productIds = request.getParameterValues("productId");
        String[] productCosts = request.getParameterValues("productCost");
        String[] productPrices = request.getParameterValues("productPrice");
        String[] quantities = request.getParameterValues("quantity");
        String[] productSubtotals = request.getParameterValues("productSubtotal");
        String[] productShipCost = request.getParameterValues("productShipCost");
        
        Set<OrderDetail> orderDetails = order.getOrderDetails();
    
        for (int i = 0; i < detailIds.length; i++) {
            System.out.println("Detail ID: " + detailIds[i]);
            System.out.println("\t Product ID: " + productIds[i]);
            System.out.println("\t Cost: " + productCosts[i]);
            System.out.println("\t Quantity: " + quantities[i]);
            System.out.println("\t Subtotal: " + productSubtotals[i]);
            System.out.println("\t Ship cost: " + productShipCost[i]);
            
            OrderDetail orderDetail = new OrderDetail();
            Integer detailId = Integer.parseInt(detailIds[i]);
            if (detailId > 0) {
                orderDetail.setId(detailId);
            }
            
            orderDetail.setOrder(order);
            orderDetail.setProduct(new Product(Integer.parseInt(productIds[i])));
            orderDetail.setProductCost(Float.parseFloat(productCosts[i]));
            orderDetail.setSubtotal(Float.parseFloat(productSubtotals[i]));
            orderDetail.setShippingCost(Float.parseFloat(productShipCost[i]));
            orderDetail.setQuantity(Integer.parseInt(quantities[i]));
            orderDetail.setUnitPrice(Float.parseFloat(productPrices[i]));
            
            orderDetails.add(orderDetail);
        }
    
    }
	
}



















