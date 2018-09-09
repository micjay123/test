package com.lcj.manage.controller;

import com.google.gson.Gson;
import com.lcj.manage.dao.SectorMapper;
import com.lcj.manage.dao.UserMapper;
import com.lcj.manage.model.Sector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/sector")
public class SectorController {
    @Autowired
    private SectorMapper sectorMapper;

    @RequestMapping("")
    public String addSector(Model model){
        List<Sector> sectors = sectorMapper.selectAllSector();
        model.addAttribute("sectorList",sectors);
        return "sector";
    }

    /**
     * 部门添加
     * @param sector 部门实体类
     * @param model
     */
    @ResponseBody
    @RequestMapping("/addSector/success")
    public void addSector(Sector sector, Model model){
        sectorMapper.insertSector(sector);
        model.addAttribute("msg","添加成功");
    }

    /**
     * 部门删除
     * @param sector 部门实体类
     */
    @ResponseBody
    @RequestMapping("/delSector")
    public void delSector(Sector sector){
        if(sector!=null)
            sectorMapper.delSector(sector);
        else
            System.out.println("error");
    }

    /**
     * 部门更改
     * @param sector 部门实体类
     */
    @ResponseBody
    @RequestMapping("/editSector")
    public void editSector(Sector sector){
        if (sector!=null)
            sectorMapper.updateSectorById(sector);
        else
            System.out.println("error");
    }


    @ResponseBody
    @RequestMapping("/getcount")
    public String getCount(){
        List<Sector> usersector = sectorMapper.countSector();
        return new Gson().toJson(usersector);
    }
}
