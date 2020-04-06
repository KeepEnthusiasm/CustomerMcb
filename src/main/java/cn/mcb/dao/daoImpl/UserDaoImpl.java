package cn.mcb.dao.daoImpl;

import cn.mcb.dao.IUserDao;
import cn.mcb.pojo.Admin;
import cn.mcb.pojo.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;
public class UserDaoImpl implements IUserDao {
    @Override
    public User login(User user) {
        return null;
    }

    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public void add(User user) {

    }

    @Override
    public void update(User user) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public User findById(int id) {
        return null;
    }

    @Override
    public List<User> findByName(String uname) {
        return null;
    }

    @Override
    public void deleteSelect(Integer[] ids) {

    }

    @Override
    public void changeUstate(Integer id, String ustate) {

    }

    @Override
    public Admin findAdmin(String aname, String apassword) {
        return null;
    }

    @Override
    public User findByUname(String uname) {
        return null;
    }

}
