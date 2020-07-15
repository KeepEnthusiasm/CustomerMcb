package cn.mcb.dao;

import cn.mcb.pojo.Admin;
import cn.mcb.pojo.Customer;
import cn.mcb.pojo.Notice;
import cn.mcb.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 用户接口
 */
@Repository
public interface IUserDao {
    /**
     * 登录，检测用户名和密码是否正确

     * @return
     */
    @Select("select * from user where uname=#{uname} and upassword=#{upassword}")
    public User login(User user);
    /**
     * 查询所有用户信息
     * @return
     */
    @Select("select * from user")
    public List<User> findAll();

    /**
     * 添加用户
     */
    @Insert("insert into user (uname,upassword,uphone,ustate) value (#{uname},#{upassword},#{uphone},#{ustate})")
    public void add(User user);
    /**
     * 修改用户
     */
    @Update("update user set uname=#{uname},upassword=#{upassword},uphone=#{uphone} where uid=#{uid}")
    public void update(User user);
    /**
     * 删除用户
     */
    @Delete(" delete from user where uid=#{id};")
    public void delete(int id);
    /**
     * 删除用户
     */
    public void deleteSelectForMap(List<Map> list);
    /**
     * 通过id查找
     * @param id
     * @return
     */
    @Select("select * from user where uid=#{id}")
    public User findById(int id);
    @Select("select * from user where uname=#{uname}")
    public User findByUname( String uname);

    /**
     * 通过姓名查找
     * @param ntitle
     * @return
     */
    public List<User> findByName( String uname);
    /**
     * 批量删除公告
     * @param listID
     */
    public void deleteSelect(@Param("ids")Integer[] ids);
    @Update("update user set ustate=#{ustate} where uid=#{id}")
    void changeUstate(@Param("id")Integer id,@Param("ustate") String ustate);

    @Select("select * from admin where aname=#{aname} and apassword=#{apassword}")
    public Admin findAdmin(@Param("aname")String aname,@Param("apassword")String apassword);
}
