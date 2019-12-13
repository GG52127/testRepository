package com.csg.mapper;

import java.util.List;

import com.csg.model.Student;

public interface StudentMapper {

	public int selectStudentCount();

	public List<Student> selectStudents();
}
