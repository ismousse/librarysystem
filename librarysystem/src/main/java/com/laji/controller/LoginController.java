package com.laji.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.laji.constant.SysConstast;
import com.laji.domain.Admin;
import com.laji.service.AdminService;
import com.laji.utils.WebUtils;
import com.laji.vo.AdminVo;

@Controller
@RequestMapping("login")
public class LoginController {

	@Autowired
	private AdminService adminService;
	
	/*@Autowired
	private LogInfoService loginfoService;*/

	/**
	 * 跳转到登陆页面
	 */
	@RequestMapping("toLogin")
	public String toLogin() {
		return "backstage/main/login";
	}

	/**
	 * 登陆方法
	 */
	@RequestMapping("login")
	public String login(AdminVo adminVo, Model model) {
		Admin admin = this.adminService.login(adminVo);
		if(null != admin) {
			WebUtils.getHttpSession().setAttribute("admin", admin);
			// 记录登陆日志 向sys_login_log里面插入数据
			/*LogInfoVo logInfoVo = new LogInfoVo();
				logInfoVo.setLogintime(new Date());
				logInfoVo.setLoginname(user.getRealname() + "-" + user.getLoginname());
				logInfoVo.setLoginip(WebUtils.getHttpServletRequest().getRemoteAddr());
				loginfoService.addLogInfo(logInfoVo);*/
			return "backstage/main/index";
		}else {
			model.addAttribute("error", SysConstast.USER_LOGIN_ERROR_MSG);
			return "backstage/main/login";			
		}
	}

}

