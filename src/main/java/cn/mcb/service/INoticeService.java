package cn.mcb.service;

import cn.mcb.pojo.Customer;
import cn.mcb.pojo.Notice;

import java.util.List;

public interface INoticeService {
    public List<Notice> findAll();

    public void add(Notice notice);

    public void update(Notice notice);

    public void delete(int id);

    public Notice findById(int id);

    public void deleteSelect(Integer[] Ids);

    public List<Notice> findByName( String ntitle);
}
