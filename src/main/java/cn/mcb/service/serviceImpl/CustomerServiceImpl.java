package cn.mcb.service.serviceImpl;

import cn.mcb.dao.ICustomerDao;
import cn.mcb.pojo.Customer;
import cn.mcb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service("customerServiceImpl")
public class CustomerServiceImpl implements ICustomerService {
    @Autowired
    private ICustomerDao customerDao;
    @Override
    public List<Customer> findAll() {
        return customerDao.findAll();
    }

    @Override
    public void add(Customer customer) {
        customerDao.add(customer);
    }

    @Override
    public void update(Customer customer) {
        customerDao.update(customer);
    }

    @Override
    public void delete(int id) {
        customerDao.delete(id);
    }

    @Override
    public Customer findById(int id) {
        return customerDao.findById(id);
    }

    @Override
    public void deleteSelect(Integer[] ids) {
        customerDao.deleteSelect(ids);
    }

    @Override
    public List<Customer> findByName(String cname) {
       return customerDao.findByName(cname);
    }

    @Override
    public List<Customer> findByCondition(String text, String selectCondition) {
        switch(selectCondition){
            case "姓名" :
                return this.findByName(text);
            case "ID" :
                int Id = Integer.parseInt(text);
                Customer customer = this.findById(Id);
                List<Customer> listById= new ArrayList<Customer>();
                listById.add(customer);
                return listById;
            case "年龄" :
                int age = Integer.parseInt(text);
                return customerDao.findByAge(age);
            case "级别" :
                return customerDao.findByLevel(text);
            case "地址" :
                return customerDao.findByAddress(text);
            case "手机号" :
                return customerDao.findByphone(text);
            case "创建日期" :
                return customerDao.findBycreattime(text);
            case "" :
                return new ArrayList<Customer>();
        }
        return null;
    }

}
