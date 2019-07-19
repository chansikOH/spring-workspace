package kr.co.hta.dao;

import java.util.List;
import java.util.Map;

import kr.co.hta.vo.Cart;

public interface CartDao {

	void addCart(Cart cart);
	Cart getCartByProductNoAndUserId(Map<String, Object> map);
	void removeCart(Map<String, Object> map);
}
