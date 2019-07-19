package kr.co.hta.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.co.hta.vo.Category;
import kr.co.hta.vo.Product;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SqlMapClientTemplate template;
	
	@Override
	public List<Product> getTopNproductsByKeyword(String keyword) {
		return template.queryForList("product.getTopNproductsByKeyword", keyword);
	}
	
	@Override
	public List<Product> getAllProductsByKeyword(String keyword) {
		return template.queryForList("product.getAllProductsByKeyword", keyword);
	}
	
	@Override
	public List<Product> getProductsByCategoryId(String categoryId) {
		return template.queryForList("product.getProductsByCategoryId", categoryId);
	}
	
	@Override
	public List<Category> getAllCategories() {
		return template.queryForList("product.getAllCategories");
	}
	
	@Override
	public List<Product> getProductsByUserCart(String userId) {
		return template.queryForList("product.getProductsByUserCart", userId);
	}
	
	@Override
	public List<Product> getAllProducts() {
		return template.queryForList("product.getAllProducts");
	}
	
	@Override
	public Product getProductByNo(int productNo) {
		return (Product) template.queryForObject("product.getProductByNo", productNo);
	}
	
	@Override
	public void updateProduct(Product product) {
		template.update("product.updateProduct", product);
	}
}
