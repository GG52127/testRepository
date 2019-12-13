package com.csg.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csg.mapper.StudentMapper;
import com.csg.service.StudentService;
import com.github.pagehelper.PageHelper;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper studentMapper;

	@Override
	public Map<String, Object> getStudents(int page, int rows) {
		// TODO Auto-generated method stub
		Map<String, Object> msg = new HashMap<>();
		msg.put("total", studentMapper.selectStudentCount());
		PageHelper.startPage(page, rows);
		msg.put("rows", studentMapper.selectStudents());
		return msg;
	}

}
