package kr.co.jhta.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jhta.vo.Department;

@Repository
public class DepartmentDao {

	@Autowired
	private SqlMapClientTemplate template;
	
	@SuppressWarnings("unchecked")
	public List<Department> getAllDepartment() {
		return template.queryForList("getAllDepartment");
	}
	
	public Department getDepartmentByDeptId(Integer deptId) {
		return (Department) template.queryForObject("getDepartmentByDeptId", deptId);
	}
}
