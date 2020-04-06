package cn.mcb.service.serviceImpl;

import cn.mcb.dao.ICustomerDao;
import cn.mcb.dao.INoticeDao;
import cn.mcb.pojo.Notice;
import cn.mcb.service.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class NoticeServiceImpl implements INoticeService {
    @Autowired
    private INoticeDao noticeDao;
    @Override
    public List<Notice> findAll() {
        return noticeDao.findAll();
    }

    @Override
    public void add(Notice notice) {
        noticeDao.add(notice);
    }

    @Override
    public void update(Notice notice) {
        noticeDao.update(notice);
    }

    @Override
    public void delete(int id) {
        noticeDao.delete(id);
    }

    @Override
    public Notice findById(int id) {
        return noticeDao.findById(id);
    }

    @Override
    public void deleteSelect(Integer[] Ids) {
        noticeDao.deleteSelect(Ids);
    }

    @Override
    public List<Notice> findByName(String ntitle) {
        return noticeDao.findByName(ntitle);
    }
}
