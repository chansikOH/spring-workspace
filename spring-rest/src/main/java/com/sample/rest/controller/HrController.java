package com.sample.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.rest.dao.EmployeeDao;

@Controller
public class HrController {

	@Autowired
	private EmployeeDao employeeDao;
	
	@RequestMapping(value= {"/", "/home"})
	public String hr(Model model) {
		model.addAttribute("jobs", employeeDao.getAlljobs());
		model.addAttribute("managers", employeeDao.getAllManagers());
		model.addAttribute("departments", employeeDao.getAllDepartments());
		
		return "hr";
	}
}
