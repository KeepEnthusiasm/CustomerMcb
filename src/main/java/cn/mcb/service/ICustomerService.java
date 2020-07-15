package cn.mcb.service;

import cn.mcb.pojo.Customer;
import cn.mcb.utils.CustomerPlus;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    public List<Customer> findAll();

    public void add(Customer customer);

    public void update(Customer customer);

    public void delete(int id);

    public Customer findById(int id);

    public void deleteSelect(Integer[] Ids);

    public List<Customer> findByName( String cname);

    List<Customer> findByCondition(String text, String selectCondition);

    String importExcel(MultipartFile file);

    List<Customer> findByConditionForNew(HttpServletRequest httpServletRequest);

    Map selectDataCounts();
    Map selectCgenderAllCounts();

    Map selectClevelAllCounts();
    Map selectWeekEveryDayCounts();
}
