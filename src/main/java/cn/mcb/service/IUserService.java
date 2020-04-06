package cn.mcb.service;

import cn.mcb.pojo.Admin;
import cn.mcb.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserService {

    /**
     * 登录，检测用户名和密码是否正确
     * @param uname
     * @param upassword
     * @return
     */
    public User login(User user);
    /**
     * 查询所有用户信息
     * @return
     */
    public List<User> findAll();

    /**
     * 添加用户
     */
    public void add(User user);
    /**
     * 修改用户
     */
    public void update(User user);
    /**
     * 删除用户
     */
    public void delete(int id);
    public User findById(int id);
    public List<User> findByName( String uname);
    public void deleteSelect(Integer[] ids);

    void changeUstate(Integer id, String ustate);
    Admin findAdmin(String aname, String apassword);
    User findByUname(String uname);

    void updateMyUsser(String uname, String upassword, String uphone);

    String password(String uname, String upassword);
}
