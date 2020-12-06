package com.laji.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.config.SystemConfig;

@RestController
@RequestMapping("config")
public class ConfigController {
    @Autowired
    private SystemConfig systemConfig;
 
    @RequestMapping("value")
    public Object testValue(){
        Map<String,String> map = new HashMap<String, String>();
        map.put("makefee",systemConfig.makefee);
        map.put("validtime", systemConfig.validtime);
        return map;
    }
}
