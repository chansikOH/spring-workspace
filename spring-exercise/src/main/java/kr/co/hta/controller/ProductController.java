package kr.co.hta.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hta.service.CartService;
import kr.co.hta.service.ProductService;
import kr.co.hta.vo.Cart;
import kr.co.hta.vo.Product;
import kr.co.hta.vo.User;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/category.do")
	public String category(Model model) {
		model.addAttribute("categories", productService.getAllCategories());
		return "product/category";
	}
	
	@RequestMapping("/cateProduct.do")
	public @ResponseBody List<Product> cartProduct(String dataId) {
		System.out.println("시작");
		if(dataId.equals("new")) {
			return productService.getAllNewProducts();
		}
		
		if(dataId.equals("rec")) {
			return productService.getAllRecommendProducts();
		}
		
		return productService.getProductsByCategoryId(dataId);
	}
	
	@RequestMapping("/cart.do")
	public String cart(Model model, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		model.addAttribute("products", productService.getProductsByUserCart(user.getId()));
		return "product/cart";
	}
	
	@RequestMapping("/addCart.do")
	public @ResponseBody String addCart(@RequestParam("proNo") int productNo, HttpSession session
								, Model model, HttpServletRequest request) {
		User user = (User) session.getAttribute("LOGIN_USER");
		if(user == null) {
			return "login";
		}
		Cart cart = cartService.getCartByProductNoAndUserId(productNo, user.getId());
		String check = null;
		if(cart != null) {
			check = "check";
			return check;
		}
		
		cart = new Cart();
		cart.setProductNo(productNo);
		cart.setUserId(user.getId());
		
		cartService.addCart(cart);
		
		return check;
	}
	
	@RequestMapping("/removeCart.do")
	public String removeCart(@RequestParam("proNo") int productNo, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		cartService.removeCart(productNo, user.getId());
		
		return "redirect:cart.do";
	}
}
