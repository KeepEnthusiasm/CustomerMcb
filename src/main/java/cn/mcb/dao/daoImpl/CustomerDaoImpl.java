package cn.mcb.dao.daoImpl;

import cn.mcb.dao.ICustomerDao;
import cn.mcb.pojo.Customer;

import java.util.List;

public class CustomerDaoImpl implements ICustomerDao {
    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public List<Customer> findAll() {
        return null;
    }

    @Override
    public void add(Customer customer) {

    }

    @Override
    public void update(Customer customer) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void deleteSelect(Integer[] ids) {

    }

    @Override
    public List<Customer> findByName(String cname) {
        return null;
    }

    @Override
    public List<Customer> findByAge(int cage) {
        return null;
    }

    @Override
    public List<Customer> findByLevel(String clevel) {
        return null;
    }

    @Override
    public List<Customer> findByAddress(String caddress) {
        return null;
    }

    @Override
    public List<Customer> findByphone(String cphone) {
        return null;
    }

    @Override
    public List<Customer> findBycreattime(String ccreattime) {
        return null;
    }
}
