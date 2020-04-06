package cn.mcb.utils;

import cn.mcb.pojo.Notice;
import cn.mcb.pojo.User;

import java.util.List;

public class PageUser  {
    private String code="0";
    private String msg;
    private int count;
    private List<User> userList;
    public PageUser(String msg, int count,List<User> userList){
        this.msg=msg;
        this.count=count;
        this.userList=userList;
    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
}
