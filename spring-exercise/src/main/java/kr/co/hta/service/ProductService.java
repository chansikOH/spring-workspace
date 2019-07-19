package kr.co.hta.service;

import java.util.List;
import java.util.Map;

import kr.co.hta.vo.Category;
import kr.co.hta.vo.Product;

public interface ProductService {

	List<Product> getNEWProducts();
	List<Product> getRECOMMENDProducts();
	List<Product> getAllNewProducts();
	List<Product> getAllRecommendProducts();
	
	List<Product> getProductsByCategoryId(String categoryId);
	List<Category> getAllCategories();
	
	List<Product> getProductsByUserCart(String userId);
	
	List<Product> getAllProducts();
	Product getProductByNo(int productNo);
	void updateProduct(Product product);
}
