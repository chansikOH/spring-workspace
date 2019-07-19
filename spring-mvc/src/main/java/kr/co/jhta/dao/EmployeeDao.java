package kr.co.jhta.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jhta.vo.Employee;

@Repository
public class EmployeeDao {

	@Autowired
	private SqlMapClientTemplate template; 
	
	@SuppressWarnings("unchecked")
	public List<Employee> getEmployeesByDeptId(Integer deptId) {
		return template.queryForList("getEmployeesByDeptId", deptId);
	}
	
	public Employee getEmployeeById(Integer empId) {
		return (Employee) template.queryForObject("getEmployeeById", empId);
	}
	
	public void insertEmployee(Employee employee) {
		template.insert("insertEmployee", employee);
	}
}
