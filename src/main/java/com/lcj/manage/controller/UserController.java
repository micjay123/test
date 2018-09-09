package com.lcj.manage.controller;
import com.lcj.manage.dao.RoleMapper;
import com.lcj.manage.dao.UserMapper;
import com.lcj.manage.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class UserController {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;

    @RequestMapping("register")
    public String register(){
        return "register";
    }

    @RequestMapping("login")
    public String login(){
        return "login";
    }
    @RequestMapping("modify")
    public String modify(){
        return "modifyKey";
    }

    /**
     * 用户注册
     * @param user 用户实体类
     * @param model 容器
     * @return
     */
    @PostMapping("checkReg")
    public String register(User user, Model model){
        userMapper.insertUser(user);
        model.addAttribute("success","注册成功！");
        return "login";
    }

    /**
     * 用户登录
     * @param user 用户实体类
     * @param session 将登录信息存储在session
     * @param request servlet请求
     * @return
     */
    @PostMapping("/checkLogin")
    public ModelAndView login(User user,HttpSession session,HttpServletRequest request){
        ModelAndView success=new ModelAndView("index");
        ModelAndView fail=new ModelAndView("login");
        if(userMapper.verifyUser(user)!=null){
            session.setAttribute("user",userMapper.verifyUser(user));
            User role=(User) request.getSession().getAttribute("user");
            session.setAttribute("name",roleMapper.selectRoleById(role.getR_id()));
            return success;
        }else {
            fail.addObject("fail","用户名或密码错误！");
            return fail;
        }
    }

    /**
     * 密码修改
     * @param user
     * @param request
     * @return
     */
    @PostMapping("/checkModify")
    public String modify(User user, HttpServletRequest request){
                User ret = userMapper.checkPass(user);
            if(ret!=null) {
                boolean value = ret.getPassword().
                        equals(request.getParameter("old_key"));
                if (value) {
                    userMapper.modifyPassword(user);
                    request.setAttribute("success","密码修改成功");
                    return "login";
                } else {
                    request.setAttribute("error", "原密码不匹配！");
                    return "modify";
                }
            }else {
                request.setAttribute("error", "用户不存在!");
                return "modify";
            }
    }

    /**
     * 用户注销
     * @param session remove session信息
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "login";
    }

//    @ResponseBody
    @RequestMapping("/json")
    public String json(){
        return "json";
    }
}
