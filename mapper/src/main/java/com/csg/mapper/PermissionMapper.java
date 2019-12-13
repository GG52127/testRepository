package com.csg.mapper;

import java.util.List;

import com.csg.model.PermissionTree;

public interface PermissionMapper {

	public List<PermissionTree> selectPermissionByTop();
}
