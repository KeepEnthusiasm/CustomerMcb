package cn.mcb.test;

import cn.mcb.dao.ICustomerDao;
import cn.mcb.dao.INoticeDao;
import cn.mcb.dao.IUserDao;
import cn.mcb.pojo.Admin;
import cn.mcb.pojo.Customer;
import cn.mcb.pojo.Notice;
import cn.mcb.pojo.User;
import cn.mcb.service.INoticeService;
import cn.mcb.service.serviceImpl.CustomerServiceImpl;
import cn.mcb.service.serviceImpl.NoticeServiceImpl;
import cn.mcb.service.serviceImpl.UserServiceImpl;
import cn.mcb.utils.CustomerPlus;
import org.aspectj.weaver.ast.Not;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class testSpring {
    ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContextSpring.xml");
    @Test
    public void springTest(){

//        UserServiceImpl us = ac.getBean("userServiceImpl", UserServiceImpl.class);
//        User user = new User();
//        user.setUname("admin");
//        user.setUpassword("123");
//        User admin = us.login(user);
//        System.out.println(admin);
        CustomerServiceImpl cs = ac.getBean("customerServiceImpl", CustomerServiceImpl.class);
        Customer customer = new Customer();
        customer.setCid(2);
        customer.setCname("黄飞鸿");
        customer.setCage(35);
        customer.setCgender("男");
        customer.setCaddress("深圳市");
        customer.setCbirthday("1982/04/09");
        customer.setCcreattime("2019/01/02");
        customer.setCemail("mayun@qq.com");
        customer.setClevel("普通会员");
        customer.setCphone("18239337778");
        cs.update(customer);

    }
    @Test
    public void testrun(){
        UserServiceImpl userService = ac.getBean("userServiceImpl", UserServiceImpl.class);
        Admin admin = userService.findAdmin("admin", "123");
        System.out.println(admin);

    }
    @Test
    public void test2(){
        CustomerServiceImpl serviceImpl = ac.getBean("customerServiceImpl", CustomerServiceImpl.class);
        String canme="马化腾";
        List<Customer> name = serviceImpl.findByName(canme);
        for (Customer customer:name){
            System.out.println(customer);
        }
    }
    @Test
    public void testStudy(){
        NoticeServiceImpl noticeDao= ac.getBean("noticeServiceImpl", NoticeServiceImpl.class);
        Notice notice = new Notice();
        notice.setNtitle("新手入职2");
        notice.setNcontent("入职前必看");
        notice.setNsender("马串串");
        notice.setNtime("2019-09-09");
        noticeDao.add(notice);
        List<Notice> notices = noticeDao.findAll();
        for (Notice n:notices){
            System.out.println(n);
        }
    }
    @Test
    public void tese3(){
         IUserDao userDao= ac.getBean("IUserDao", IUserDao.class);
        HashMap<String, String> map = new HashMap<>();
        HashMap<String, String> map2 = new HashMap<>();
        HashMap<String, String> map3 = new HashMap<>();
        map.put("uname","ccc");
        map2.put("uname","mcb");
        map3.put("uname","abc");
        ArrayList<Map> maps = new ArrayList<>();
        maps.add(map);
        maps.add(map2);
        maps.add(map3);
        System.out.println(maps);
        userDao.deleteSelectForMap(maps);
    }
    @Test
    public void tese4(){
        ICustomerDao userDao= ac.getBean("ICustomerDao", ICustomerDao.class);
        List<Map> maps = userDao.selectWeekEveryDayCountsForNormal();
        for (Map map:maps
             ) {
            System.out.println(map);
        }
    }

}
