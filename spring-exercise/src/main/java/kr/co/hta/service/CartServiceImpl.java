package kr.co.hta.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hta.dao.CartDao;
import kr.co.hta.vo.Cart;
import kr.co.hta.vo.Product;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDao cartDao;
	
	@Override
	public void addCart(Cart cart) {
		cartDao.addCart(cart);
	}
	
	@Override
	public Cart getCartByProductNoAndUserId(int productNo, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("userId", userId);
		return cartDao.getCartByProductNoAndUserId(map);
	}
	
	@Override
	public void removeCart(int productNo, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("userId", userId);
		
		cartDao.removeCart(map);
	}
}
