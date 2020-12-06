package com.laji.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 参数设置
 * @author lsq
 * @date 2019年12月14日 下午7:03:07
 */
@Component
public class SystemConfig {

	//借阅卡的办理费用
    @Value("${value.makefee}")
    public String makefee;
    //借阅有效期
    @Value("${value.validtime}")
    public String validtime;
}
