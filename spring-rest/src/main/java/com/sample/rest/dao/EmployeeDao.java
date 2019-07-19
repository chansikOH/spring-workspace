package com.sample.rest.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sample.rest.vo.Department;
import com.sample.rest.vo.Employee;
import com.sample.rest.vo.Job;

@Repository
public class EmployeeDao {

	@Autowired
	private JdbcTemplate template;
	
	/**
	 * 지정된 사원아이디에 해당되는 사원정보를 삭제합니다.
	 * @param employeeid 삭제할 사원 아이디
	 */
	public void removeEmployee(int employeeid) {
		String sql = "delete from employees where employee_id = ?";
		template.update(sql, employeeid);
	}
	
	/**
	 * 새로운 사원을 등록한다.
	 * @param employee 신규 사원정보를 포함하고 있는 Employee 객체
	 */
	public void addEmployee(Employee employee) {
		String sql = "insert into employees values(employees_seq.nextval, ?,?,?,?,?,?,?,?,?,?)";
		
		template.update(sql, 
						employee.getFirstName(),
						employee.getLastName(),
						employee.getEmail(),
						employee.getPhoneNumber(),
						employee.getHireDate(),
						employee.getJobId(),
						employee.getSalary(),
						employee.getCommissionPct(),
						employee.getManagerId(),
						employee.getDepartmentId());
	}
	
	/**
	 * 모든 직종을 조회한다.
	 * @return 직종 목록
	 */
	public List<Job> getAlljobs() {
		String sql = "select * from jobs order by job_id asc";
		
		return template.query(sql, new RowMapper<Job>() {
			@Override
			public Job mapRow(ResultSet rs, int rowNum) throws SQLException {
				Job job = new Job();
				job.setId(rs.getString("job_id"));
				job.setTitle(rs.getString("job_title"));
				job.setMinSalary(rs.getInt("min_salary"));
				job.setMaxSalary(rs.getInt("max_salary"));
				
				return job;
			}
		});
	}
	
	/**
	 * 모든 매니저들을 조회한다.
	 * @return 매니저 목록
	 */
	public List<Employee> getAllManagers() {
		String sql = "select * from employees where employee_id in (select distinct manager_id from employees) order by employee_id asc";
		
		return template.query(sql, new RowMapper<Employee>() {
			@Override
			public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
				Employee emp = new Employee();
				emp.setId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				emp.setEmail(rs.getString("email"));
				emp.setPhoneNumber(rs.getString("phone_number"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setJobId(rs.getString("job_id"));
				emp.setSalary(rs.getDouble("salary"));
				emp.setCommissionPct(rs.getDouble("commission_pct"));
				emp.setManagerId(rs.getInt("manager_id"));
				emp.setDepartmentId(rs.getInt("department_id"));
				
				return emp;
			}
		});
	}
	
	/**
	 * 모든 부서정보를 조회한다.
	 * @return 부서 목록
	 */
	public List<Department> getAllDepartments() {
		String sql = "select * from departments order by department_id";
		
		return template.query(sql, new RowMapper<Department>() {
			@Override
			public Department mapRow(ResultSet rs, int rowNum) throws SQLException {
				Department dept = new Department();
				dept.setId(rs.getInt("department_id"));
				dept.setName(rs.getString("department_name"));
				dept.setManagerId(rs.getInt("manager_id"));
				dept.setLocationId(rs.getInt("location_id"));
				
				return dept;
			}
		});
	}
	
	/**
	 * 지정된 부서 아이디에 소속된 사원들을 조회한다.
	 * @param deptId 조회할 부서 아이디
	 * @return 해당 부서에 소속된 사원목록
	 */
	public List<Employee> getEmployeesByDeptId(int deptId) {
		String sql = "select * from employees where department_id = ? order by employee_id";
		
		return template.query(sql, new RowMapper<Employee>() {
			@Override
			public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
				Employee emp = new Employee();
				emp.setId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				emp.setEmail(rs.getString("email"));
				emp.setPhoneNumber(rs.getString("phone_number"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setJobId(rs.getString("job_id"));
				emp.setSalary(rs.getDouble("salary"));
				emp.setCommissionPct(rs.getDouble("commission_pct"));
				emp.setManagerId(rs.getInt("manager_id"));
				emp.setDepartmentId(rs.getInt("department_id"));
				
				return emp;
			}
		}, deptId);
	}
	
	/**
	 * 지정된 사원 아이디에 해당하는 사원 정보를 조회한다.
	 * @param employeeId 조회할 사원 아이디
	 * @return 사원 정보
	 */
	public Employee getEmployeeById(int employeeId) {
		String sql = "select * from employees where employee_id = ?";
		
		return template.queryForObject(sql, new RowMapper<Employee>() {
			@Override
			public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
				Employee emp = new Employee();
				emp.setId(rs.getInt("employee_id"));
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				emp.setEmail(rs.getString("email"));
				emp.setPhoneNumber(rs.getString("phone_number"));
				emp.setHireDate(rs.getDate("hire_date"));
				emp.setJobId(rs.getString("job_id"));
				emp.setSalary(rs.getDouble("salary"));
				emp.setCommissionPct(rs.getDouble("commission_pct"));
				emp.setManagerId(rs.getInt("manager_id"));
				emp.setDepartmentId(rs.getInt("department_id"));
				
				return emp;
			}
		}, employeeId);
	}
}
