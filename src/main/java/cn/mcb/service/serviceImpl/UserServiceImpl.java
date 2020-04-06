package cn.mcb.service.serviceImpl;

import cn.mcb.dao.IUserDao;
import cn.mcb.dao.daoImpl.UserDaoImpl;
import cn.mcb.pojo.Admin;
import cn.mcb.pojo.User;
import cn.mcb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("userServiceImpl")
public class UserServiceImpl implements IUserService {

    @Autowired
   private IUserDao userDao;

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public List<User> findAll() {

        return userDao.findAll();
    }

    @Override
    public void add(User user) {
        userDao.add(user);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public void delete(int id) {
        userDao.delete(id);
    }

    @Override
    public User findById(int id) {
       return userDao.findById(id);
    }

    @Override
    public List<User> findByName(String uname) {
        return userDao.findByName(uname);
    }

    @Override
    public void deleteSelect(Integer[] ids) {
    userDao.deleteSelect(ids);
    }

    @Override
    public void changeUstate(Integer id, String ustate) {
        userDao.changeUstate(id,ustate);
    }

    @Override
    public Admin findAdmin(String aname, String apassword) {
        return  userDao.findAdmin(aname,apassword);
    }

    @Override
    public User findByUname(String uname) {
        return userDao.findByUname(uname);
    }

    @Override
    public void updateMyUsser(String uname, String upassword, String uphone) {
        User user = userDao.findByUname(uname);
        user.setUpassword(upassword);
        user.setUphone(uphone);
        userDao.update(user);
    }

    @Override
    public String password(String uname, String upassword) {
        User user = new User(uname,upassword);
        User loginUser = userDao.login(user);
        if (loginUser==null){
            return "1";
        }else {
            return "0";
        }

    }
}
