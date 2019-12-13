package com.csg.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.csg.model.PermissionTree;

public interface OpService {

	public Map<String, Object> login(String name, HttpSession session);

	public List<PermissionTree> getAllPermission();

	public Map<String, Object> showPersonsNotPermission(int start, int size);

	public Map<String, Object> savePermission(int pid, int[] permissionIds);

	public Map<String, Object> getPermissionWithId(int pid);
}
