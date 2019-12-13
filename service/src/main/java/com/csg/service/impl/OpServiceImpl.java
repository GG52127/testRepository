package com.csg.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csg.mapper.OpMapper;
import com.csg.mapper.PermissionMapper;
import com.csg.model.PermissionTree;
import com.csg.model.Person;
import com.csg.service.OpService;
import com.github.pagehelper.PageHelper;

@Service("opService")
public class OpServiceImpl implements OpService {

	@Autowired
	private OpMapper opMapper;
	@Autowired
	private PermissionMapper permissionMapper;

	@Override
	public Map<String, Object> login(String name, HttpSession session) {
		// TODO Auto-generated method stub
		Map<String, Object> msg = new HashMap<String, Object>();
		Person t = opMapper.selectByName(name);
		if (t != null) {
			session.setAttribute("person", t);
			msg.put("msg", 1);
		} else {
			msg.put("msg", 0);
		}
		return msg;
	}

	@Override
	public List<PermissionTree> getAllPermission() {
		return permissionMapper.selectPermissionByTop();
	}

	@Override
	public Map<String, Object> showPersonsNotPermission(int start, int size) {
		// TODO Auto-generated method stub
		Map<String, Object> msg = new HashMap<>();
		msg.put("total", opMapper.selectPersonCount());
		PageHelper.startPage(start, size);
		msg.put("rows", opMapper.showPersonsNotPermission());
		return msg;
	}

	@Override
	public Map<String, Object> savePermission(int pid, int[] permissionIds) {
		// TODO Auto-generated method stub
		Map<String, Object> msg = new HashMap<>();
		int rs = opMapper.insertPermissionWithPid(pid, permissionIds);
		System.out.println(rs);
		if (rs >= 1) {
			msg.put("msg", 1);
		} else {
			msg.put("msg", 0);
		}
		return msg;
	}

	@Override
	public Map<String, Object> getPermissionWithId(int pid) {
		// TODO Auto-generated method stub
		Map<String, Object> msg = new HashMap<>();
		List<Integer> allids = opMapper.selectPermissionWithId(0);
		List<Integer> ids = opMapper.selectPermissionWithId(pid);
		if (allids.size() == ids.size()) {
			msg.put("msg", 0);
		} else {
			msg.put("msg", allids.stream().filter(t -> !ids.contains(t)).collect(Collectors.toList()));
		}
		return msg;
	}
}
