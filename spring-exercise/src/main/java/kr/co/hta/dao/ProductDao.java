package kr.co.hta.dao;

import java.util.List;
import java.util.Map;

import kr.co.hta.vo.Category;
import kr.co.hta.vo.Product;

public interface ProductDao {

	List<Product> getTopNproductsByKeyword(String keyword);
	List<Product> getAllProductsByKeyword(String keyword);
	List<Product> getProductsByCategoryId(String categoryId);
	
	List<Category> getAllCategories();
	
	List<Product> getProductsByUserCart(String userId);
	
	Product getProductByNo(int productNo);
	List<Product> getAllProducts();
	void updateProduct(Product product);
}
