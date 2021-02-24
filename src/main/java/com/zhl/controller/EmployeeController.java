package com.zhl.controller;

import com.zhl.dao.DepartmentDao;
import com.zhl.dao.EmployeeDao;
import com.zhl.entites.Department;
import com.zhl.entites.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private DepartmentDao departmentDao;

    @RequestMapping("/emps")
    public String getEmps(Model model){
        Collection<Employee> all = employeeDao.getAll();
        model.addAttribute("emps",all);
        return "list";
    }

    @RequestMapping("/toaddpage")
    public String toAddPage(Model model){
        //查出所有部门
        Collection<Department> departments = departmentDao.getDepartments();
        model.addAttribute("depts",departments);
        model.addAttribute("employee",new Employee());
        return "add";
    }

    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public String addEmp(Employee employee){
        System.out.println(employee);
        employeeDao.save(employee);
        //重定向到查询所有员工
        return "redirect:/emps";
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public String getEmp(@PathVariable("id") Integer id,Model model){
        //查出员工信息
        Employee employee = employeeDao.get(id);
        //放入请求域中
        model.addAttribute("employee",employee);
        Collection<Department> departments = departmentDao.getDepartments();
        model.addAttribute("depts",departments);
        return "edit";
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.PUT)
    public String updateEmp(@ModelAttribute("employee") Employee employee){
        System.out.println(employee);
        employeeDao.save(employee);
        return "redirect:/emps";
    }

    @ModelAttribute
    public void myModelAttribute(@RequestParam(value = "id",required = false) Integer id,Model model){
        if(id!=null){
            Employee employee = employeeDao.get(id);
            model.addAttribute("employee",employee);
        }
        System.out.println("hhaa");
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    public String deleteEmp(@PathVariable("id") Integer id){
        employeeDao.delete(id);
        System.out.println("hhaaaa");
        return "redirect:/emps";
    }
}
