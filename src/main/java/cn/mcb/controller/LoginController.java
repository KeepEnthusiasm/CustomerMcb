package cn.mcb.controller;

import cn.mcb.pojo.Admin;
import cn.mcb.pojo.User;
import cn.mcb.service.serviceImpl.UserServiceImpl;
import cn.mcb.utils.CheckCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.util.List;

@Controller
@SessionAttributes("uname")
public class LoginController {
    @Autowired
    private UserServiceImpl userService;
    private String check_Code;
    @RequestMapping("/userLogin")
    @ResponseBody
    public String login( User user , String checkCode,ModelMap model) throws Exception{
        String Msg = "0" ;
       if (check_Code.equalsIgnoreCase(checkCode)) {
           User loginuser = userService.login(user);
           if (loginuser!=null){
               //用户名正确
               if (loginuser.getUstate().equals("1")){
                   Msg="1";
                   model.addAttribute("uname",loginuser.getUname());
                   return Msg;
               }else {
                   Msg="3";
                   return Msg;
               }
           }else{
              //用户名密码错误
               Msg="2";
               return Msg;
           }
       }else {
           //验证码输入错误，请重新输入
           Msg="4";
           return Msg;
       }

    }
    @RequestMapping("/adminLogin")
    @ResponseBody
    public String adminLogin( String aname,String apassword ,String checkCode,ModelMap model) throws Exception{
        System.out.println(aname+apassword);
        String Msg = "0" ;
        if (check_Code.equalsIgnoreCase(checkCode)) {
            Admin loginuser = userService.findAdmin(aname,apassword);
            if (loginuser!=null){
                //用户名正确
                Msg="1";
                model.addAttribute("uname",loginuser.getAname());
                return Msg;
            }else{
                //用户名密码错误
                Msg="2";
                return Msg;
            }
        }else {
            //验证码输入错误，请重新输入
            Msg="3";
            return Msg;
        }

    }
    @RequestMapping("/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)throws Exception{
        CheckCode cc= new CheckCode();
        //得到验证码图片
        BufferedImage image = cc.getImage();
        //获取验证码字符串
        check_Code = cc.getText();
        //将验证码存入Session
//        request.getSession().setAttribute("check_Code",check_Code);

        cc.output(image,response.getOutputStream());

    }
    @RequestMapping("/reg")
    @ResponseBody
    public String  register(User user) throws Exception{
        String msg = "1";
        try {
            userService.add(user);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping("/checkUser")
    @ResponseBody
    public String  checkUser(String resername) {
        String msg = "1";
        try {
            User user = userService.findByUname(resername);
            if (user!=null) {
                msg = "0";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
}
