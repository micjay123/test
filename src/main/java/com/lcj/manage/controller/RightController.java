package com.lcj.manage.controller;

import com.lcj.manage.dao.RightMapper;
import com.lcj.manage.model.Right;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/right")
public class RightController {
    @Autowired
    private RightMapper rightMapper;
    @RequestMapping("")
    public String right(Model model){
        List<Right> rights = rightMapper.selectAllRight();
        model.addAttribute("rightList",rights);
        return "right";
    }

    /**
     * 实现权限的添加
     * @param right 权限实体类
     * @param model 容器
     */
    @ResponseBody
    @RequestMapping("/addRight/success")
    public void addRight(Right right, Model model){
        rightMapper.insertRight(right);
        model.addAttribute("msg","添加成功");
    }

    /**
     * 删除权限
     * @param right 权限实体类
     */
    @ResponseBody
    @RequestMapping("/delRight")
    public void delSector(Right right){
        if(right!=null)
            rightMapper.delRight(right);
        else
            System.out.println("error");
    }

    /**
     * 更改权限
     * @param right 权限实体类
     */
    @ResponseBody
    @RequestMapping("/editRight")
    public void editSector(Right right){
        if (right!=null)
            rightMapper.updateRightById(right);
        else
            System.out.println("error");
    }
}
