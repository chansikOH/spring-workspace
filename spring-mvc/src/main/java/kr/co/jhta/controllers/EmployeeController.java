package kr.co.jhta.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.dao.DepartmentDao;
import kr.co.jhta.dao.EmployeeDao;
import kr.co.jhta.dao.JobDao;
import kr.co.jhta.form.EmployeeForm;
import kr.co.jhta.vo.Department;
import kr.co.jhta.vo.Employee;
import kr.co.jhta.vo.Job;

@Controller
@RequestMapping("/emp")
public class EmployeeController {
	
	@Autowired
	private DepartmentDao deptDao;
	@Autowired
	private EmployeeDao empDao;
	@Autowired
	private JobDao jobDao;
	
	@RequestMapping("/depts.do")
	public String depts(Model model) {
		List<Department> depts = deptDao.getAllDepartment();
		model.addAttribute("depts", depts);
		
		return "emp/depts";
	}
	
	@RequestMapping("/employees.do")
	public String employees(Integer deptid, Model model) {
		List<Employee> employees = empDao.getEmployeesByDeptId(deptid);
		Department department = deptDao.getDepartmentByDeptId(deptid);
		model.addAttribute("employees", employees);
		model.addAttribute("dept", department);
		
		return "emp/employees";
	}
	
	@RequestMapping("/employee.do")
	public String employee(Integer empid, Model model) {
		Employee employee = empDao.getEmployeeById(empid);
		model.addAttribute("employee", employee);
		
		return "emp/employee";
	}
	
	@RequestMapping("/form.do")
	public String form(Model model) {
		List<Department> depts = deptDao.getAllDepartment();
		List<Integer> deptIds = new ArrayList<Integer>();
		List<Integer> managerIds = new ArrayList<Integer>();
		for(Department dept : depts) {
			deptIds.add(dept.getDepartmentId());
			if(dept.getManagerId() != null) {
				managerIds.add(dept.getManagerId());
			}
		}
		
		List<Job> jobs = jobDao.getAllJobs();
		List<String> jobIds = new ArrayList<String>();
		for (Job job : jobs) {
			jobIds.add(job.getId());
		}
		
		model.addAttribute("deptIds", deptIds);
		model.addAttribute("managerIds", managerIds);
		model.addAttribute("jobIds", jobIds);
		
		return "emp/form";
	}
	
	@RequestMapping("/add.do")
	public String add(Employee employee) {
		empDao.insertEmployee(employee);
		
		return "redirect:depts.do";
	}

	/*
	@RequestMapping("/main.do")
	public String main(Model model) {
		// 최근에 가입된 사원정보 조회
		// 조회된 정보를 모델에 담아서 view 페이지에 전달
		return "emp/main";
	}
	
	@RequestMapping("/detail.do")
	public String detail(String id, int pno, Model model) {
		// EmployeeDao dao = new EmployeeDao();
		// Employee emp = dao.getEmployeeById(id);
		// model.addAttribute("employee", emp);
		
		HashMap<String, Object> emp = new HashMap<String, Object>();
		emp.put("id", id);
		emp.put("name", "홍길동");
		emp.put("dept", "영업1팀");
		
		model.addAttribute("employee", emp);
		
		return "emp/detail";
	}
	
	@RequestMapping("/registerform.do")
	public String registerform() {
		return "emp/form0";
	}
	
	@RequestMapping("/register.do")
	public String register(EmployeeForm emp) {
		System.out.println(emp);
		
		return "redirect:main.do";
	}
	*/
}
