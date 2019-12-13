package com.csg.teacher.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csg.model.PermissionTree;
import com.csg.model.Teacher;
import com.csg.service.OpService;
import com.csg.service.StudentService;
import com.csg.service.TeacherService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Controller
@Api(value = "老师列表", tags = { "列表" })
public class OpController {

	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private OpService opService;

	@RequestMapping("getTeachers")
	@ResponseBody
	@ApiOperation(value = "查询所有老师", httpMethod = "POST")
	@ApiResponses(value = { @ApiResponse(code = 666, message = "获取正常") })
	public List<Teacher> getTeachers() {
		return teacherService.getTeachers();
	}

	@RequestMapping("getTeachersByPage")
	@ResponseBody
	@ApiOperation(value = "分页查询老师", httpMethod = "POST")
	public PageInfo<Teacher> getTeachersByPage() {
		PageHelper.startPage(1, 2);
		List<Teacher> list = teacherService.getTeachers();
		PageInfo<Teacher> p = new PageInfo<>(list);
		return p;
	}

	@RequestMapping("getTeachersById")
	@ResponseBody
	@ApiOperation(value = "ID查询老师", httpMethod = "POST")
	public List<Teacher> getTeachersById(
			@ApiParam(name = "id", value = "老师", required = true) @RequestParam("id") int id, HttpServletRequest req) {
		return teacherService.getTeachers();
	}

	@RequestMapping("showStudents")
	@ResponseBody
	public Map<String, Object> getStudents(@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int rows) {
		return studentService.getStudents(page, rows);
	}

	@RequestMapping("login")
	@ResponseBody
	public Map<String, Object> login(@RequestParam("user") String name, HttpSession session) {
		return opService.login(name, session);
	}

	@RequestMapping("{url}")
	public String actionUrl(@Param("url") String url) {
		return url;
	}

	@RequestMapping("showPermission")
	@ResponseBody
	public List<PermissionTree> showPermission(HttpSession session) {
		return opService.getAllPermission();
	}

	@RequestMapping("showPersonsNotPermission")
	@ResponseBody
	public Map<String, Object> showPersonsNotPermission(@RequestParam(value = "page") int start,
			@RequestParam(value = "rows") int size) {
		return opService.showPersonsNotPermission(start, size);
	}

	@RequestMapping("savePermission")
	@ResponseBody
	public Map<String, Object> savePermission(@RequestParam("pid") int pid,
			@RequestParam("permissionIds") int[] permissionIds) {
		return opService.savePermission(pid, permissionIds);
	}

	@RequestMapping("showPermissionWithId")
	@ResponseBody
	public Map<String, Object> showPermissionWithId(@RequestParam("pid") int pid) {
		return opService.getPermissionWithId(pid);
	}

	@RequestMapping("showNotPermissionWithId")
	@ResponseBody
	public Map<String, Object> showNotPermissionWithId(@RequestParam("pid") int pid) {
		return opService.getPermissionWithId(pid);
	}
}
