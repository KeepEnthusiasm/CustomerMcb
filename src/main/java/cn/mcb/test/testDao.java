package cn.mcb.test;

import cn.mcb.dao.IUserDao;
import cn.mcb.pojo.User;
import cn.mcb.service.serviceImpl.UserServiceImpl;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.InputStream;
import java.util.List;

public class testDao {
//    @Autowired
//    public UserServiceImpl userDao1;
//    @Before
//    public void init(){
//        ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContextSpring.xml");
//
//    }
//    //findAll查询所有信息
//    @Test
//    public void findAll() {
//        List<User> users = userDao1.findAll();
//        for (User user:users) {
//            System.out.println(user);
//        }
//    }
//    @Test
//    public void add() {
//        User user = new User();
//        user.setUname("李四");
//        user.setUpassword("abc");
//        user.setUphone("15090227317");
//        user.setUstate("1");
//        userDao1.add(user);
//    }
//    @Test
//    public void update() {
//        User user = new User();
//        user.setUid(2);
//        user.setUname("wangw");
//        user.setUpassword("abc");
//        user.setUphone("15090227317");
//        user.setUstate("1");
//
//        userDao1.update(user);
//    }
//    @Test
//    public void delete() {
//        userDao1.delete(1);
//    }

}
