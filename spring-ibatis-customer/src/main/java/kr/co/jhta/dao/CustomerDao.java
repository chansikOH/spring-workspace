package kr.co.jhta.dao;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import kr.co.jhta.vo.Customer;

public class CustomerDao {

	private SqlMapClientTemplate template;
	public void setTemplate(SqlMapClientTemplate template) {
		this.template = template;
	}
	
	@SuppressWarnings("unchecked")
	public List<Customer> getAllCustomers() {
		return template.queryForList("getAllCustomers");
	}
	
	public Customer getCustomerByNo(int custNo) {
		return (Customer) template.queryForObject("getCustomerByNo", custNo);
	}
	
	public void insertCustomer(Customer customer) {
		template.insert("insertCustomer", customer);
	}
	
	@SuppressWarnings("unchecked")
	public List<Customer> getCustomersBySearch(Map<String, Object> map) {
		return template.queryForList("getCustomersBySearch", map);
	}
	
	public void updateCustomer(Customer customer) {
		template.update("updateCustomer", customer);
	}
	
	public void deleteCustomerByNo(int custNo) {
		template.delete("deleteCustomerByNo", custNo);
	}
}
