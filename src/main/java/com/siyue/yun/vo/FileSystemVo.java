package com.siyue.yun.vo;

public class FileSystemVo {

	private Long id;
	private String name;
	private String dir;
	private String pdir;
	private String type;
	private String date;
	private String size;
	private String viewflag="N";
	
	private String ids;
	private String names;
	private String dirs;
	
	private String namep;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getPdir() {
		return pdir;
	}
	public void setPdir(String pdir) {
		this.pdir = pdir;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getDirs() {
		return dirs;
	}
	public void setDirs(String dirs) {
		this.dirs = dirs;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getNamep() {
		return namep;
	}
	public void setNamep(String namep) {
		this.namep = namep;
	}
	public String getViewflag() {
		return viewflag;
	}
	public void setViewflag(String viewflag) {
		this.viewflag = viewflag;
	}
}
