package com.laji.constant;

/**
 * 常量类
 * @author lsq
 * @date 2019年12月6日 下午7:30:47
 */
public interface SysConstast {
	
	/**
	 * 登录信息
	 */
	String USER_LOGIN_ERROR_MSG = "用户名或密码不正确";
	
	/**
	 * 是否展开
	 */
	Integer SPREAD_TRUE = 1;
	Integer SPREAD_FALSE = 0;
	
	
	/**
	 * 操作状态
	 */
	String ADD_SUCCESS="添加成功";
	String ADD_ERROR="添加失败";
	
	String UPDATE_SUCCESS="更新成功";
	String UPDATE_ERROR="更新失败";
	
	String DELETE_SUCCESS="删除成功";
	String DELETE_ERROR="删除失败";
	
	String RESET_SUCCESS="重置成功";
	String RESET_ERROR="重置失败";
	
	String DISPATCH_SUCCESS="分配成功";
	String DISPATCH_ERROR="分配失败";
	
	String ADD_ERROR_MORE = "借书超出上限";
	
	Integer CODE_SUCCESS=0; //操作成功
	Integer CODE_ERROR=-1;//失败

	String CODE_ZERO = "0";//复选框 未勾选
	String CODE_ONE = "1";//复选框 勾选

	Integer BE_BACk = 1;//已归还

}
