package cn.mcb.utils;

import cn.mcb.pojo.Customer;

import java.util.List;

public class PageCustomer {
    //"code": 0,
    //  "msg": "",
    //  "count": 1000,
    //  "data": [{}, {}]
    private String code="0";
    private String msg;
    private int count;
    private List<Customer> customerList;

    public PageCustomer(String msg, int count, List<Customer> customerList){

        this.msg=msg;
        this.count=count;
        this.customerList=customerList;

    }    public String getCode() {
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

    public List<Customer> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<Customer> customerList) {
        this.customerList = customerList;
    }
}
