package com.siyue.yun.ctrl.sys;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siyue.yun.base.BaseController;
import com.siyue.yun.vo.Menu;

@Controller
@RequestMapping("/emun")
public class EmunController extends BaseController{

	@ResponseBody
	@RequestMapping("/list")
	public List<Menu> list() throws Exception {
		return db.qureyAllEmun();
	}
}
