package com.lcj.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    /**
     * 主页的显示
     * 以及error页面的显示
     * @return
     */
    @RequestMapping("")
    public String table(){
        return "index";
    }
    @RequestMapping("/without_right")
    public String error(){
        return "noright";
    }
}
