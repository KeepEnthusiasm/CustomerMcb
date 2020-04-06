package cn.mcb.utils;

import cn.mcb.pojo.Customer;
import cn.mcb.pojo.Notice;

import java.util.List;

public class PageNotice {
    private String code="0";
    private String msg;
    private int count;
    private List<Notice> noticeList;

    public PageNotice(String msg, int count, List<Notice> noticeList){

        this.msg=msg;
        this.count=count;
        this.noticeList=noticeList;
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

    public List<Notice> getNoticeList() {
        return noticeList;
    }

    public void setNoticeList(List<Notice> noticeList) {
        this.noticeList = noticeList;
    }
}
