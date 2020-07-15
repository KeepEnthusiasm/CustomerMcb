package cn.mcb.dao;

import cn.mcb.pojo.Customer;
import cn.mcb.pojo.User;
import cn.mcb.utils.CustomerPlus;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
    void addCusList(List<Customer> customers);

    List<Customer> findByConditionForNew(Map map);
    @Select("select count(*) from user")
    int selectUserCounts();
    @Select("select count(*) from customer")
    int selectCustomerCounts();
    @Select("select count(*) from notice")
    int selectNoticeCounts();
    @Select("SELECT count(*) FROM customer WHERE DATE(ccreattime) = CURDATE();")
    int selectcusDayConuts();
    @Select(" SELECT count(*) FROM customer WHERE DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= DATE(ccreattime)")
    int selectcusWeekConuts();
    @Select("SELECT count(*) FROM customer WHERE DATE_FORMAT( ccreattime, '%Y%m' ) = DATE_FORMAT( CURDATE( ) , '%Y%m' )")
    int selectcusMonthConuts();
    @Select("SELECT count(*) FROM customer WHERE YEAR(ccreattime)=YEAR(NOW());")
    int selectcusYearConuts();
    @Select("SELECT clevel ,COUNT(ALL cid) AS clevelcounts FROM customer GROUP BY (clevel)")
    List<Map> selectClevelAllCounts();
    @Select(" SELECT  cgender ,COUNT(ALL cid) AS cgendercounts FROM customer GROUP BY (cgender)")
    List<Map> selectCgenderAllCounts();
    @Select(" SELECT  ccreattime,COUNT(ALL cid) AS cuscounts\n" +
            "FROM customer\n" +
            "WHERE clevel='普通会员' and ccreattime>=DATE_ADD(NOW(),INTERVAL -7 DAY)\n" +
            "GROUP BY ccreattime")
    List<Map> selectWeekEveryDayCountsForNormal();
    @Select(" SELECT  ccreattime,COUNT(ALL cid) AS cuscounts\n" +
            "FROM customer\n" +
            "WHERE clevel='黄金会员' and ccreattime>=DATE_ADD(NOW(),INTERVAL -7 DAY)\n" +
            "GROUP BY ccreattime")
    List<Map> selectWeekEveryDayCountsForGold();
    @Select(" SELECT  ccreattime,COUNT(ALL cid) AS cuscounts\n" +
            "FROM customer\n" +
            "WHERE clevel='钻石会员' and ccreattime>=DATE_ADD(NOW(),INTERVAL -7 DAY)\n" +
            "GROUP BY ccreattime")
    List<Map> selectWeekEveryDayCountsForDiamond();
    @Select(" SELECT  ccreattime,COUNT(ALL cid) AS cuscounts\n" +
            "FROM customer\n" +
            "WHERE clevel='至尊会员' and ccreattime>=DATE_ADD(NOW(),INTERVAL -7 DAY)\n" +
            "GROUP BY ccreattime")
    List<Map> selectWeekEveryDayCountsForTop();
}

