package cn.mcb.dao;

import cn.mcb.pojo.Customer;
import cn.mcb.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ICustomerDao {
    /**
     * 查询所有用户信息
     *
     * @return
     */
    @Select("select * from customer")
    public List<Customer> findAll();

    /**
     * 添加用户
     *  private int cid;
     *     private String cname;
     *     private int cage;
     *     private String cphone;
     *     private String cbirthday;
     *     private String ccreattime;
     *     private String caddress;
     *     private String cgender;
     *     private String cemail;
     *     private String clevel;
     */
    @Insert("insert into customer (cname,cage,cphone,cbirthday,ccreattime,caddress,cgender,cemail,clevel) value " +
            "(#{cname},#{cage},#{cphone},#{cbirthday},#{ccreattime},#{caddress},#{cgender},#{cemail},#{clevel})")
    public void add(Customer customer);
    /**
     * 修改用户
     */
    @Update("update customer set cname=#{cname},cphone=#{cphone},cbirthday=#{cbirthday},ccreattime=#{ccreattime}" +
            ",caddress=#{caddress},cgender=#{cgender},cemail=#{cemail},clevel=#{clevel},cage=#{cage} " +
            "where cid=#{cid}")
    public void update(Customer customer);
    /**
     * 删除用户
     */
    @Delete(" delete from customer where cid=#{id};")
    public void delete(int id);

    /**
     * 批量删除用户
     * @param listID
     */
    public void deleteSelect(@Param("ids")Integer[] ids);
    /**
     * 通过id查找
     * @param id
     * @return
     */
    @Select("select * from customer where cid=#{id}")
    public Customer findById(int id);

    /**
     * 通过姓名查找
     * @param cname
     * @return
     */
    public List<Customer> findByName( String cname);

    @Select("select * from customer where cage=#{cage}")
    public List<Customer> findByAge( int cage);
    @Select("select * from customer where clevel=#{clevel}")
    public List<Customer> findByLevel( String clevel);
    public List<Customer> findByAddress( String caddress);
    @Select("select * from customer where cphone=#{cphone}")
    public List<Customer> findByphone( String cphone);
    @Select("select * from customer where ccreattime=#{ccreattime}")
    public List<Customer> findBycreattime( String ccreattime);
}

