package com.csg.model;

import java.util.List;

public class PermissionTree {

	private int id;
	private String text;
	private String urlString;
	private List<PermissionTree> children;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUrlString() {
		return urlString;
	}

	public void setUrlString(String urlString) {
		this.urlString = urlString;
	}

	public List<PermissionTree> getChildren() {
		return children;
	}

	public void setChildren(List<PermissionTree> children) {
		this.children = children;
	}

}
