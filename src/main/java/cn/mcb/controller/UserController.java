package cn.mcb.controller;

import cn.mcb.pojo.Notice;
import cn.mcb.pojo.User;
import cn.mcb.service.serviceImpl.NoticeServiceImpl;
import cn.mcb.service.serviceImpl.UserServiceImpl;
import cn.mcb.utils.PageNotice;
import cn.mcb.utils.PageUser;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 用户控制器
 */
@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userService;
    @RequestMapping("/selectUserList")
    @ResponseBody
    public PageUser selectNoticeList(@RequestParam(value = "pn",defaultValue = "1") Integer pn, int limit, String cname){
        PageHelper.startPage(pn,limit);
        List<User> userList = userService.findAll();
        String msg="1";
        PageInfo<User> pageInfo = new PageInfo<User>(userList,5);
        int counts = (int)pageInfo.getTotal();
        PageUser pageUser = new PageUser(msg,counts,userList);
        return pageUser;
    }

    @RequestMapping(value = "selectUserById",method = RequestMethod.GET)
    @ResponseBody
    public User selectUserById(Integer id){
        User user = userService.findById(id);
        return user;
    }
    @RequestMapping("updateUser")
    @ResponseBody
    public String updateUser(User user){

        String msg = "1";
        try {
            userService.update(user);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping(value = "deletUser")
    @ResponseBody
    public String deletUser(Integer id){
        String msg = "1";
        try {
            userService.delete(id);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping("addUser")
    @ResponseBody
    public String addUser(User user){
        String msg = "1";
        try {
            userService.add(user);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping(value = "deletSelectUser")
    @ResponseBody
    public String deletSelectUser(String[] ids){
        Integer[] dIds = (Integer[]) ConvertUtils.convert(ids, Integer.class);
        String msg = "1";
        try {
            userService.deleteSelect(dIds);
            msg = "0";
            System.out.println();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping("/selectByUname")
    @ResponseBody
    public PageUser selectByUname(@RequestParam(value = "pn",defaultValue = "1") Integer pn, int limit,String uname){
        PageHelper.startPage(pn,limit);
        List<User> userList = userService.findByName(uname);
        String msg="1";
        PageInfo<User> pageInfo = new PageInfo<User>(userList,5);
        int counts = (int)pageInfo.getTotal();
        PageUser pageUser = new PageUser(msg,counts,userList);
        return pageUser;
    }

    @RequestMapping(value = "changeUstate")
    @ResponseBody
    public String changeUstate(Integer id,String ustate){
        String msg = "1";
        try {
            userService.changeUstate(id,ustate);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping(value = "selectUser")
    @ResponseBody
    public User selectUse(String uname){
        try {
            User user = userService.findByUname(uname);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping("updateMyUser")
    @ResponseBody
    public String updateMyUser(String uname,String upassword,String uphone){

        String msg = "1";
        try {
            userService.updateMyUsser(uname,upassword,uphone);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping("password")
    @ResponseBody
    public String password(String uname,String upassword){
        String msg = "1";
        try {
            msg = userService.password(uname,upassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
}
