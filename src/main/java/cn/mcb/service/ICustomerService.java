package cn.mcb.service;

import cn.mcb.pojo.Customer;

import java.util.List;

public interface ICustomerService {
    public List<Customer> findAll();

    public void add(Customer customer);

    public void update(Customer customer);

    public void delete(int id);

    public Customer findById(int id);

    public void deleteSelect(Integer[] Ids);

    public List<Customer> findByName( String cname);

    List<Customer> findByCondition(String text, String selectCondition);
}
