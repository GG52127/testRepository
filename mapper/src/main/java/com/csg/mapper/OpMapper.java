package com.csg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.csg.model.Person;

public interface OpMapper {

	public Person selectByName(@Param("name") String name);

	public List<Person> showPersonsNotPermission();

	public int insertPermissionWithPid(@Param("pid") int pid, @Param("permissionIds") int[] permissionIds);

	public int selectPersonCount();

	public List<Integer> selectPermissionWithId(@Param("pid") int pid);
}
