package kr.co.hta.service;

import java.util.List;
import java.util.Map;

import kr.co.hta.vo.Cart;
import kr.co.hta.vo.Product;

public interface CartService {

	void addCart(Cart cart);
	Cart getCartByProductNoAndUserId(int productNo, String userId);
	
	void removeCart(int productNo, String userId);
}
