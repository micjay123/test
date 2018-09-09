package com.lcj.manage.controller;

import com.lcj.manage.dao.RightMapper;
import com.lcj.manage.dao.RoleMapper;
import com.lcj.manage.model.Right;
import com.lcj.manage.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RightMapper rightMapper;

    @RequestMapping("")
    public String role(Model model){
        List<Role> roles = roleMapper.selectAllRole2Right();
        System.out.println(roles);
        List<Right> rights = rightMapper.selectAllRight();
        System.out.println(rights);
        model.addAttribute("roleList",roles);
        model.addAttribute("rightList",rights);
        return "role";
    }

    /**
     * 角色添加
     * @param role 角色实体类
     * @param model
     */
    @ResponseBody
    @RequestMapping("/addRole/success")
    public void addRole(Role role, Model model){
        roleMapper.insertRole(role);
        model.addAttribute("msg","添加成功");
    }

    /**
     * 角色删除
     * @param role 角色实体类
     */
    @ResponseBody
    @RequestMapping("/delRole")
    public void delSector(Role role){
        if(role!=null)
            roleMapper.delRole(role);
        else
            System.out.println("error");
    }

    /**
     * 角色更改
     * @param role 角色实体类
     */
    @ResponseBody
    @RequestMapping("/editRole")
    public void editSector(Role role){
        if (role!=null)
            roleMapper.updateRoleById(role);
        else
            System.out.println("error");
    }
}
