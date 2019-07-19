package kr.co.hta.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.co.hta.vo.Cart;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SqlMapClientTemplate template;
	
	@Override
	public void addCart(Cart cart) {
		template.insert("cart.addCart", cart);
	}
	
	@Override
	public Cart getCartByProductNoAndUserId(Map<String, Object> map) {
		return (Cart) template.queryForObject("cart.getCartByProductNoAndUserId", map);
	}
	
	@Override
	public void removeCart(Map<String, Object> map) {
		template.delete("cart.removeCart", map);
	}
}
