package kr.co.hta.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hta.dao.ProductDao;
import kr.co.hta.vo.Category;
import kr.co.hta.vo.Product;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	public List<Product> getNEWProducts() {
		String keyword = "NEW";
		return productDao.getTopNproductsByKeyword(keyword);
	}
	
	@Override
	public List<Product> getRECOMMENDProducts() {
		String keyword = "RECOMMEND";
		return productDao.getTopNproductsByKeyword(keyword);
	}
	
	@Override
	public List<Product> getAllNewProducts() {
		String keyword = "NEW";
		return productDao.getAllProductsByKeyword(keyword);
	}
	
	@Override
	public List<Product> getAllRecommendProducts() {
		String keyword = "RECOMMEND";
		return productDao.getAllProductsByKeyword(keyword);
	}
	
	@Override
	public List<Product> getProductsByCategoryId(String categoryId) {
		return productDao.getProductsByCategoryId(categoryId);
	}
	
	@Override
	public List<Category> getAllCategories() {
		return productDao.getAllCategories();
	}
	
	@Override
	public List<Product> getProductsByUserCart(String userId) {
		return productDao.getProductsByUserCart(userId);
	}
	
	@Override
	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}
	
	@Override
	public Product getProductByNo(int productNo) {
		return productDao.getProductByNo(productNo);
	}
	
	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}
}
