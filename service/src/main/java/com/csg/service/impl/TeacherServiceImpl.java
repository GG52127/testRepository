package com.csg.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csg.mapper.TeacherMapper;
import com.csg.model.Teacher;
import com.csg.service.TeacherService;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {

	private static Logger LOG = Logger.getLogger(TeacherService.class);

	@Autowired
	private TeacherMapper teacherMapper;

	@Override
	@Transactional
	public List<Teacher> getTeachers() {
		// TODO Auto-generated method stub
		LOG.info("get teachers!");
		return teacherMapper.getTeachers();
	}

}
