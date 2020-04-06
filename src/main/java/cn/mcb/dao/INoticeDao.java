package cn.mcb.dao;


import cn.mcb.pojo.Customer;
import cn.mcb.pojo.Notice;
import org.apache.ibatis.annotations.*;
import org.aspectj.weaver.ast.Not;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface INoticeDao {
    /**查看所有公告
     *
     */
    @Select("select * from notice")
    public List<Notice> findAll();

    /**
     * 添加公告
     * @param notice
     */
    @Insert("insert into notice (ntitle,ncontent,nsender,ntime) value " +
            "(#{ntitle},#{ncontent},#{nsender},#{ntime})")
    public void add(Notice notice);

    /**
     * 修改公告
     * @param notice
     */
    @Update("update notice set ntitle=#{ntitle},ncontent=#{ncontent},nsender=#{nsender},ntime=#{ntime} where nid=#{nid}")
    public void update(Notice notice);

    /**
     * 删除公告
     * @param id
     */
    @Delete(" delete from notice where nid=#{id};")
    public void delete(int id);


    /**
     * 批量删除公告
     * @param listID
     */
    public void deleteSelect(@Param("ids")Integer[] ids);
    /**
     * 通过id查找
     * @param id
     * @return
     */
    @Select("select * from notice where nid=#{id}")
    public Notice findById(int id);

    /**
     * 通过姓名查找
     * @param ntitle
     * @return
     */
    public List<Notice> findByName( String ntitle);
}
