package cn.mcb.controller;

import cn.mcb.pojo.Customer;
import cn.mcb.service.serviceImpl.CustomerServiceImpl;
import cn.mcb.utils.PageCustomer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

@Controller

public class CustomerController {
    @Autowired
    private CustomerServiceImpl customerService;

    @RequestMapping("/selectListForLayui")
    @ResponseBody
    public PageCustomer findAllForLayui(@RequestParam(value = "pn",defaultValue = "1") Integer pn, int limit,String cname){
        PageHelper.startPage(pn,limit);
        List<Customer> customerList = customerService.findAll();
        String msg="1";
        PageInfo<Customer> pageInfo = new PageInfo<Customer>(customerList,5);
        int counts = (int)pageInfo.getTotal();
        PageCustomer pageCustomer = new PageCustomer(msg,counts,customerList);
        return pageCustomer;
    }
    @RequestMapping("addCustomer")
    @ResponseBody
    public String addCustomer(Customer customer){
        System.out.println("aa");
        String msg = "1";
        try {
            customerService.add(customer);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping(value = "deletCustomer")
    @ResponseBody
    public String deletCustomer(Integer id){
        String msg = "1";
        try {
            customerService.delete(id);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    //批量删除用户
    @RequestMapping(value = "deletSelectCustomer")
    @ResponseBody
    public String deletSelectCustomer(String[] ids){
        Integer[] delIds = (Integer[]) ConvertUtils.convert(ids, Integer.class);
        String msg = "1";
        try {
            customerService.deleteSelect(delIds);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping(value = "updateCustomer",method = RequestMethod.GET)
    @ResponseBody
    public Customer updateCustomer(Integer id){
        Customer findAfterCustomer = customerService.findById(id);
        return findAfterCustomer;
    }
    @RequestMapping("afterUpdateCustomer")
    @ResponseBody
    public String afterUpdateCustomer(Customer customer){
        String msg = "1";
        try {
            customerService.update(customer);
            msg = "0";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }
    @RequestMapping("/selectByCondition")
    @ResponseBody
    public PageCustomer selectByCondition(@RequestParam(value = "pn",defaultValue = "1") Integer pn, int limit,String text,String selectCondition){
        PageHelper.startPage(pn,limit);
        List<Customer> customerList = customerService.findByCondition(text,selectCondition);
        String msg="1";
        PageInfo<Customer> pageInfo = new PageInfo<Customer>(customerList,5);
        int counts = (int)pageInfo.getTotal();
        PageCustomer pageCustomer = new PageCustomer(msg,counts,customerList);
        return pageCustomer;
    }

}
